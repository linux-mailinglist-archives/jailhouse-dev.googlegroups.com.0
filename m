Return-Path: <jailhouse-dev+bncBDD5VM7LUMHBBXHGXX4AKGQE6QCXYNQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33a.google.com (mail-wm1-x33a.google.com [IPv6:2a00:1450:4864:20::33a])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4CE2216E8
	for <lists+jailhouse-dev@lfdr.de>; Wed, 15 Jul 2020 23:21:33 +0200 (CEST)
Received: by mail-wm1-x33a.google.com with SMTP id c81sf2235030wmd.2
        for <lists+jailhouse-dev@lfdr.de>; Wed, 15 Jul 2020 14:21:33 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1594848093; cv=pass;
        d=google.com; s=arc-20160816;
        b=uYx1LZ27d0T/TZInN1cAl59rs56fSDCQUm2nEKyIxAaq40YzF1aC7mlbZV+ofJ15rJ
         3pm+QgpF0+tHVB5A8qNvqtPjta8uh/vH4+5WiUmDe9fI84FLRzQvxIXqZxr61/cjmWyY
         cAoZjFedyDvKXDf+48f63nauJ6MROdwkd+sgODIU8IakX8eHlRoVd/ZvhLU4pHMraIyz
         H6s+J9XR9SconVhU4J5NcVU/b6M+/CcXNJJjLsXJkyI1w3MSjmP7tk+GB2t9HOetpzAS
         G6KOINC9W7IWpYcx0DSoaRHXeYEzX92zB7FNnc4IWMfDu8fjKWJT74GnudL4QMPncqr1
         461g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=95ZXTr9VEpbbqod/Q0iPXA+HDuGHd1hCiNClTSlxIg4=;
        b=o7r875PC/8wzFDsANJYAQ7V47h53RxLZMqUqavxF3FKVCsLVW1HRgzOk/YWd2eedFG
         zHC2EkYC1aP1mb0o5YNSHPlNZpEBW5Ww0VNSCy30x/hbaj4F0sOCFf/SN0WykI3x44l3
         nsKUrC9xhy29N7ezVGEGSo1dtdwV2skJUSWf3sEgKKPYaClvgg+6nATB2QCs+olGXJ2o
         eMG/GRvjCzTjZ9ofNL1i/0/64yknnE/QobTRCXYQM2AOC6+wGoDXbeMYR22hxYiRFkO6
         cCy7dBsA8kjwE/YANfNRT33O871v7k4m1mRmDyKjolPOhRpIYRQld/o2upF/gqpYIiBV
         MXAQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=a8MXpayM;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=95ZXTr9VEpbbqod/Q0iPXA+HDuGHd1hCiNClTSlxIg4=;
        b=Dfss4A/y9julAawGCUNIsjDb6uP7ghrhpKCvIsUvp62nmVPhiqQewzDIOsWwI2+OVy
         d3shB0IJBjktUOfiJGi77tq3jCO9i6PJNexiGRTEjR6ZY6Ei9uV3anOiyUTLDySWCUVV
         Wv5Y02SXUxq2PkfdXk4oIhBkqhT0afMyqpXPlDBUZdKd+kkhPH8pSKAXvdK944tOeNmb
         8sMJ72RsNHdjLzyCVo6WlptM8PURDm5zy8cEu6UnHgkR8aDy6flL9KGYaJJAgTClDHx/
         SL4Rc7EUYWEbjlMbPTTs0qxNFRteJEmwz9+CCiQk7MmwVDNyMXyizevMeHzZHum8BO4U
         SsUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=95ZXTr9VEpbbqod/Q0iPXA+HDuGHd1hCiNClTSlxIg4=;
        b=MWuTiRK1tFke587IxrvWi4cxTBuSxbYVG1LLKm9x0zQ++MX1pNJDkXfU9iV/svy5p4
         /M4WY31HiFMzkD2fgddI90Kv9fiGpSz6AMvKOQC2WJDU+JsydjeePVtxFFxZfan6qggb
         gZjQGOpKDMD6V19y5OFUlQfDpZhOJLWkEC+gjJFr2BYVcMqKFTD3naGbU7tZa80CMMTK
         g/P5p4TIxoyyAG7qFeTSyYUvOpBbxyIO9/0HECxqVKqtSieaDFmbl7ljlL9+z2FvhS95
         7JquH03nLedwakFKxc8J1FqkKvXwHyNcGcpCyqC0+oTM+HtcC0WM57J4/6KqMEwNV+r0
         PE9A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530jPVeM3sfYJYglGO1Z3WqEXagE2iAEzNLUGYywd8tYgDz4FK23
	6/uJYdyMVTIkzdD0o11E5Lk=
