Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBU7ES7WQKGQEQZLBHPA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x440.google.com (mail-wr1-x440.google.com [IPv6:2a00:1450:4864:20::440])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C8E2D7B1A
	for <lists+jailhouse-dev@lfdr.de>; Tue, 15 Oct 2019 18:22:44 +0200 (CEST)
Received: by mail-wr1-x440.google.com with SMTP id j2sf1412559wrg.19
        for <lists+jailhouse-dev@lfdr.de>; Tue, 15 Oct 2019 09:22:44 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1571156564; cv=pass;
        d=google.com; s=arc-20160816;
        b=0qCG2L/Xw5zG/vr4iI4iP9lEZAFQI5AG8woRyWWrrvJ49E2OG49HQMnaCdy/i8hpkP
         0byTQlD46XbAQ3oyTFwt1MJ9MY1Pdajmk6/mK/xjPEdVHREL4jZJbl6avpDCgKip8nso
         znu7Ddnm2hgNAckvsSocxxtNa8c1Ecfo1423Ttb0H0WhpLi1mM/ySwQJlqnCcAcZJ6vH
         7sBUaHyECjQl0Z5lJHouOjjkZ1SQZ3zXyzvOOox2DFYlN+uJM2YZCreHx39iKKOhlghl
         6OCDd5U7ol7Myll1FDOBzrze1+hPfNQBo+/e56CnUsXjU4pMpm49BoqdUstnLm8VpGAq
         Sy/w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=67GiDJpM0gaebEFqVR7oXi6KIscusgB8AnGrHM0JjwA=;
        b=c195mKBbeXfZolVwMA1M8mEWffsS46QFkSVuWXJ4yJ9fyv9/yVtStaIz0q5qJ8Rxjm
         A1Hq892j69hAHAv2nn9rLbDiHPTveIHS7U2LOcyIiRZ9GV1+bDf4PcHoUN4qINallSj8
         tCvTLJSAgyF7Rczq1urMbQeAEzpiGYwbeLQhSqPUAfMwl5wkTCRwlt5P3ulcftLiv+S5
         6M9+spguluXwn3C3uzPxXAG8wt9BXc60JA4O62qbmqBwqXt1hiNzYXqciqVyr6VNv/6D
         XyeCIm65Z3XC7nfJvfkezAYAiTcaJI3s3fkwIqIlwoZnIqHaCJOZ38XjM3BgIdevsyz7
         NVzQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=67GiDJpM0gaebEFqVR7oXi6KIscusgB8AnGrHM0JjwA=;
        b=fOedSGRq60GT+2QT776iLU7+T0tgzB5DhGq/xCJTs9d2yW/PKT0x5UnsNKM4RgZ8QN
         t9PRYGmFisoVv9zF0tm9RCE7+9v1lduqvHjvIIMSJbY+4GhFbZ4tggH4SaSrQb6qVhkl
         YZ8jEqWVZEYMJfKHw7YXaTdBmXUofT0E9YZxG5o/C/vCs1a0f2qud5pAlUvR7G1Ka3s+
         5xnf13IaQMDIGLSgpBq5YXkeFIWU3gKXEDoANToxagFrTjmBJlpMZ73M9rDu7cVJjJiu
         nNDq85+v1wBstd7MK/DEYBq7NYdaWmB38JMUKEI+7hKlSPUcJF3j/w2VMeaUeZbe0X8t
         XnJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=67GiDJpM0gaebEFqVR7oXi6KIscusgB8AnGrHM0JjwA=;
        b=ZWHOKuSLBOyJsbDE0Nr+ZemgUry2zv658nusEt5LLd1w/nxXqXoZv/F2ilBJlHJFKx
         zWjRVQJi2J0CGuU2rEqZq51DD0HnI1+ELg8PvhaCiFdHq6AuBRxl3fysVdpmMuVgI/6l
         LzSPsy+oxxDrGOYey/6ufrdFnjIajG7njFipaqi0xD49IKTqqvUzjnmMA896dJ/3Fl9F
         SrbzvCfX4fyMTVKzXSWpPBWfa8aNylBt3AW8Iourbh5Wht5KMefhGOVplqhtD83gToNI
         oTAwUFowmsrPzD2Y3PZ1EBgp61TtN7cBpiRDA/OjujE4rQgU7IgBaS3OGheuI03AshTy
         kyKA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWzxdrgjk2LF9LuN+AYXGHHagEDdR+ZzRWKp5xlDrzkBRsJefei
	zafmTUcABibW1TO74qqFp70=
X-Google-Smtp-Source: APXvYqwdsbnJCB1lpMWkCAWLE+sX9Ye+qJE2T+fd0ApZKR9uzIvnEwN3NiI5Et9SIamD8vx0si63kA==
X-Received: by 2002:adf:d848:: with SMTP id k8mr34278192wrl.189.1571156564213;
        Tue, 15 Oct 2019 09:22:44 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:7304:: with SMTP id d4ls8125451wmb.0.canary-gmail; Tue,
 15 Oct 2019 09:22:43 -0700 (PDT)
