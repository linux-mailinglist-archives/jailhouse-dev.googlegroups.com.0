Return-Path: <jailhouse-dev+bncBDD5VM7LUMHBB45HZHWAKGQE5KG6WKY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23e.google.com (mail-lj1-x23e.google.com [IPv6:2a00:1450:4864:20::23e])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A0CC262E
	for <lists+jailhouse-dev@lfdr.de>; Mon, 30 Sep 2019 21:13:56 +0200 (CEST)
Received: by mail-lj1-x23e.google.com with SMTP id h19sf3393919ljc.5
        for <lists+jailhouse-dev@lfdr.de>; Mon, 30 Sep 2019 12:13:56 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1569870835; cv=pass;
        d=google.com; s=arc-20160816;
        b=gNcv+f9dkQkJMVOXPPWbSW1O49on8cjMPzQ0TS0W7ShFlR6yzXNukwDlxh37rX12pN
         2pIUdrzIdjtw8IspQtyDhjCYOpw56Zk/L5fHXgTTdfEVCN880aEeavbHB94GBwvQ7XbW
         cWfF1XOT092t3uYJ8vk7OkAwyOVepc11jffBINbHdrTFI+DUut/j15bzs0whvcy0fH3x
         EBlqfmCYgyBtyICtxBelMOTJZ/DFMcmWwvBsnWAQwuAZxd7j3C7q70eJR4vTbhNPD5/A
         5ZqL5IACk0TABpjznSHzzVDGmiTOWuoB1cnam7JjUsC45gyzP42Jajb8ZXhSpRbCaeNg
         RGPg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=CYHqvDee5N5wGLrfvtEnD/npggU7j0O3eu7Nbbp0Yrs=;
        b=puSTqawi41UxXUVRvucPuqKJ9NzNUsau03XaXBfdxny8IhmV1X1VaFytmkx07aC2xe
         Gztb0b/UopoRWANuM5pxfFkEGyXUkgZo4n87K3MUp8CkOE0kv7REsyQgnb6HowDzKvcv
         veay9tqoX069rcw/cGDn4lq4t4tYCGa/xaQwVl5Jlt/9BEsfU4opEcLi7KKzaZHhZ/ky
         fP//v6Zz/C5WEYXKae2JnN+6iMOxBLJxW9/7cRWVWLnK5aAp+w0WniZ3FuZ9j3brQZ4B
         wwETw3EaLMA3ceiEq5aHss9ZO5R6+J+7d3BJX03vIzD9ilVjFYUpcBpMGUfEw6rucPdm
         8AGg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=jD3HPWn9;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=CYHqvDee5N5wGLrfvtEnD/npggU7j0O3eu7Nbbp0Yrs=;
        b=aqjZNWrRpQdbfC8AYjn9T8WBRaZWZqBdE2WJusB+nTHjANPLYCcApjyj5/RWLBBXhV
         UXCjp9Iduz/iyUwKdksLR2XyHqbG38G2TwaVrvG8oT+ahit4J+vgQeq7xZRi36gl6mhw
         aHc2AgT4eESz43Wun28sJ4K1jFus8BBHDLaFG4Vc1b9JS2b1q5ug7Ls4LJlNvbacUoMW
         ZPBYOp380OG1lBC9mycpEa6XryPYH2cxlNMF9hI/K9IN0jf1M5JsmLd018EylhwXP491
         OsyC7di8xZODfKdkgZMTJ0noSBbSZaJuWGKWpP5KP4EpnPHGqzC1FGMct6DzK4kt4j31
         G4bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=CYHqvDee5N5wGLrfvtEnD/npggU7j0O3eu7Nbbp0Yrs=;
        b=NvyxS+p2J9Jm47Pwt8kbpSPqWWJf16cae2rEBvWyLqgG0pmCPyR9H+UA6SpE0fWWUf
         TZRhx4f8fJUX3cGzEIRJ9np2M80e7m5CDs3C9oq+OnVUbYe0MVJcaverfSyC07N7ddpE
         zf2cmLdrQONf+hBe/Yv7IZBadp4i6U3FRwe8hpRCwndbcP7Fp8CuirQXSqqaxmdYExAC
         JIp5Pl0v7CVwDLx6a/W3Eol/Cw4WA0HJfXbZAMf785jku9L/c815491dTTLKaPCZZiet
         mLv6SUT8sCOK5WFnuK8Ybg8EjsIj2wYTex/8VNP6hfJuL6Deh9AnbcBC44jHF4danWXm
         hRCA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXNHBGzuGaYDyks4a1/1+95dBQx+LVZCZN4dy3piGRelsgaX0XG
	qJ6D7KeKkQpitCLQh4sitXg=
X-Google-Smtp-Source: APXvYqyob2rjyl2OGRWCW5FeqTo9GuBxri2lPkkwaXCv6xRT3C8K6efMiNpxASlphPS3wJj0hxZoXg==
X-Received: by 2002:a19:3805:: with SMTP id f5mr12216091lfa.173.1569870835865;
        Mon, 30 Sep 2019 12:13:55 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:8c4c:: with SMTP id i12ls1248381lfj.2.gmail; Mon, 30 Sep
 2019 12:13:55 -0700 (PDT)