X-Google-Smtp-Source: ABdhPJzEpNXRZfJj1SH8REGAcdSHRMI45NX4I+7tH9jPEswZqqoODXWBQxEdMNeKcj5TqtXyKO3tig==
X-Received: by 2002:a1c:6308:: with SMTP id x8mr1494368wmb.92.1594848092897;
        Wed, 15 Jul 2020 14:21:32 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:1fc9:: with SMTP id f192ls1171468wmf.1.gmail; Wed, 15
 Jul 2020 14:21:32 -0700 (PDT)
X-Received: by 2002:a05:600c:2285:: with SMTP id 5mr1509588wmf.78.1594848092209;
        Wed, 15 Jul 2020 14:21:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594848092; cv=none;
        d=google.com; s=arc-20160816;
        b=ZVoycoJvb/xaLh04cmDYRrFw5qIaPkMgH+3GmCBkuG98qh21YrVhCLc7KKxRf7wtHL
         QiPggILYtfHuiSVEeRLF9d8/o8DiF6F5CTgbdfEmfZQT7wVP0s9EM6xobvmiBdqtQUfr
         sd4R55gsnAYSaJE9IcPZTew8QJVAbtR4qt97L6NZfj0EVJfO3KilBIpvXFwpyEwQ2SKT
         dBUENcR2x7u+gm1JiPhNvt5O8/4MjeJgc+lQ8JR4hrDi20Ux1qNS4Ye3BSHAuzvTpll9
         zCW3iCk0l9zvsOgqXcTuY1Ttj41dHO5oM/ae+4X5W3wDOgCJHQJq81PXsv3PfQ5dRGKF
         FWcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=MYSw4hbXl7nnjaKcnjhRcyTFKqWXghS17oKltXPCaXw=;
        b=Yr1KgWw+igtXraA+ed+l33vBe6p57Xz2245arqr92fZ7roHjrW3RtabtO/Jc6aattX
         irItF4PLcbyMYXV/U9fj8+HDpnR2iz1arlWo3zvIozDig+5wQ/XTwypAoiwazQ4Ngm5G
         2kfxUlMrHT371z8T5QiCW1nlmovEe9fS5NV3m7nycZ//e0UsZ2vLu8plRUhDw7X+7Wgw
         XEd9iQbNXP9kXSqVQ9vdMCrvAfNqODTtpm5tNl7AX1tq6DzwzvPP5GdFi8TR9PmDp2hH
         BDB/PeIkCYpibuzCeycHZdOztcSQzXGQkCbJ0rjJEA2z4g/AwEPiTDFhQRMwFjRVg8Ct
         TTDQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=a8MXpayM;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [194.95.104.12])
        by gmr-mx.google.com with ESMTPS id 14si162592wmk.1.2020.07.15.14.21.32
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 Jul 2020 14:21:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 194.95.104.12 as permitted sender) client-ip=194.95.104.12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4B6Vgb5PP2zy3S
	for <jailhouse-dev@googlegroups.com>; Wed, 15 Jul 2020 23:21:31 +0200 (CEST)
Received: from base.lan (2001:638:a01:8013::138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Wed, 15 Jul
 2020 23:21:31 +0200
From: Andrej Utz <andrej.utz@st.oth-regensburg.de>
To: <jailhouse-dev@googlegroups.com>
CC: Andrej Utz <andrej.utz@st.oth-regensburg.de>
Subject: [PATCH v2 0/7] Configuration parser streamlining
Date: Wed, 15 Jul 2020 23:21:12 +0200
Message-ID: <20200715212119.48052-1-andrej.utz@st.oth-regensburg.de>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S03.hs-regensburg.de (2001:638:a01:8013::93) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: andrej.utz@st.oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=a8MXpayM;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de
 designates 194.95.104.12 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
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

Theses patches mostly improve non-functional aspects of the Jailhouse
configuration parser. Logic for unpacking binary data is consolidated
into CStruct class, which all parser classes are inherited from.
To improve input flexibility, data slices are replaced with I/O streams
(see Pythons 'io' package for how to use them).
Finally, a CPU set check is added, which will list conflicting CPUs
between cells and also usage of non-existing ones in the root-cell.

Changes v1->v2:
  - reference class variables via class object or class name
  - drop implicit PEP8 formatting
  - dropped unused patches


Andrej Utz (7):
  pyjailhouse: config_parser: store binary format specification in
    struct.Struct
  pyjailhouse: config_parser: move parsing into class methods
  pyjailhouse: config_parser: consolidate binary parsing into CStruct
    class
  pyjailhouse: config_parser: use I/O stream instead slice of bytes
  pyjailhouse: config_parser: parse pin_bitman in Irqchip as list
  pyjailhouse: config_parser: consolidate header parsing
  tools: config-check: add CPU overlap and boundary check

 pyjailhouse/config_parser.py | 296 ++++++++++++++++++++++-------------
 tools/jailhouse-config-check |  39 ++++-
 2 files changed, 217 insertions(+), 118 deletions(-)

--
2.27.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200715212119.48052-1-andrej.utz%40st.oth-regensburg.de.