X-Received: by 2002:a1c:9e07:: with SMTP id h7mr20606371wme.96.1571156563505;
        Tue, 15 Oct 2019 09:22:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571156563; cv=none;
        d=google.com; s=arc-20160816;
        b=oCu28Uc8GCnB6/2OeJBWm2gc4ObyHiPDrpTEau55Fl8zlZAVO2/PDLdGz4OZam9qjP
         Rz0lfvu6Ox1NnlhOsE4Y5XY1W910jeBbxEkluGDW9nz7FZSve26WaMQCncsdLT1/0Hor
         j4YaNVpTxp7+WzaEMd+c3a8UOouMDAUW5wzrles9/dvsBjtbEUIPkkBpH1fhmUdW2NWJ
         DjEjkWJiUb3ncowY4li1KNZhL+aekU6nV9vbS2CWSmY+maDpKE0iosLdAwKXVHh8D0hG
         satwVcrXOBK6BZdMzpeHRthXV88+EXTDzB7IPs61jL9cEWAEzWnCWRfHmmZythTogZoa
         1c1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from;
        bh=QFfn4l3O30kFFJRUjS20yJJdgq4ekDbAHP0bh63tpgo=;
        b=p2hpfYl99OfLecoA7TyvbWadY6mRBWX8WOM/nF7HzUur4sCL/wThEPB8HIF8BRR2IV
         qiZn3ElCok669Hd4D40iXEvyeiPvfIXXgo8krTbAJiWRJIeBGO781rC4lIR7ZsHoIan2
         c8tHhHzpqh23h9LBtvgLCJ+02xjb61rUc/2qdrsdGaDnUyM5/a7dRjNSGmZ72sFV99xT
         FvWnfqwJ/MhClRCEWKLDISvyTtYOKNA6TyCm3UrNhq6ZP+pXKQWwH1QVwN0VAsFZMeoB
         2t+8XARIJpG2e9SqNx5vwWj4ERz4mC0don7yM/vNM8dw/3i4QjfoEAIfU7PBcOACFfS/
         UhSA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id p5si1170479wmg.0.2019.10.15.09.22.43
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Oct 2019 09:22:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from pluto.lfdr (unknown [IPv6:2001:638:a01:8061:aefd:ceff:fef3:ba65])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 46t11G70hMzxnh;
	Tue, 15 Oct 2019 18:22:42 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jailhouse <jailhouse-dev@googlegroups.com>,
	Andrej Utz <andrej.utz@st.oth-regensburg.de>,
	Jan Kiszka <jan.kiszka@siemens.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v4 00/13] pyjailhouse: x86: Implement config generator for port I/O
Date: Tue, 15 Oct 2019 18:22:29 +0200
Message-Id: <20191015162242.1238940-1-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.10.15.161817, AntiVirus-Engine: 5.65.0, AntiVirus-Data: 2019.10.15.5650002
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_1700_1799 0, BODY_SIZE_2000_LESS 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_URI_FOUND 0, NO_URI_HTTPS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_X_MAILER 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __NO_HTML_TAG_RAW 0, __SANE_MSGID 0, __TO_MALFORMED_2 0, __TO_NAME 0, __TO_NAME_DIFF_FROM_ACC 0, __TO_REAL_NAMES 0'
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of ralf.ramsauer@oth-regensburg.de designates
 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Content-Type: text/plain; charset="UTF-8"
Precedence: list
Mailing-list: list jailhouse-dev@googlegroups.com; contact jailhouse-dev+owners@googlegroups.com
List-ID: <jailhouse-dev.googlegroups.com>
X-Spam-Checked-In-Group: jailhouse-dev@googlegroups.com
X-Google-Group-Id: 175645748590
List-Post: <https://groups.google.com/group/jailhouse-dev/post>, <mailto:jailhouse-dev@googlegroups.com>
List-Help: <https://groups.google.com/support/>, <mailto:jailhouse-dev+help@googlegroups.com>
List-Archive: <https://groups.google.com/group/jailhouse-dev
List-Subscribe: <https://groups.google.com/group/jailhouse-dev/subscribe>, <mailto:jailhouse-dev+subscribe@googlegroups.com>
List-Unsubscribe: <mailto:googlegroups-manage+175645748590+unsubscribe@googlegroups.com>,
 <https://groups.google.com/group/jailhouse-dev/subscribe>

(reusing Andrej's cover-letter)

This patch series eases configuration of port I/O devices for x86
plattforms by generating an initial PIO region list. To sustain previous
behavior, most entries are disabled (commented out). Only whitelisted
device ports are allowed. This includes the peripheral PCI port space.

Additionally the code paths for memory region generation are cleaned up
and streamlined.

since v3:
  - Address Jan's comments
  - Dynamically whitelist some platform devices + PCI ports
  - I (Ralf) resend the series as Andrej runs into nasty email
    throttling issues with his account

since v2:
  - Use new PIO whitelist structures

Andrej Utz (4):
  tools: jailhouse-config-create: Rename regions to mem_regions in
    preparation for port_regions
  pyjailhouse: abstract parts of MemRegion into IORegion
  pyjailhouse: simplify integer formatting for regions in config
    template
  pyjailhouse: x86: implement pio_regions generator

Ralf Ramsauer (9):
  pyjailhouse: sysfs_parser: remove dead code
  pyjailhouse: sysfs_parser: minor stylistic fixups
  pyjailhouse: sysfs_parser: introduce new class IORegionTree
  pyjailhouse: sysfs_parser: move parse_iomem_file to the new parser
  pyjailhouse: sysfs_parser: make regions_split_by_kernel static
  pyjailhouse: sysfs_parser: entirely separate IO parsers
  pyjailhouse: sysfs_parser: remove parse_iomem_file
  pyjailhouse: sysfs_parser: move find_regions_by_name to IORegionTree
  pyjailhouse: sysfs_parser: Remove IOMemRegionTree class

 pyjailhouse/sysfs_parser.py   | 340 +++++++++++++++++++++-------------
 tools/jailhouse-config-create |  25 +--
 tools/root-cell-config.c.tmpl |  22 +--
 3 files changed, 233 insertions(+), 154 deletions(-)

-- 
2.23.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20191015162242.1238940-1-ralf.ramsauer%40oth-regensburg.de.