X-Received: by 2002:ac2:551d:: with SMTP id j29mr2071108lfk.7.1569870835294;
        Mon, 30 Sep 2019 12:13:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569870835; cv=none;
        d=google.com; s=arc-20160816;
        b=kisuECsEa1jcFH7+GxYuGWnM8ExW7EJ+wWMaHswOiyyYeISial+3VuYxkaZ+k87XRh
         cL+vR1wv2zTttnXYjra0TxNjZY6j1EgG6BASphTozr0wOsSE51Ku0FUT2lFgUxyw+xZP
         i4Pp3Ia8XuIrrpK2y8VnbDoDDG/yHXy6j16IpOXfepXjlsu/YD2EkGqNlraoOdzffqZb
         IgSScHfCZ3sbFnjrXImF9lY/WBVilOAhnOpaGJBjLHiK1a7kfjZN1ZIKDtWqPK2FdBB6
         2KnoH7kHkVqiZXmmR5zoKKTw/yZ4QD/UQqOREYMmXU2LvttBSYcnPZNeQJ3LeTiZ9T5A
         jkmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=EDi2UuHVP6J7KNHsyLG//AtIPfl+IHbDicVErY/hp18=;
        b=oYetiz8rKwJLe9p/rI9I/Iqa8JLKIrZ9QNzqThb1QpIdArAv2nSjenGXbpkwqB0VCX
         iIzCg5HVa14yK4HAzGnGCHkWoEWyDBj52J7e9XXSgvGXKZ/lS/2UqX3PFsxduBlpyU6Q
         nmBHiHm4hnTGyMLUiSDq6vWXWsFTVtKFXnnNY6su2gjG2gsYAJE8PEzE9upV4PPJA9Dh
         uJB19YWgwr/sxvnvBIcGAWo9LIHKTHwzPvu1aaZiwVoTCHOQzqkqVgYIRqR9GuPYeRIe
         p8Rv3K1f+Y6NNUSj+AN71OzRSNBSFny8VKHF+eMH55S9kX4f0WMGG2WpfYACbyszMALd
         vlCg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=jD3HPWn9;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [2001:638:a01:1096::11])
        by gmr-mx.google.com with ESMTPS id h6si724088lfc.3.2019.09.30.12.13.54
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 30 Sep 2019 12:13:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) client-ip=2001:638:a01:1096::11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 46hsWj727Zzy2f
	for <jailhouse-dev@googlegroups.com>; Mon, 30 Sep 2019 21:13:53 +0200 (CEST)
Received: from localhost.localdomain (2001:638:a01:8013::138) by
 E16S02.hs-regensburg.de (2001:638:a01:8013::92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1847.3; Mon, 30 Sep 2019 21:13:53 +0200
From: Andrej Utz <andrej.utz@st.oth-regensburg.de>
To: <ralf.ramsauer@othr.de>, Jailhouse <jailhouse-dev@googlegroups.com>
CC: Andrej Utz <andrej.utz@st.oth-regensburg.de>
Subject: [PATCH v3 00/14] pyjailhouse: x86: Implement config generator for port I/O
Date: Mon, 30 Sep 2019 21:13:08 +0200
Message-ID: <20190930191323.32266-1-andrej.utz@st.oth-regensburg.de>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S03.hs-regensburg.de (2001:638:a01:8013::93) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: andrej.utz@st.oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=jD3HPWn9;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de
 designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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

This patch series eases configuration of port I/O devices for x86
plattforms by generating an initial PIO region list. To sustain previous
behavior, most entries are disabled (commented out). Only whitelisted
device ports are allowed. This includes the peripheral PCI port space.

Additionally the code paths for memory region generation are cleaned up
and streamlined.

Andrej Utz (4):
  tools: jailhouse-config-create: Rename regions to mem_regions in
    preparation for port_regions
  pyjailhouse: sysfs_parser: abstract parts of MemRegion into IORegion
  pyjailhouse: sysfs_parser: simplify integer formatting for regions in
    config template
  pyjailhouse: x86: implement pio_regions generator

Ralf Ramsauer (10):
  tools: jailhoues-cell-linux: cosmetic fixup
  pyjailhouse: sysfs_parser: remove dead code
  pyjailhouse: sysfs_parser: minor stylistic fixups
  pyjailhouse: sysfs_parser: simplify statement
  pyjailhouse: sysfs_parser: introduce new class IORegionTree
  pyjailhouse: sysfs_parser: move parse_iomem_file to the new parser
  pyjailhouse: sysfs_parser: make regions_split_by_kernel static
  pyjailhouse: sysfs_parser: entirely separate IO parsers
  pyjailhouse: sysfs_parser: remove parse_iomem_file
  pyjailhouse: sysfs_parser: move find_regions_by_name to IORegionTree

 pyjailhouse/sysfs_parser.py   | 245 ++++++++++++++++++++++------------
 tools/jailhouse-cell-linux    |   8 +-
 tools/jailhouse-config-create |  25 +---
 tools/root-cell-config.c.tmpl |  21 ++-
 4 files changed, 176 insertions(+), 123 deletions(-)

-- 
2.23.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190930191323.32266-1-andrej.utz%40st.oth-regensburg.de.
