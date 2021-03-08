-- phpMyAdmin SQL Dump
-- version 3.2.0.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 02, 2015 at 06:19 AM
-- Server version: 5.1.36
-- PHP Version: 5.3.0

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `bookstore`
--

-- --------------------------------------------------------

--
-- Table structure for table `books_tbl`
--

CREATE TABLE IF NOT EXISTS `books_tbl` (
  `bookid` int(10) NOT NULL AUTO_INCREMENT,
  `bookname` varchar(50) NOT NULL,
  `authorname` varchar(50) NOT NULL,
  `imagename` varchar(200) NOT NULL,
  `price` int(10) NOT NULL,
  `publishername` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `Category` varchar(100) NOT NULL,
  `rating` int(10) NOT NULL DEFAULT '0',
  `count` int(10) NOT NULL DEFAULT '0',
  `avgratng` float(10,0) NOT NULL DEFAULT '0',
  `review1` varchar(200) NOT NULL,
  `review2` varchar(200) NOT NULL,
  `review3` varchar(200) NOT NULL,
  PRIMARY KEY (`bookid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=51 ;

--
-- Dumping data for table `books_tbl`
--

INSERT INTO `books_tbl` (`bookid`, `bookname`, `authorname`, `imagename`, `price`, `publishername`, `description`, `Category`, `rating`, `count`, `avgratng`, `review1`, `review2`, `review3`) VALUES
(50, 'aaaa', 'bbbbb', 'Picture1.png', 454, 'dfgdsg', 'hgfh', '1', 0, 0, 0, 'ghg', 'ghgh', 'ghgj');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `cname` varchar(20) NOT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cid`, `cname`) VALUES
(1, 'Computer and Interne'),
(2, 'Management'),
(3, 'Science and Technolo'),
(4, 'Entrance Exams'),
(5, 'Acadamic and profess');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE IF NOT EXISTS `feedback` (
  `f_code` int(11) NOT NULL,
  `message` varchar(200) NOT NULL,
  `usrname` varchar(50) NOT NULL,
  `pubname` varchar(50) NOT NULL,
  `booknam` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `feedback`
--


-- --------------------------------------------------------

--
-- Table structure for table `publisherreg`
--

CREATE TABLE IF NOT EXISTS `publisherreg` (
  `uid` int(10) NOT NULL AUTO_INCREMENT,
  `Fname` varchar(40) NOT NULL,
  `Lname` varchar(40) NOT NULL,
  `Uname` varchar(40) NOT NULL,
  `password` varchar(40) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `address` varchar(60) NOT NULL,
  `email` varchar(30) NOT NULL,
  `phoneno` varchar(10) NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `publisherreg`
--

INSERT INTO `publisherreg` (`uid`, `Fname`, `Lname`, `Uname`, `password`, `gender`, `address`, `email`, `phoneno`) VALUES
(12, 'surender', 'mmm', 'surender', 'surender', 'male', 'hyd', 'surendermeesala14@gmail.com', '9603166732');

-- --------------------------------------------------------

--
-- Table structure for table `userreg`
--

CREATE TABLE IF NOT EXISTS `userreg` (
  `ufname` varchar(200) NOT NULL,
  `uuname` varchar(200) NOT NULL,
  `upass1` varchar(200) NOT NULL,
  `uaddress` varchar(200) NOT NULL,
  `uphoneno` varchar(200) NOT NULL,
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `utype` varchar(200) NOT NULL DEFAULT 'user',
  `email` varchar(45) NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `userreg`
--

INSERT INTO `userreg` (`ufname`, `uuname`, `upass1`, `uaddress`, `uphoneno`, `uid`, `utype`, `email`) VALUES
('Santhosh', 'admin', 'admin123', 'hyd', '98857038', 1, 'admin', ''),
('charan', 'charan', 'charan', 'hyd', '9966332211', 8, 'user', 'surendermeesala14@gmail.com'),
('mmm', 'thamantej', 'thamantej', 'hyd', '8877441155', 9, 'user', 'surendermeesala@gmail.com');
