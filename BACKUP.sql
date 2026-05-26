-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: api_portkboom
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `atributo_valores`
--

DROP TABLE IF EXISTS `atributo_valores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `atributo_valores` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `atributo_id` bigint unsigned NOT NULL,
  `valor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `atributo_valores_slug_unique` (`slug`),
  KEY `atributo_valores_atributo_id_foreign` (`atributo_id`),
  CONSTRAINT `atributo_valores_atributo_id_foreign` FOREIGN KEY (`atributo_id`) REFERENCES `atributos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `atributo_valores`
--

LOCK TABLES `atributo_valores` WRITE;
/*!40000 ALTER TABLE `atributo_valores` DISABLE KEYS */;
/*!40000 ALTER TABLE `atributo_valores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `atributos`
--

DROP TABLE IF EXISTS `atributos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `atributos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `atributos_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `atributos`
--

LOCK TABLES `atributos` WRITE;
/*!40000 ALTER TABLE `atributos` DISABLE KEYS */;
/*!40000 ALTER TABLE `atributos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avaliacoes`
--

DROP TABLE IF EXISTS `avaliacoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `avaliacoes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `produto_id` bigint unsigned NOT NULL,
  `usuario_id` bigint unsigned NOT NULL,
  `nota` int NOT NULL DEFAULT '5',
  `comentario` text COLLATE utf8mb4_unicode_ci,
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `avaliacoes_produto_id_foreign` (`produto_id`),
  KEY `avaliacoes_usuario_id_foreign` (`usuario_id`),
  CONSTRAINT `avaliacoes_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`),
  CONSTRAINT `avaliacoes_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avaliacoes`
--

LOCK TABLES `avaliacoes` WRITE;
/*!40000 ALTER TABLE `avaliacoes` DISABLE KEYS */;
/*!40000 ALTER TABLE `avaliacoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
INSERT INTO `cache` VALUES ('api_portkboom_cache_424f74a6a7ed4d4ed4761507ebcd209a6ef0937b','i:2;',1775705196),('api_portkboom_cache_424f74a6a7ed4d4ed4761507ebcd209a6ef0937b:timer','i:1775705196;',1775705196),('api_portkboom_cache_5c785c036466adea360111aa28563bfd556b5fba','i:4;',1766419581),('api_portkboom_cache_5c785c036466adea360111aa28563bfd556b5fba:timer','i:1766419581;',1766419581),('api_portkboom_cache_ultima_execucao_limpeza_tokens','O:25:\"Illuminate\\Support\\Carbon\":3:{s:4:\"date\";s:26:\"2026-04-09 03:22:49.849538\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:3:\"UTC\";}',1775705869);
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` bigint unsigned DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categorias_slug_unique` (`slug`),
  KEY `categorias_parent_id_foreign` (`parent_id`),
  CONSTRAINT `categorias_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categorias` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'Armazenamento','armazenamento',NULL,1,NULL,NULL,NULL),(2,'SSD Externo','ssd-externo',1,1,NULL,NULL,NULL),(3,'sdd portable','ssd-portable',2,1,NULL,NULL,NULL),(4,'Hardware','hardware',NULL,1,NULL,NULL,NULL),(5,'Placas de vídeo','Placas-de-video',4,1,NULL,NULL,NULL),(6,'NVIDIA GeForce','nvidia-geforce',5,1,NULL,NULL,NULL),(7,'Amd Radeon','amd-radeon',5,1,NULL,NULL,NULL),(8,'Intel ARC','intel-arc',5,1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cupom_categoria`
--

DROP TABLE IF EXISTS `cupom_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cupom_categoria` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `cupom_id` bigint unsigned NOT NULL,
  `categoria_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cupom_categoria_cupom_id_foreign` (`cupom_id`),
  KEY `cupom_categoria_categoria_id_foreign` (`categoria_id`),
  CONSTRAINT `cupom_categoria_categoria_id_foreign` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cupom_categoria_cupom_id_foreign` FOREIGN KEY (`cupom_id`) REFERENCES `cupons` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cupom_categoria`
--

LOCK TABLES `cupom_categoria` WRITE;
/*!40000 ALTER TABLE `cupom_categoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `cupom_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cupom_marca`
--

DROP TABLE IF EXISTS `cupom_marca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cupom_marca` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `cupom_id` bigint unsigned NOT NULL,
  `marca_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cupom_marca_cupom_id_foreign` (`cupom_id`),
  KEY `cupom_marca_marca_id_foreign` (`marca_id`),
  CONSTRAINT `cupom_marca_cupom_id_foreign` FOREIGN KEY (`cupom_id`) REFERENCES `cupons` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cupom_marca_marca_id_foreign` FOREIGN KEY (`marca_id`) REFERENCES `marcas` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cupom_marca`
--

LOCK TABLES `cupom_marca` WRITE;
/*!40000 ALTER TABLE `cupom_marca` DISABLE KEYS */;
/*!40000 ALTER TABLE `cupom_marca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cupom_produto`
--

DROP TABLE IF EXISTS `cupom_produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cupom_produto` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `cupom_id` bigint unsigned NOT NULL,
  `produto_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cupom_produto_cupom_id_foreign` (`cupom_id`),
  KEY `cupom_produto_produto_id_foreign` (`produto_id`),
  CONSTRAINT `cupom_produto_cupom_id_foreign` FOREIGN KEY (`cupom_id`) REFERENCES `cupons` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cupom_produto_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cupom_produto`
--

LOCK TABLES `cupom_produto` WRITE;
/*!40000 ALTER TABLE `cupom_produto` DISABLE KEYS */;
/*!40000 ALTER TABLE `cupom_produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cupons`
--

DROP TABLE IF EXISTS `cupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cupons` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `codigo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor_percentual` decimal(5,2) DEFAULT NULL,
  `valor_fixo` decimal(10,2) DEFAULT NULL,
  `uso_maximo` int DEFAULT NULL,
  `usos` int NOT NULL DEFAULT '0',
  `inicio` datetime DEFAULT NULL,
  `fim` datetime DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cupons_codigo_unique` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cupons`
--

LOCK TABLES `cupons` WRITE;
/*!40000 ALTER TABLE `cupons` DISABLE KEYS */;
/*!40000 ALTER TABLE `cupons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estoques`
--

DROP TABLE IF EXISTS `estoques`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estoques` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `produto_id` bigint unsigned NOT NULL,
  `localizacao_id` bigint unsigned NOT NULL,
  `quantidade` decimal(10,2) NOT NULL DEFAULT '0.00',
  `reservado` decimal(10,2) NOT NULL DEFAULT '0.00',
  `estoque_minimo` decimal(10,2) DEFAULT NULL,
  `estoque_maximo` decimal(10,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `estoques_produto_id_localizacao_id_unique` (`produto_id`,`localizacao_id`),
  KEY `estoques_localizacao_id_foreign` (`localizacao_id`),
  CONSTRAINT `estoques_localizacao_id_foreign` FOREIGN KEY (`localizacao_id`) REFERENCES `localizacoes_estoque` (`id`) ON DELETE CASCADE,
  CONSTRAINT `estoques_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estoques`
--

LOCK TABLES `estoques` WRITE;
/*!40000 ALTER TABLE `estoques` DISABLE KEYS */;
/*!40000 ALTER TABLE `estoques` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fornecedor_contatos`
--

DROP TABLE IF EXISTS `fornecedor_contatos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fornecedor_contatos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `fornecedor_id` bigint unsigned NOT NULL,
  `nome` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cargo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fornecedor_contatos_fornecedor_id_foreign` (`fornecedor_id`),
  CONSTRAINT `fornecedor_contatos_fornecedor_id_foreign` FOREIGN KEY (`fornecedor_id`) REFERENCES `fornecedores` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornecedor_contatos`
--

LOCK TABLES `fornecedor_contatos` WRITE;
/*!40000 ALTER TABLE `fornecedor_contatos` DISABLE KEYS */;
/*!40000 ALTER TABLE `fornecedor_contatos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fornecedores`
--

DROP TABLE IF EXISTS `fornecedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fornecedores` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cnpj_cpf` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `site` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logradouro` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numero` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `complemento` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bairro` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cidade` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cep` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornecedores`
--

LOCK TABLES `fornecedores` WRITE;
/*!40000 ALTER TABLE `fornecedores` DISABLE KEYS */;
/*!40000 ALTER TABLE `fornecedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fretes`
--

DROP TABLE IF EXISTS `fretes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fretes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `produto_id` bigint unsigned NOT NULL,
  `tipo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'normal',
  `custo` decimal(10,2) NOT NULL DEFAULT '0.00',
  `prazo_entrega` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fretes_produto_id_foreign` (`produto_id`),
  CONSTRAINT `fretes_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fretes`
--

LOCK TABLES `fretes` WRITE;
/*!40000 ALTER TABLE `fretes` DISABLE KEYS */;
/*!40000 ALTER TABLE `fretes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `localizacoes_estoque`
--

DROP TABLE IF EXISTS `localizacoes_estoque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `localizacoes_estoque` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descricao` text COLLATE utf8mb4_unicode_ci,
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `localizacoes_estoque`
--

LOCK TABLES `localizacoes_estoque` WRITE;
/*!40000 ALTER TABLE `localizacoes_estoque` DISABLE KEYS */;
/*!40000 ALTER TABLE `localizacoes_estoque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marcas`
--

DROP TABLE IF EXISTS `marcas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marcas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `descricao` text COLLATE utf8mb4_unicode_ci,
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `marcas_nome_unique` (`nome`),
  UNIQUE KEY `marcas_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marcas`
--

LOCK TABLES `marcas` WRITE;
/*!40000 ALTER TABLE `marcas` DISABLE KEYS */;
/*!40000 ALTER TABLE `marcas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000000_create_users_table',1),(2,'0001_01_01_000001_create_cache_table',1),(3,'0001_01_01_000002_create_jobs_table',1),(4,'0001_01_01_000003_create_personal_access_tokens_table',1),(5,'2025_05_31_162837_produtos_categorias_tags_historico copy',1),(6,'2025_05_31_162838_produtos_imagens',1),(7,'2025_05_31_162839_atributos_e_relacao com produtos',1),(8,'2025_05_31_162840_avaliaçoes_produtos',1),(9,'2025_05_31_162841_promoções_cupom_estoque__frete__dimensoes',1),(10,'2025_05_31_162842_promoções_cupom_estoque_frete_',1),(11,'2025_05_31_162843_pedidos_pedidos-itens',1),(12,'2025_12_19_130859_add_data_nascimento_to_users_table',2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movimentacoes_estoque`
--

DROP TABLE IF EXISTS `movimentacoes_estoque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movimentacoes_estoque` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `estoque_id` bigint unsigned DEFAULT NULL,
  `localizacao_id` bigint unsigned DEFAULT NULL,
  `usuario_id` bigint unsigned DEFAULT NULL,
  `tipo` enum('ENTRADA','SAIDA','AJUSTE','RESERVA','DEVOLUCAO') COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantidade` decimal(10,2) NOT NULL,
  `observacao` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `movimentacoes_estoque_estoque_id_foreign` (`estoque_id`),
  KEY `movimentacoes_estoque_localizacao_id_foreign` (`localizacao_id`),
  KEY `movimentacoes_estoque_usuario_id_foreign` (`usuario_id`),
  CONSTRAINT `movimentacoes_estoque_estoque_id_foreign` FOREIGN KEY (`estoque_id`) REFERENCES `estoques` (`id`) ON DELETE SET NULL,
  CONSTRAINT `movimentacoes_estoque_localizacao_id_foreign` FOREIGN KEY (`localizacao_id`) REFERENCES `localizacoes_estoque` (`id`) ON DELETE SET NULL,
  CONSTRAINT `movimentacoes_estoque_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimentacoes_estoque`
--

LOCK TABLES `movimentacoes_estoque` WRITE;
/*!40000 ALTER TABLE `movimentacoes_estoque` DISABLE KEYS */;
/*!40000 ALTER TABLE `movimentacoes_estoque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido_itens`
--

DROP TABLE IF EXISTS `pedido_itens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido_itens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `pedido_id` bigint unsigned NOT NULL,
  `produto_id` bigint unsigned NOT NULL,
  `quantidade` int NOT NULL,
  `preco_unitario` decimal(10,2) NOT NULL,
  `subtotal_unitario` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pedido_itens_pedido_id_foreign` (`pedido_id`),
  KEY `pedido_itens_produto_id_foreign` (`produto_id`),
  CONSTRAINT `pedido_itens_pedido_id_foreign` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `pedido_itens_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido_itens`
--

LOCK TABLES `pedido_itens` WRITE;
/*!40000 ALTER TABLE `pedido_itens` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedido_itens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `usuario_id` bigint unsigned DEFAULT NULL,
  `total` decimal(10,2) NOT NULL,
  `transportadora` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `codigo_rastreamento` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data_envio` timestamp NULL DEFAULT NULL,
  `data_entrega` timestamp NULL DEFAULT NULL,
  `status_envio` enum('PENDENTE','ENVIADO','ENTREGUE','DEVOLVIDO') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'PENDENTE',
  `tipo_frete` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custo_frete` decimal(10,2) NOT NULL DEFAULT '0.00',
  `prazo_entrega_frete` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pedidos_usuario_id_foreign` (`usuario_id`),
  CONSTRAINT `pedidos_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1232 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto_atributo_valor`
--

DROP TABLE IF EXISTS `produto_atributo_valor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto_atributo_valor` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `produto_id` bigint unsigned NOT NULL,
  `atributo_valor_id` bigint unsigned NOT NULL,
  `unidade_id` bigint unsigned DEFAULT NULL,
  `detalhe_extra` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `produto_atributo_valor_produto_id_foreign` (`produto_id`),
  KEY `produto_atributo_valor_atributo_valor_id_foreign` (`atributo_valor_id`),
  KEY `produto_atributo_valor_unidade_id_foreign` (`unidade_id`),
  CONSTRAINT `produto_atributo_valor_atributo_valor_id_foreign` FOREIGN KEY (`atributo_valor_id`) REFERENCES `atributo_valores` (`id`),
  CONSTRAINT `produto_atributo_valor_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`),
  CONSTRAINT `produto_atributo_valor_unidade_id_foreign` FOREIGN KEY (`unidade_id`) REFERENCES `unidades` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_atributo_valor`
--

LOCK TABLES `produto_atributo_valor` WRITE;
/*!40000 ALTER TABLE `produto_atributo_valor` DISABLE KEYS */;
/*!40000 ALTER TABLE `produto_atributo_valor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto_historicos`
--

DROP TABLE IF EXISTS `produto_historicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto_historicos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `produto_id` bigint unsigned NOT NULL,
  `usuario_id` bigint unsigned NOT NULL,
  `alteracoes` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `produto_historicos_produto_id_foreign` (`produto_id`),
  KEY `produto_historicos_usuario_id_foreign` (`usuario_id`),
  CONSTRAINT `produto_historicos_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `produto_historicos_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Todo histórico do produto, categoria, tags, qualquer campo que houve alteração em json';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_historicos`
--

LOCK TABLES `produto_historicos` WRITE;
/*!40000 ALTER TABLE `produto_historicos` DISABLE KEYS */;
/*!40000 ALTER TABLE `produto_historicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto_imagens`
--

DROP TABLE IF EXISTS `produto_imagens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto_imagens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `produto_id` bigint unsigned NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `principal` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `produto_imagens_produto_id_foreign` (`produto_id`),
  CONSTRAINT `produto_imagens_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_imagens`
--

LOCK TABLES `produto_imagens` WRITE;
/*!40000 ALTER TABLE `produto_imagens` DISABLE KEYS */;
/*!40000 ALTER TABLE `produto_imagens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto_tag`
--

DROP TABLE IF EXISTS `produto_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto_tag` (
  `produto_id` bigint unsigned NOT NULL,
  `tag_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  UNIQUE KEY `produto_tag_produto_id_tag_id_unique` (`produto_id`,`tag_id`),
  KEY `produto_tag_tag_id_foreign` (`tag_id`),
  CONSTRAINT `produto_tag_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `produto_tag_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_tag`
--

LOCK TABLES `produto_tag` WRITE;
/*!40000 ALTER TABLE `produto_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `produto_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtos`
--

DROP TABLE IF EXISTS `produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `codigo_barras` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nome` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descricao` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `informacao_tecnica` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `preco` decimal(10,2) NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `categoria_id` bigint unsigned NOT NULL,
  `marca_id` bigint unsigned NOT NULL,
  `fornecedor_id` bigint unsigned NOT NULL,
  `peso` decimal(8,2) DEFAULT NULL,
  `largura` decimal(8,2) DEFAULT NULL,
  `altura` decimal(8,2) DEFAULT NULL,
  `comprimento` decimal(8,2) DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `produtos_sku_unique` (`sku`),
  UNIQUE KEY `produtos_slug_unique` (`slug`),
  KEY `produtos_categoria_id_foreign` (`categoria_id`),
  KEY `produtos_marca_id_foreign` (`marca_id`),
  KEY `produtos_fornecedor_id_foreign` (`fornecedor_id`),
  CONSTRAINT `produtos_categoria_id_foreign` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `produtos_fornecedor_id_foreign` FOREIGN KEY (`fornecedor_id`) REFERENCES `fornecedores` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `produtos_marca_id_foreign` FOREIGN KEY (`marca_id`) REFERENCES `marcas` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos`
--

LOCK TABLES `produtos` WRITE;
/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
/*!40000 ALTER TABLE `produtos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promocao_categoria`
--

DROP TABLE IF EXISTS `promocao_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promocao_categoria` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `promocao_id` bigint unsigned NOT NULL,
  `categoria_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `promocao_categoria_promocao_id_foreign` (`promocao_id`),
  KEY `promocao_categoria_categoria_id_foreign` (`categoria_id`),
  CONSTRAINT `promocao_categoria_categoria_id_foreign` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`) ON DELETE CASCADE,
  CONSTRAINT `promocao_categoria_promocao_id_foreign` FOREIGN KEY (`promocao_id`) REFERENCES `promocoes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promocao_categoria`
--

LOCK TABLES `promocao_categoria` WRITE;
/*!40000 ALTER TABLE `promocao_categoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `promocao_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promocao_marca`
--

DROP TABLE IF EXISTS `promocao_marca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promocao_marca` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `promocao_id` bigint unsigned NOT NULL,
  `marca_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `promocao_marca_promocao_id_foreign` (`promocao_id`),
  KEY `promocao_marca_marca_id_foreign` (`marca_id`),
  CONSTRAINT `promocao_marca_marca_id_foreign` FOREIGN KEY (`marca_id`) REFERENCES `marcas` (`id`) ON DELETE CASCADE,
  CONSTRAINT `promocao_marca_promocao_id_foreign` FOREIGN KEY (`promocao_id`) REFERENCES `promocoes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promocao_marca`
--

LOCK TABLES `promocao_marca` WRITE;
/*!40000 ALTER TABLE `promocao_marca` DISABLE KEYS */;
/*!40000 ALTER TABLE `promocao_marca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promocao_produto`
--

DROP TABLE IF EXISTS `promocao_produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promocao_produto` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `promocao_id` bigint unsigned NOT NULL,
  `produto_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `promocao_produto_promocao_id_foreign` (`promocao_id`),
  KEY `promocao_produto_produto_id_foreign` (`produto_id`),
  CONSTRAINT `promocao_produto_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`) ON DELETE CASCADE,
  CONSTRAINT `promocao_produto_promocao_id_foreign` FOREIGN KEY (`promocao_id`) REFERENCES `promocoes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promocao_produto`
--

LOCK TABLES `promocao_produto` WRITE;
/*!40000 ALTER TABLE `promocao_produto` DISABLE KEYS */;
/*!40000 ALTER TABLE `promocao_produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promocoes`
--

DROP TABLE IF EXISTS `promocoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promocoes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descricao` text COLLATE utf8mb4_unicode_ci,
  `desconto_percentual` decimal(5,2) DEFAULT NULL,
  `desconto_valor` decimal(10,2) DEFAULT NULL,
  `inicio` datetime NOT NULL,
  `fim` datetime NOT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promocoes`
--

LOCK TABLES `promocoes` WRITE;
/*!40000 ALTER TABLE `promocoes` DISABLE KEYS */;
/*!40000 ALTER TABLE `promocoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('0SzOiWA9abX1Epc30J57pLFMg6BNpaU6iUlnvDV6',NULL,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoicndnRnVaemt4M1UxalZiWGRSTk00akUybmpJUFdXM3hFV085VXplUyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vYXBpLnBvcnRrYm9vbS5sb2NhbGhvc3Qvc2FuY3R1bS9jc3JmLWNvb2tpZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1766430855),('0TVOB1IOsIuOO1uAC1KJfITMhdZPLtsTIQ0uhfn5',NULL,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiaDRZS0FDcUg2THhGN2RWcEFST1h6aEU3Nnl5UG5YcDNWaXAzaVRLbyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vYXBpLnBvcnRrYm9vbS5sb2NhbGhvc3Qvc2FuY3R1bS9jc3JmLWNvb2tpZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1766417334),('0w0FdHEaiQTCbHAabi8iyz3IQIWVII0cMCdmwBcW',NULL,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiZUwxekJDTThyYjg2dVk0TDVjb2h5VGFLY0pnbFU2N0NaZzN2dnJrayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vYXBpLnBvcnRrYm9vbS5sb2NhbGhvc3Qvc2FuY3R1bS9jc3JmLWNvb2tpZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1766419226),('3as293j0l2eUvyPRQq7sJZ01I74D8KkGfB3GRk27',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiUHBmSHNycUNMcVhlbDJFOFY2UUVTQ0RRVlJzbDd6a2Jadm9Lb3pneSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vYXBpLnBvcnRrYm9vbS5sb2NhbGhvc3Qvc2FuY3R1bS9jc3JmLWNvb2tpZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1766413403),('3dcBuEOHMcZio2tguIWtbj9cWDhDhNWYs4FU7Iwa',NULL,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiM1FQbEd4UFdNMkIyYVZIRFRqTUp2NU1FNERJVElTNG01eGt5elhSOCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vYXBpLnBvcnRrYm9vbS5sb2NhbGhvc3Qvc2FuY3R1bS9jc3JmLWNvb2tpZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1766413102),('5obDgpIsHpr0QUNSNvnGLMECzctxkyF6NBJR6U3J',NULL,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiZHdBck1SczFsem0zZEYxMEFjYmJ3T2ZqNXRpekJZNTFJbFJrc2p2dCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vYXBpLnBvcnRrYm9vbS5sb2NhbGhvc3Qvc2FuY3R1bS9jc3JmLWNvb2tpZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1766410990),('5U4Lu72aEMr1FKCnJlyKpJCOkLupUt084e2uLo3m',NULL,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiVnNYbWd4TzZjTlBCUHRSVEhPWE1hT0l4TzlYcE83eXZ3M0tlc0lGVyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vYXBpLnBvcnRrYm9vbS5sb2NhbGhvc3Qvc2FuY3R1bS9jc3JmLWNvb2tpZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1766410189),('6mAST9WgfoOP5kXOpqhDPA5jgk19n0cxJyev3fep',NULL,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiOExvdVJKVDVnSmVBZ2JldjVhQ1pYQkVIWnc5cWd5UWhvS1FjMDBaQSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vYXBpLnBvcnRrYm9vbS5sb2NhbGhvc3Qvc2FuY3R1bS9jc3JmLWNvb2tpZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1766412920),('6RohsZZ6HvMv5BVnLzwHVt9bPYMV5T8TzgiHxX04',NULL,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiakhLSkF3UEhkU08wSDFXV1M2OHhPU3J6cGp4QzJwZW4wQTl4d3VZUCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vYXBpLnBvcnRrYm9vbS5sb2NhbGhvc3Qvc2FuY3R1bS9jc3JmLWNvb2tpZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1766409896),('6ScyfYqfz50MERnEj14QFvsX37VkJo5eFirl8AKk',NULL,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoieHl2OHV1RUM1dW9Db2tTQVdLQlBUVzZGbzZpd3hVMWxXaUkzMnBEMSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vYXBpLnBvcnRrYm9vbS5sb2NhbGhvc3Qvc2FuY3R1bS9jc3JmLWNvb2tpZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1766410988),('7D2GzaPWXYBq7lNncfJEiUpVtsWYsrTCGOZ68J9A',NULL,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiSEk5a2pwbzZKajhuRmF4QzVQQmNSVDZ1WmdQMlluVjlYbHhOYW1nSCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vYXBpLnBvcnRrYm9vbS5sb2NhbGhvc3Qvc2FuY3R1bS9jc3JmLWNvb2tpZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1766409992),('9ewYAuZ6FBW6y6ER06s7r2t6gEdr97WKtG8anPf6',NULL,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiZTlFb0FIRnVmdlpqUk9rYTlzMTNZekdycWVmUVVkbXVQZ1NRbHNhUiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vYXBpLnBvcnRrYm9vbS5sb2NhbGhvc3Qvc2FuY3R1bS9jc3JmLWNvb2tpZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1766417559),('9oEE7gm9CdaXtmCKiz5iUvLB2Xl67xi0qdVJTkSG',NULL,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoibG05TzZ1Qm80RnhZVDlMcTk4SUdxTVFZaHFKdXB5MTJhRUhDdExYRiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vYXBpLnBvcnRrYm9vbS5sb2NhbGhvc3Qvc2FuY3R1bS9jc3JmLWNvb2tpZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1766411160),('ahKroiWIaPoXbCnd38FAwBY8pFCROBtJaWrKrriJ',NULL,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoicW0yN1NUaXFwZU82V0w1VmZEUFNCM2t6a0FZamllUU5hV3BYMWg4RSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vYXBpLnBvcnRrYm9vbS5sb2NhbGhvc3Qvc2FuY3R1bS9jc3JmLWNvb2tpZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1766417558),('AkJKS8goNIk12xZfRIWeijgLr5mBj87T3yST5iiC',NULL,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiTXFOMDVydXBDWXUzcndzOU1va25CWURNRmhGZ3VRcld0RFY4aEUxdCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vYXBpLnBvcnRrYm9vbS5sb2NhbGhvc3Qvc2FuY3R1bS9jc3JmLWNvb2tpZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1766430330),('AKmdL5Luw9qMSEyrZQV9j7dZ2C0lqkArNv96sgp5',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoibVFWWjJaR0w5eGlDV0VtZTRQN0QyV3cwTDMycjFWaUFCS3RQZnZzOCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vYXBpLnBvcnRrYm9vbS5sb2NhbGhvc3Qvc2FuY3R1bS9jc3JmLWNvb2tpZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1766413399),('aKWMne8llats8NPJDM3Ve9Obap0G9IprCXCvQyIL',NULL,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoialBOYVpIdUpYZEVMR3JlNnhCREh0d1Q5TTkzVFV4M3dTb2FkU0kxeSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vYXBpLnBvcnRrYm9vbS5sb2NhbGhvc3Qvc2FuY3R1bS9jc3JmLWNvb2tpZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1766410648),('aPQH1LTcnpNreT3xyhCcgY4fhtZ6YR1C4eadI5B7',NULL,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoicXRKVk9VRDhFcmRBaEZVVno5UEV0ZThmWjlEckhRSEtCa1gwWDFjOSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vYXBpLnBvcnRrYm9vbS5sb2NhbGhvc3Qvc2FuY3R1bS9jc3JmLWNvb2tpZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1766409785),('asnxETexOIwbYurAA8tDPmmd0dSYk6OxGPqWgdtH',NULL,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiSUZtdGZaN1N1NEtCbm90bGlVN3RJY2xlS3dFblhIOWVoVjF0ZGxWTCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vYXBpLnBvcnRrYm9vbS5sb2NhbGhvc3Qvc2FuY3R1bS9jc3JmLWNvb2tpZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1766414585),('b8sdjz19ZweaUFc9OQUuioxDiDsdt594rHcD0rcX',NULL,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiQWNmSUlpZ0h4YXAwR2Nkb3M2c3RodVpjVjR3ZlJpWjZRSU40Nk1KRiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vYXBpLnBvcnRrYm9vbS5sb2NhbGhvc3Qvc2FuY3R1bS9jc3JmLWNvb2tpZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1766407812),('bNZkl0k2X0lYmIP51wbqFxqdcso2gmHa1E1qpxdX',NULL,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiaVo0Z3VNMk5DTVZva0w5MVJSc3d5Rm5oQjZaMUdVOUV0b1FsZnBWZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vYXBpLnBvcnRrYm9vbS5sb2NhbGhvc3Qvc2FuY3R1bS9jc3JmLWNvb2tpZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1766417600),('BQiLs9uno2MHKVHLiPZ6XP42h1W6o7oi8mm9j5cb',NULL,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiTUJKUmo2YUVBOFE1blJGS0RjdExTSnIzUEJOMHZWOEdRRTRIcW4yQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vYXBpLnBvcnRrYm9vbS5sb2NhbGhvc3Qvc2FuY3R1bS9jc3JmLWNvb2tpZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1766413970),('Bzs2lnn3wSEFDfafzDN33m67i8tES6nz9DWww1p4',NULL,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiajhGZ0xqRzZMYXFsOUZyemd2Y292cGY1SDZWWUoyUTJoS2RXWlZmRiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vYXBpLnBvcnRrYm9vbS5sb2NhbGhvc3Qvc2FuY3R1bS9jc3JmLWNvb2tpZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1766408552),('CFNqKbPvWXm2A2Of5DElBg6EcWWok7vxdh6BtO3q',NULL,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoibTRjdElDWEFxWlVEdHdJOUZBMEtIbkJXQ1pqdEhRUm9mb1VsUWY1dSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vYXBpLnBvcnRrYm9vbS5sb2NhbGhvc3Qvc2FuY3R1bS9jc3JmLWNvb2tpZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1766409283),('ciyrwu6rttqhoUoVFC0YeSGqNzQmHryhWuxsHNbS',NULL,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoicVlFUHdzWnZ3Qk52T2JlZXdXVUpxUjVCN2o4dzJ5YTVvNVNBelQ2cyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vYXBpLnBvcnRrYm9vbS5sb2NhbGhvc3Qvc2FuY3R1bS9jc3JmLWNvb2tpZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1766413037),('CUArnsJtYbErKjYUUgW3cKbHk9zOj1idGprXahl2',NULL,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiV1ZPTGd2aUY4cjd4MVp3U29WSlpEMGtOZjJQUzJna1dSeThmaHhOTCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vYXBpLnBvcnRrYm9vbS5sb2NhbGhvc3Qvc2FuY3R1bS9jc3JmLWNvb2tpZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1766417039),('cUOK3utH5wqz5otyu4M1Jd9gJMtllZBinw81MANJ',NULL,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ3ZFcVlGMEZoalg2QzNqMjl2NGRRSlhST2hSR2t2MWI1YldCcjNESCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vYXBpLnBvcnRrYm9vbS5sb2NhbGhvc3Qvc2FuY3R1bS9jc3JmLWNvb2tpZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1766408250),('D6cb38Ennm7oc4IY40KWdELpQV7nVPlAGXfuPKXm',NULL,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiMWRGcW9iYzllMjBGWDZXcXFCSHFTUmxiaTNvNXJ1QkVXNjRkWTN0TSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vYXBpLnBvcnRrYm9vbS5sb2NhbGhvc3Qvc2FuY3R1bS9jc3JmLWNvb2tpZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1766409836),('d9E3wEdl1cFnpSIlb79PHk84pVWuoqHdN0vcLYfs',NULL,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiV0dhVEExaFV0b2tjcW93VERIdjA2ZkxNZXdZWHFGZ3VWS3Jjem95SCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vYXBpLnBvcnRrYm9vbS5sb2NhbGhvc3Qvc2FuY3R1bS9jc3JmLWNvb2tpZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1766413195),('dDAbyRcbRt8NFIqCVnTv9UgoiCaxuuGOp5jluan4',NULL,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiOFR5MWpwM2Uxa3pQdUxMTmZZcWthZmRxb05vcktRNVJuNUE3Nk55RiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vYXBpLnBvcnRrYm9vbS5sb2NhbGhvc3Qvc2FuY3R1bS9jc3JmLWNvb2tpZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1766412814),('drXHAdmRI5YxrMELbVZ7Iz2tcZQ3AZ7Q8nB0j1In',NULL,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiV3ZYSlhEOTFXaVJGSnVNbXFmSUMyYkZUTUFqVDIzS1BlVkRxZDBwYSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vYXBpLnBvcnRrYm9vbS5sb2NhbGhvc3Qvc2FuY3R1bS9jc3JmLWNvb2tpZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1766413981),('DSCadLZnvaGvucylFiY4L9EOlxvMis72Cs9RFHF1',NULL,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiMGphc2lPZ2NLOUhXU2lLQmpSM3I2RW5KT09EWEhkcGd6MlVGZlpyUSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vYXBpLnBvcnRrYm9vbS5sb2NhbGhvc3Qvc2FuY3R1bS9jc3JmLWNvb2tpZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1766410178),('DxQizVC3HSHQkLpYHsfA2V2halLPn26pFTnqRkug',NULL,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoialRjMFZPSk5qWEpNNW9DbUdIbTZKUlNqcWhvQkJvZDA2TEF3cUo3aCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vYXBpLnBvcnRrYm9vbS5sb2NhbGhvc3Qvc2FuY3R1bS9jc3JmLWNvb2tpZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1766411022),('e2jdCZqWe6DwBWsnJNVEduKzuzvgh94QglDmNbqE',NULL,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoidkZNM3ZqOUtKclhHT0xvMGRDWnd4U2lpNjk0dmNEUkpIekIzYzNjayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vYXBpLnBvcnRrYm9vbS5sb2NhbGhvc3Qvc2FuY3R1bS9jc3JmLWNvb2tpZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1766418453),('eFv9IjOoF10LnUGY5W2EMVIO3A6OrwXB9ypx2rpp',NULL,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiZE11cE5ua1pBNFQ1TnJaS3NRM1lhVmJoZ1JjWHdTaE14c0J4ZHBDQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vYXBpLnBvcnRrYm9vbS5sb2NhbGhvc3Qvc2FuY3R1bS9jc3JmLWNvb2tpZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1766429547),('fAtWtKSwCxAK3sgdVNc62M0IlRz6dyHIDG46BuU1',NULL,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiaUh0eG93MnJqS0RjWllnRUJwcEdUbDlsd2txMW9JYThoNDQ3cWw0biI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vYXBpLnBvcnRrYm9vbS5sb2NhbGhvc3Qvc2FuY3R1bS9jc3JmLWNvb2tpZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1766417494),('FiMlmyMZdbmKd87yqi9W192JAe9lAZ0K4lbk3Mp1',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiV3R6VksycUU3NzJCdTlrelUwaGY0S00ydHVGMndOT2ZUOElmOFVBcSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vYXBpLnBvcnRrYm9vbS5sb2NhbGhvc3Qvc2FuY3R1bS9jc3JmLWNvb2tpZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1766416106),('fqEsgSjapFtLSZMITT20JZ6g4nqUOxyR7ShixBv3',NULL,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiYUpYUlR3SWFjQURtNmFSbHRIc2ZGUGVUb0l2cFV0SmptR1dXdkpRTiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vYXBpLnBvcnRrYm9vbS5sb2NhbGhvc3Qvc2FuY3R1bS9jc3JmLWNvb2tpZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1766411904),('g0LtLI1yyacSn9NovJpTDmA12Dl929USMgfEyu0y',NULL,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiYTBxaWxyaDAyd21aSElyZFp2Z0RtUkJhNmVFaktMcjVSU0tpdWZ0YSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vYXBpLnBvcnRrYm9vbS5sb2NhbGhvc3Qvc2FuY3R1bS9jc3JmLWNvb2tpZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1766417835),('g3f4uYb3UOk4N0kyuwSKiiJXvWzgiOFidIDH2CnJ',NULL,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiVGJ3eHJvV3pMRVVydkxHcFV0VzJTM3E5dkU1dkNHN0FjcVdwQzlmSyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vYXBpLnBvcnRrYm9vbS5sb2NhbGhvc3Qvc2FuY3R1bS9jc3JmLWNvb2tpZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1766411310),('g3wfyVrFb3KbQtnuSkrpOazJ5Xgg5Itc10gRK2Eu',NULL,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoidXM2SmFra3piNTFCaGN1VHJKZkZpVHdFS0I2Zml0NjZYbUJJdVl6YSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vYXBpLnBvcnRrYm9vbS5sb2NhbGhvc3Qvc2FuY3R1bS9jc3JmLWNvb2tpZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1766411067),('G6TFpWwxF6WrugPim7hvVIowosRG2kZL2ep6XJiS',NULL,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiUUgxRXAwdG84T2V5YnJZeGhSUTdjVVNCcW9OUUlWUmxGeFpocXV5dyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vYXBpLnBvcnRrYm9vbS5sb2NhbGhvc3Qvc2FuY3R1bS9jc3JmLWNvb2tpZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1766414567),('gUyUupcRvM1wla5o9mGRCqTj5ThuuWftWa0vin2u',NULL,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoidXBpT1dhU3dnTVUzemlhYWQxZklUdkRsU1o1MGdsMkZOdXhyaExoMCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vYXBpLnBvcnRrYm9vbS5sb2NhbGhvc3Qvc2FuY3R1bS9jc3JmLWNvb2tpZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1766410095),('gVuOMlJ5QSJT9f1kGKs5ibFe9IpX9uKaCLoTfBJQ',NULL,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiY2U3cGV1SFFSQ09kNHNmWENxUGFpVmRZakxRendjTUh3QjhWSnpLeiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vYXBpLnBvcnRrYm9vbS5sb2NhbGhvc3Qvc2FuY3R1bS9jc3JmLWNvb2tpZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1766411070),('Hl1SyjYHYmBNmSW4jzsr8TDiZvSWHMPxuhDVvcPU',NULL,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiSEh1MUpFcDBKU3RmcWhzYnNRZFA4YWpLS0lGS3UwZ2lnQ0tSWFdwMiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vYXBpLnBvcnRrYm9vbS5sb2NhbGhvc3Qvc2FuY3R1bS9jc3JmLWNvb2tpZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1766418067),('IplQYP3fQWNv6VpQRH6VoVr5GJKEjcWqObhlMzEj',NULL,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiSmlGMHp0NEV6aFRxeUVoVVgwbW1FZGt0cVdza2lwQzdRRTR1b2R1NSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vYXBpLnBvcnRrYm9vbS5sb2NhbGhvc3Qvc2FuY3R1bS9jc3JmLWNvb2tpZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1766410662),('IvTEZBoMBTKrHWxWAv8q9DJaWuSnzNMdYJdtVyqI',NULL,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiS0JqaXRIWDFLU2t6eXFxRUlxVEVuekhRajZLNTJ5WFI5d1JvMEF0biI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vYXBpLnBvcnRrYm9vbS5sb2NhbGhvc3Qvc2FuY3R1bS9jc3JmLWNvb2tpZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1775704969),('J9YGR8bgtY5fHrnJ8eS3DHsABF9N1V7ommluLL3x',NULL,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoieUp0OExIb0t4NmZFMkh4djBZSm80MUFFWVBVSFhGT29xY0JwRW1FeCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vYXBpLnBvcnRrYm9vbS5sb2NhbGhvc3Qvc2FuY3R1bS9jc3JmLWNvb2tpZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1766414183),('JEXOTLFt2FnHX9bX3Be9Cvoro9S4cmIQBnYkWxQL',NULL,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiWUNEcklCcm1Kbk1NekJUeUZGVEVEejRGVjFibHpndmR2SXhSZlJFciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vYXBpLnBvcnRrYm9vbS5sb2NhbGhvc3Qvc2FuY3R1bS9jc3JmLWNvb2tpZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1766410814),('JmCb4sTOHibLUHu5c9ixLot1MzoLuftEjjPRLntY',NULL,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiSThMSzRPQ1laRVNJMFRjcTVvQjlFcEFtY3VPbzNDTnlPYjlaQnZsTyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vYXBpLnBvcnRrYm9vbS5sb2NhbGhvc3Qvc2FuY3R1bS9jc3JmLWNvb2tpZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1766407517),('JP7xrbWwDmdgpmBTh5WdGnbIwL7NyVuLPxeXHtFW',NULL,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoibDdoVnNQbzRZc0dmYVZYbk5vMEFwNUlINVJMYzdQM0k5ZmhDSnYyRiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vYXBpLnBvcnRrYm9vbS5sb2NhbGhvc3Qvc2FuY3R1bS9jc3JmLWNvb2tpZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1766408709),('Jpxj7lSuuNC3cO0YeqwIMQmiC0jA4jUi837tAqGO',NULL,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiWE9JbEV2WHpVUUFvM1BDUXoxUnJ4djhyRjFEOXh3Z0tSak5BdklYTSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vYXBpLnBvcnRrYm9vbS5sb2NhbGhvc3Qvc2FuY3R1bS9jc3JmLWNvb2tpZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1766408752),('KFxBSdqzujygSX3E6ECAbNCujSOjCPmTQFt7W72Z',NULL,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoieFdSWE5uY1hMNEhHdUNmMXZaNjYxYW4yNHBzdnluVjNPcmxjd3JraiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vYXBpLnBvcnRrYm9vbS5sb2NhbGhvc3Qvc2FuY3R1bS9jc3JmLWNvb2tpZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1766418074),('KiUQQIpihfGZVSsYlD4jLt7TjqkfM4kFvXlgJgJf',NULL,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ3ZzMXZhdkxmcHdnOURxd00xR1JPMUhlZU9yRkRKc01ORmYxMG9vUSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vYXBpLnBvcnRrYm9vbS5sb2NhbGhvc3Qvc2FuY3R1bS9jc3JmLWNvb2tpZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1766410928),('kMShKYqL3hA45GgIWdGgZje5rJovG06Qn9bGPWDm',NULL,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiUTdFeEdEQ2JQQXYwdEJmdU90eFZtOUNVWkdDU3NHek9wbElUTzZJeiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vYXBpLnBvcnRrYm9vbS5sb2NhbGhvc3Qvc2FuY3R1bS9jc3JmLWNvb2tpZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1766411475),('L1D8QaSEqGbEdUkLkHIvVzIpHjRX90d9vtsOXPQ0',NULL,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoieEFpTHVUQ05GZUdyNTBObGlGdVVCUzl0UDdpSnBhZUJoTlV2d0JlZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vYXBpLnBvcnRrYm9vbS5sb2NhbGhvc3Qvc2FuY3R1bS9jc3JmLWNvb2tpZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1766407651),('lIpux29BkC0JyI5L0anhzHdYLJuideSdZQMlekFr',NULL,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ2Vld3NNU0lyV2xiNnRTbmFmY2RTVWN0R2NYT001b2k1czVXWThsNyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vYXBpLnBvcnRrYm9vbS5sb2NhbGhvc3Qvc2FuY3R1bS9jc3JmLWNvb2tpZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1766409446),('LiqPl50hqGsFgw90dyIsrJCkYUrZOMkMkhUWlbSj',NULL,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoieEJZYVhiRmRReHR1cHlMRGZoc05LNmlxd2F4Sjdkb1RKblNETFhzbCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vYXBpLnBvcnRrYm9vbS5sb2NhbGhvc3Qvc2FuY3R1bS9jc3JmLWNvb2tpZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1766418202),('LPR1WbMV3NmeRgRWRF1YlnENKVTQ0FGPk2gD71Au',NULL,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiODB5UHF4bkxtT0FqTnpCVkZJT1RZb2VobkViT1RNejZ6R1dOQ3hhQSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vYXBpLnBvcnRrYm9vbS5sb2NhbGhvc3Qvc2FuY3R1bS9jc3JmLWNvb2tpZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1766414496),('m430OJZHeyhCC8nrDdRXF0ZFkeu52EMco92KAgS3',NULL,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiYkIwaVVub1JreHR4MldPYlhjZmdhTVR6MTVZZlZYU1FLRkRSTWVrcCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vYXBpLnBvcnRrYm9vbS5sb2NhbGhvc3Qvc2FuY3R1bS9jc3JmLWNvb2tpZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1766410997),('mAUYoUaJFs7IBVwtMuGp6oo2rCzReFQIGJ7FCLIp',NULL,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiRmRaQVlZb1E4bVhtaXd5R2JEdThpeXp3NWpyREJSWWREME9CZ043MyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vYXBpLnBvcnRrYm9vbS5sb2NhbGhvc3Qvc2FuY3R1bS9jc3JmLWNvb2tpZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1766407615),('Mc3vSdhOVhxLyFdZpKhQ0OVqH6YgfGthA5e8peIM',NULL,'::1','Mozilla/5.0 (iPhone; CPU iPhone OS 16_0 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/17.5 Mobile/15A5370a Safari/602.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoiOEZ6R1pCaXZvVVlEUk00WVh5bk1DNXZkdTR3cUtWQUJjd21pQlZLeiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vYXBpLnBvcnRrYm9vbS5sb2NhbGhvc3Qvc2FuY3R1bS9jc3JmLWNvb2tpZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1766430430),('Mkp2WRM1A8oXb7CrBeZ17Gmq5ZlI7940xK5uGvPO',NULL,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiMFlnWWV0N0tSNkJTRm5USkdCZGl2bVZGbFpGWUgwUE9VdHY1RjhHVCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vYXBpLnBvcnRrYm9vbS5sb2NhbGhvc3Qvc2FuY3R1bS9jc3JmLWNvb2tpZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1766412938),('MMmr5BcZ82qn1f4UdYfkNakoYeIW0vLt0SeWfJZ4',NULL,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiQVplbHh1YjZEa3RxN2ppMHNVc0Z2cDBqY0p1T3h1NDhENXE1dHp5RyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vYXBpLnBvcnRrYm9vbS5sb2NhbGhvc3Qvc2FuY3R1bS9jc3JmLWNvb2tpZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1766407868),('MnrtgjBwcmkNSEXWICTAzowazkT9m85qslsY6i80',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiNUlINllBd212dWNmZDBYYUFFVzByZjNDdmxJbVZpSGdvYkxiTkZaVCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vYXBpLnBvcnRrYm9vbS5sb2NhbGhvc3Qvc2FuY3R1bS9jc3JmLWNvb2tpZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1766413483),('MpVh8lVsOBbotnETXqmAmM0mVBn45k868159fry6',NULL,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiSkNUa1phcXpvY1BHYjBnenZvNWtHc2xJSEJaMTA5VFVlUHVBRjZZYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vYXBpLnBvcnRrYm9vbS5sb2NhbGhvc3Qvc2FuY3R1bS9jc3JmLWNvb2tpZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1766419310),('MtEfcTOafSmVenJxJIfjsMdtzxIXTDJthCzCL6a2',NULL,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiWGxlZG1ldk9xNG1xeGh5aFVxNlFQM1VGRThsWHNjTnVPU3p5NlRUZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vYXBpLnBvcnRrYm9vbS5sb2NhbGhvc3Qvc2FuY3R1bS9jc3JmLWNvb2tpZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1766408201),('MY4oee3Nb096KqzB1gyYUPcKDqs2XMU5iXIYC3Xg',NULL,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiRXRaYXdqY2N5elFScFBETXRrRklKNWxOOFhIcFgxR1VoakVWZ0ZNMSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vYXBpLnBvcnRrYm9vbS5sb2NhbGhvc3Qvc2FuY3R1bS9jc3JmLWNvb2tpZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1766417730),('MYUHMqjdqz4kYq5012P3ekoMyRKk9lCEHrGrymBM',NULL,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiUjVFMjd3cnFlRDAzVmlCVG5IS3p4NmVJZkVMYVUxUklQSjFENTNBZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vYXBpLnBvcnRrYm9vbS5sb2NhbGhvc3Qvc2FuY3R1bS9jc3JmLWNvb2tpZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1766429491),('NhaBixOLFowK6Q4iTJ50BDexfsGUWHj70K6UYyA1',NULL,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiMEJsVXdGWUNxUmJYS0dhM2dYbWdEMElrc1dzcnh4bDZ5cXNSeFlXMyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vYXBpLnBvcnRrYm9vbS5sb2NhbGhvc3Qvc2FuY3R1bS9jc3JmLWNvb2tpZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1766407623),('NvIYJY0yiLV8GZjlqPsC5AZdObzimYNKJQoIw2re',NULL,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoibFliWmZzWXBjMW9Mc290YXg5SVpOalI3NFRaOUplUFp4ZlkyWk1uTyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vYXBpLnBvcnRrYm9vbS5sb2NhbGhvc3Qvc2FuY3R1bS9jc3JmLWNvb2tpZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1766411606),('nyf43lvYhrbD4MJteGtiBPE0uPVZ4hDuYNmDDjyU',NULL,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiN0RMaUp2eE4xOGZXY1ZmaGIza29lSkh5Q1ozcjBrMmtLdzRGNWFJNyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vYXBpLnBvcnRrYm9vbS5sb2NhbGhvc3Qvc2FuY3R1bS9jc3JmLWNvb2tpZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1766410541),('O1ZGSDUKQFykt31PoybbVO3MjK42IOOsyPu5ZNGi',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiZFU1V2JhdVN4SmZPUTB0azVBY1RKazl0MWxVOUVaYkZwZzlucmtnbyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vYXBpLnBvcnRrYm9vbS5sb2NhbGhvc3Qvc2FuY3R1bS9jc3JmLWNvb2tpZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1766416032),('onNCRPYuDGSyEwERoLJ0NBqQk9YZ4e2MXbUNnrkK',NULL,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiRmZISlpTNGdwbWxjWGRXdHZ6Q0p1NDdwTVlBVnBzUks5TUV4Y0Y4ayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vYXBpLnBvcnRrYm9vbS5sb2NhbGhvc3Qvc2FuY3R1bS9jc3JmLWNvb2tpZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1766411733),('ozE92lKjTMkBjwSmKCPrRWC12bYPTtYHIUGevOkc',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiN2tlZVY1Y0FjTzNMdVhiNHIxd0FDMklwVUk3YnljczVQNTlQa0trciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vYXBpLnBvcnRrYm9vbS5sb2NhbGhvc3Qvc2FuY3R1bS9jc3JmLWNvb2tpZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1766415766),('PC3APKIxnHbBB59BiItCMa5SlfsLoKNoHNEzE6bP',NULL,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiNTJmSk8waTNFcUlPd050TlB0V3dwQnZrakR6SG93NVFSWThEZm1vRyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vYXBpLnBvcnRrYm9vbS5sb2NhbGhvc3Qvc2FuY3R1bS9jc3JmLWNvb2tpZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1766410088),('pfLIh1LeMuQ3bHzQUdJjygE7TbUaXVQ578pS7qT0',NULL,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiNER3bUsweFplZEVXcmVNMWw4WFVSSkt0cVNZYzFiN1hBUDFYd3pFMCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vYXBpLnBvcnRrYm9vbS5sb2NhbGhvc3Qvc2FuY3R1bS9jc3JmLWNvb2tpZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1766418450),('PFuKHkXhLOmk3uvIaehh5qbfqClxcTE3Dc7L3RoB',NULL,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoib3VjUmg4ODZSc05NTDJQOUFwTDU3YnZBazh5SEZCWmZwcThFWWsyWSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vYXBpLnBvcnRrYm9vbS5sb2NhbGhvc3Qvc2FuY3R1bS9jc3JmLWNvb2tpZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1766418491),('pZdzBL0oNH3DhXyy2YWp59RbPdw46RmZ7bZK3f57',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiQTc2YTlKZXJPODNhQndlazZUZ2ZjNGp3cDNaM0RGaGJDWXhSUlZoUCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vYXBpLnBvcnRrYm9vbS5sb2NhbGhvc3Qvc2FuY3R1bS9jc3JmLWNvb2tpZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1766419436),('QFuI0guX04vcRQMKtVHm4gnsG5wiMYCz4MibwQmJ',NULL,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoieGFhT0xUbHhROVlMWk9TaDVMYmlDNjRnQ0xINUxUN3lGbnFIUk1XdSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vYXBpLnBvcnRrYm9vbS5sb2NhbGhvc3Qvc2FuY3R1bS9jc3JmLWNvb2tpZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1766419286),('QNUuXtbBi6KfzesMc8gKHarcqyPvekkuAHkRACgw',NULL,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiUER3Ukh1dDJMb2oxTUpDd2xHMzBwVVY0aUxBdEw2YzlRQjdUak1QbSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vYXBpLnBvcnRrYm9vbS5sb2NhbGhvc3Qvc2FuY3R1bS9jc3JmLWNvb2tpZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1766414690),('QotZTp6crBaptkU58fGcaeytpLat3kH3C2mRIqvd',NULL,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiaXhSeTZNZEtvemRxN3k5QjJWMVQzdmsyNUk5SnVEaXh6bkQ1VDlENCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vYXBpLnBvcnRrYm9vbS5sb2NhbGhvc3Qvc2FuY3R1bS9jc3JmLWNvb2tpZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1766415743),('QUgxPUx0JXEDBZ1cwTk6WZB7xvBrNMfomjxl4V9b',NULL,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiWnl0ZlN3elhqazVNWEVSUVFmSjJZSWs3S2FTckFzeGVQeGpPMkE2ayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vYXBpLnBvcnRrYm9vbS5sb2NhbGhvc3Qvc2FuY3R1bS9jc3JmLWNvb2tpZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1766411594),('rJxFONpv7Oa2wbuJKL0MNHTZbniXWjMlmgcPIWsL',NULL,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiWU9XV1BkVE80ek15VmUyeTdySmh0U3RUdWdjU1Y0ZWJoMjN4VHROZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vYXBpLnBvcnRrYm9vbS5sb2NhbGhvc3Qvc2FuY3R1bS9jc3JmLWNvb2tpZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1766418294),('rlAigghcuFBKMJzGzqVDflGMpUqYLUSTo2jeuOlH',NULL,'::1','Mozilla/5.0 (iPhone; CPU iPhone OS 15_0 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/17.5 Mobile/15A5370a Safari/602.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoiYmFWQlU3UXhhVDIxNkJ2TkVVSTZoc3J5VXY3d2FlSHFNRkM2c24xNSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vYXBpLnBvcnRrYm9vbS5sb2NhbGhvc3Qvc2FuY3R1bS9jc3JmLWNvb2tpZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1766430335),('RNf4vZGpW1TbiIf3waNeYXkszv5SNN3mXSb69D09',NULL,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiaXhrbTVxeWUwR1hvd0ZPRHBhaURxdXJkZ2szTU51bGltdlljZ2lsUCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vYXBpLnBvcnRrYm9vbS5sb2NhbGhvc3Qvc2FuY3R1bS9jc3JmLWNvb2tpZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1766410732),('S382VlnmyXLGXAdGzgzPrNq2XdcmZtgzuG9KdjJb',NULL,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoibVZHM29EOU9OZm9IVUZHV21meTlYMGI0QVhTMWZtekRISWVTTnVCeiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vYXBpLnBvcnRrYm9vbS5sb2NhbGhvc3Qvc2FuY3R1bS9jc3JmLWNvb2tpZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1766408500),('s7g55WlB2Om5XugBgPAeOTQIDPQcP6YnIenIUYDc',NULL,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiemF6amxTWUFubGJ0U0Q3SHBsOWtiU2RGT0hpTHpmc3hMU3ljSGNJUCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vYXBpLnBvcnRrYm9vbS5sb2NhbGhvc3Qvc2FuY3R1bS9jc3JmLWNvb2tpZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1766419104),('sgZxcQTN6bIkeXuCEBBmJfYRSGMk3M6eyFDcarpq',NULL,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiVGlGUnAyTFJBS3ExVTRSMmFjQ0hqdGtFdDJralNMZU9JWXJjQVhqUiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vYXBpLnBvcnRrYm9vbS5sb2NhbGhvc3Qvc2FuY3R1bS9jc3JmLWNvb2tpZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1766411390),('SrukbiMvtt6bMhfQ2RctqOLu4QqrDAH0pBfH7fDB',NULL,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiMDZRamt4THNmaXk2ZEZJbGJySXF5aVVYUjRJdlMxMWxtVXl4T0xXeCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vYXBpLnBvcnRrYm9vbS5sb2NhbGhvc3Qvc2FuY3R1bS9jc3JmLWNvb2tpZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1766409259),('TgwG6ci5vKkw56ZKHLcV9BwP9ZwVI1ZEPjTAFwS3',NULL,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoienA2VW9YZHZ1QmpPUTRZM1hJM21PWllDYlBONTVSM2lMRHNNTTBySiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vYXBpLnBvcnRrYm9vbS5sb2NhbGhvc3Qvc2FuY3R1bS9jc3JmLWNvb2tpZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1766408090),('TjOYAdTQHdXmaMdFetlEmodGQ3QhKOfMoG1b1IuJ',NULL,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiTzNMQjRxeEM1ZmZyUU1pOTBvUkUxRzU5YnlxYmhBTHc3cTdZWFVqeSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vYXBpLnBvcnRrYm9vbS5sb2NhbGhvc3Qvc2FuY3R1bS9jc3JmLWNvb2tpZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1766413176),('toWSLooOPBG1EYKmyy44jEkg7WXNDsr5SS1FYlvb',NULL,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiT3h2U3dnNnZ5UVZCcTFSQVhtWlF4VzZ5QTBnVG5XZms1QzY1TjRGSSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vYXBpLnBvcnRrYm9vbS5sb2NhbGhvc3Qvc2FuY3R1bS9jc3JmLWNvb2tpZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1766410001),('tqrZUUUfjtCegA0EtYCNhyHHux6ZYcp8qDggpJ9N',NULL,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiV1UzcjlYcnljU25RZG5LTk5sRVBjb0hxWllsamZ0aDY1ejB6ZlFKNSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vYXBpLnBvcnRrYm9vbS5sb2NhbGhvc3Qvc2FuY3R1bS9jc3JmLWNvb2tpZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1766408826),('tsOjEwy4gxegmaa0A1xgkPoHKpijYKbUAnrrbxdQ',NULL,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoibU5yZVNTWWJFM3dYbVVTYk4yRDAycUJycm9ib2tnSGwwbUY4SFFYSSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vYXBpLnBvcnRrYm9vbS5sb2NhbGhvc3Qvc2FuY3R1bS9jc3JmLWNvb2tpZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1766410660),('tzeN7SUkrcLMCyly3Fa7yxgduDwWBjkwJDsCNjq1',NULL,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiUjJmREpSZHJoVHZzNVdmdk9xRUxWcG9lbkJFdUxveUxpcTM3M1R5SSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vYXBpLnBvcnRrYm9vbS5sb2NhbGhvc3Qvc2FuY3R1bS9jc3JmLWNvb2tpZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1766411714),('UDqJrA12JpcqxjtbqXLro2GesQjDaiCcoJDUOAWk',NULL,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiVFRHWkY1aHVYS3BvMXVaN2d2ZjRsaEg0VWd5OUFPbWo0dUdkTUZ5RiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vYXBpLnBvcnRrYm9vbS5sb2NhbGhvc3Qvc2FuY3R1bS9jc3JmLWNvb2tpZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1766414596),('VCNqK65XojVBoxsw8L97F0qQOQ6Cpm86RSLyh1iN',NULL,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiaUpUMG1nbGJHMzlTbnVWRVRBZGR0R2l5WG5JYUFIV0xZS21DSGNXOSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vYXBpLnBvcnRrYm9vbS5sb2NhbGhvc3Qvc2FuY3R1bS9jc3JmLWNvb2tpZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1766429703),('vF7DEQY1tHxHQImUgUO2V3q2xdDY7N0WCfnAtFcT',NULL,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoibVBHRjNKMXJCU1RKdW9VN09jRWdkbER1Qm1uYTFXMHR2OVZVOHh5NyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vYXBpLnBvcnRrYm9vbS5sb2NhbGhvc3Qvc2FuY3R1bS9jc3JmLWNvb2tpZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1766415539),('w4wudBa5A1lkrvDGnj01ClhGXwzx2sAJKSlUNqv7',NULL,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiNzhnWFZvNXliY2pyZTBVZ3I0TkNMb0pGQ0NSNW5xYVN4VGJJN29ySCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vYXBpLnBvcnRrYm9vbS5sb2NhbGhvc3Qvc2FuY3R1bS9jc3JmLWNvb2tpZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1766419117),('wZrwevBvv5R0avcAuvj3q4ce8fNu7f8qYwr3QoaN',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ3dMaXlHam1sckdBSFFWaHoxUGRuSWVNYUZBRHg3U1FSZlpvd3JvYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vYXBpLnBvcnRrYm9vbS5sb2NhbGhvc3Qvc2FuY3R1bS9jc3JmLWNvb2tpZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1766415560),('WZXaygG3BwdoCAGd04fAh7cC0MHL12TIQIa1GPJE',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiWEVLeHV4RmtGbUZkaUpBZm1OVjB0bGJCYjFWeUcyMjI3aHhXR1RINCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vYXBpLnBvcnRrYm9vbS5sb2NhbGhvc3Qvc2FuY3R1bS9jc3JmLWNvb2tpZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1766413383),('x93cb8yqYThwaXzMjiL583YG8jn4Sbp3LxXKQthJ',NULL,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiVm02cEFaOG1RbTk3ckEzMzlkdWJ1UWVpc0NtNFg0Wlc2VjRTWXRoViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vYXBpLnBvcnRrYm9vbS5sb2NhbGhvc3Qvc2FuY3R1bS9jc3JmLWNvb2tpZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1766407687),('xAQT5FN8zuYVRrhIJytMGy1iH4mWQqR73omavRi0',NULL,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiMXZhN1I3aDJ3dUhqejU4RXg0Y2UzS21CdnVCTFZKN09hYTVVTFgyYSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vYXBpLnBvcnRrYm9vbS5sb2NhbGhvc3Qvc2FuY3R1bS9jc3JmLWNvb2tpZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1766408619),('XlxTXYtLFoczpsFiuyUbei1AoJSCet2ObTtzbOaY',NULL,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoidkhIaVpHOEVXZlpDNWNHRE5Bd2hnaklKOVNZMUVlWDR0S3NkV2FzYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vYXBpLnBvcnRrYm9vbS5sb2NhbGhvc3Qvc2FuY3R1bS9jc3JmLWNvb2tpZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1766419127),('XPTr4muVIJHo0K92gbOXBT5MSdZBZw8GVidiIBfz',NULL,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiWXRtc1RTSnl6WnBDVXNrY21zWGE0Mnc5T2FRUExUZEVOT3dWTGxzMSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vYXBpLnBvcnRrYm9vbS5sb2NhbGhvc3Qvc2FuY3R1bS9jc3JmLWNvb2tpZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1766418418),('XyTr5oB8F2Zk3Xa7qcsVQjPV4CAiGyAjfb9u6mn8',NULL,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiR0hXWGhWZ2tIMlNiTENJTjkyVWlyRXBWdXhxQXlnUFNRczNkekRyUiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vYXBpLnBvcnRrYm9vbS5sb2NhbGhvc3Qvc2FuY3R1bS9jc3JmLWNvb2tpZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1766410729),('YRRYc85pYUyaWfLaY0hRturwtspbLYt8UjeCR7lG',NULL,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoibXZaTGo2emFudjlRSGZRZWx4WGhXQm10eHl3THdseUthbXBUZ2ZndiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vYXBpLnBvcnRrYm9vbS5sb2NhbGhvc3Qvc2FuY3R1bS9jc3JmLWNvb2tpZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1766419299),('YuCLbf54FOdUb1qew5fvOIq9tCQedl8kNYkOpmGm',NULL,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiTHRGRVJlWEVUTEdrbnJOYlRMYjRQZ0JBSE1NcXFiM0RRZ3JxTGlJdyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vYXBpLnBvcnRrYm9vbS5sb2NhbGhvc3Qvc2FuY3R1bS9jc3JmLWNvb2tpZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1766418233),('zKprtB1ZRhCfS2mCkGxDLFmhXnk35NEDcFaNFQbO',NULL,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiOEZzbnh2QU5CdEpDTWx0V0lhQk9HbEpkRDNTa2UxOXRKR0EzelVZOSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vYXBpLnBvcnRrYm9vbS5sb2NhbGhvc3Qvc2FuY3R1bS9jc3JmLWNvb2tpZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1766408522),('ZQs2mUeENrkjOJ8CxLopcjGR8kpQpj9NvUIDPrBu',NULL,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiUFM1aU5YT1lpakJOSlZpQjBSelp1dFk1SjNvamxjalBQSnh2ZEdXUiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vYXBpLnBvcnRrYm9vbS5sb2NhbGhvc3Qvc2FuY3R1bS9jc3JmLWNvb2tpZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1766412775),('Zv7VO0t2cnuOcttlQ7CHT6N3qzuvuBx2VqcmIaiG',NULL,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiY2pXUTlNNGo3Q0I0cVlzUFFCaDVXWG90V0JSbGIxYjluSldHUFYwQSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHBzOi8vYXBpLnBvcnRrYm9vbS5sb2NhbGhvc3Qvc2FuY3R1bS9jc3JmLWNvb2tpZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1766414175);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tags_nome_unique` (`nome`),
  UNIQUE KEY `tags_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unidades`
--

DROP TABLE IF EXISTS `unidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unidades` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `codigo` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nome` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `simbolo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `descricao` text COLLATE utf8mb4_unicode_ci,
  `tipo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fator_conversao` decimal(10,6) DEFAULT NULL,
  `unidade_base_id` bigint unsigned DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unidades_codigo_unique` (`codigo`),
  KEY `unidades_unidade_base_id_foreign` (`unidade_base_id`),
  CONSTRAINT `unidades_unidade_base_id_foreign` FOREIGN KEY (`unidade_base_id`) REFERENCES `unidades` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidades`
--

LOCK TABLES `unidades` WRITE;
/*!40000 ALTER TABLE `unidades` DISABLE KEYS */;
/*!40000 ALTER TABLE `unidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo_pessoa` enum('pf','pj') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pf',
  `data_nascimento` date DEFAULT NULL,
  `cpf_cnpj` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `inscricao_estadual` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile_photo_path` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_cpf_cnpj_unique` (`cpf_cnpj`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Empresaaaaaaaaaaaaaa','testepj1231@teste.com',NULL,'$2y$12$x.l27QBDOl2kskjwIWvhAuekz0.ZT3MEqqWyplhNwAm4OPsyLBzWG','pj',NULL,'16732617000131',NULL,'6799928545',NULL,NULL,'2025-07-18 05:38:18','2025-07-18 05:38:18'),(10,'TESTANDO','djloiiw@hotmail.com',NULL,'$2y$12$YacMPIisUtJC6K7c5XyOJedThodSzZKR79S3wf5LtDc2B1Gc6Gcg.','pf','1995-02-09','05759988140',NULL,'5123125123',NULL,NULL,'2025-12-22 19:05:28','2025-12-22 19:05:28');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-19 15:39:54
