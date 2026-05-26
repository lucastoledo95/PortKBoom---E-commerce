import { Injectable, signal, inject } from '@angular/core';
import { DomSanitizer, SafeHtml } from '@angular/platform-browser';

export type NotificationType = 'success' | 'error' | 'info';

export interface Notification {
  id: number;
  type: NotificationType;
  message: string;
  safeMessage?: SafeHtml;
  timeout?: number;
  html?: boolean;
}

@Injectable({ providedIn: 'root' })
export class NotificationService {
  private counter = 0;
  private sanitizer = inject(DomSanitizer);
  readonly notifications = signal<Notification[]>([]);

  private sanitizeHtml(html: string): SafeHtml {
    const allowed = html
      .replace(/<(?!br\s*\/?|b>|\/b>|strong>|\/strong>|i>|\/i>|em>|\/em>)[^>]+>/gi, '')
      .replace(/on\w+="[^"]*"/gi, '')
      .replace(/on\w+='[^']*'/gi, '')
      .replace(/javascript:/gi, '');
    return this.sanitizer.bypassSecurityTrustHtml(allowed);
  }

  private add(type: NotificationType, message: string, timeout = 5000, options?: { html?: boolean }) {
    const id = this.counter++;

    const noti: Notification = {
      id, type, message, timeout, html: options?.html ?? false,
      safeMessage: options?.html ? this.sanitizeHtml(message) : undefined
    };

    this.notifications.update(n => [...n, noti]);

    setTimeout(() => this.remove(id), timeout);
  }

  success(msg: string, timeout?: number, options?: { html?: boolean }) {
    this.add('success', msg, timeout, options);
  }

  error(msg: string, timeout?: number, options?: { html?: boolean }) {
    this.add('error', msg, timeout, options);
  }

  info(msg: string, timeout?: number, options?: { html?: boolean }) {
    this.add('info', msg, timeout, options);
  }

  remove(id: number) {
    this.notifications.update(n => n.filter(notif => notif.id !== id));
  }
}
