Return-Path: <jailhouse-dev+bncBAABBM47QKBQMGQEEM4LACA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53e.google.com (mail-ed1-x53e.google.com [IPv6:2a00:1450:4864:20::53e])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C5B34BC8E
	for <lists+jailhouse-dev@lfdr.de>; Sun, 28 Mar 2021 16:16:19 +0200 (CEST)
Received: by mail-ed1-x53e.google.com with SMTP id bm8sf7317817edb.4
        for <lists+jailhouse-dev@lfdr.de>; Sun, 28 Mar 2021 07:16:19 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1616940979; cv=pass;
        d=google.com; s=arc-20160816;
        b=016Ia25JEK1fQPgQuULN2fynP5zpjadliM511iItQTfmmyUZllugF41uHmY2I1/5HH
         184zCrK8gxfPfJ2MPY8PISlviB2ENhW8bq5dL/ynO5XHl1Q21Wj6lOBKMkyu5tdT94KJ
         UYaPAiFLpiLsxAyXqJ2Wz8EemF22nvOosmowOOQzbh165+mj4jZ2pUDOtSXQRz2EaRhC
         WBE4pVmyvhMR8ZEknnC+gSO0InBd1gNkGE+QbRHwOnmwIzq89c0i4DepBIHOvJHLzqFA
         KSCp+us8mal9rObe1c8zF4EeezNO5dOwhWIANv1yIqBoOGgC7FT/QKul7oVNdBGn6uno
         jlXw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:message-id:mime-version
         :content-transfer-encoding:subject:to:from:date:sender
         :dkim-signature;
        bh=oJGIq1E+7zDOQsskurtpWOkg3t7NTE2ZOMaZdAKrdm8=;
        b=FwV+WtFLgimD09+/MtguV55QtijVuvziiolTaCX3nmehhSsMLq7QLc9Pyd7y+7dI2p
         9kcBJWTGqsbeM4eXQ743qpgs9lBATBtnNy+8R0DWd2uzafawjeydFWC0rMHDCSyiezaI
         NP+2Wz+n1KK9l2/8Xx8DWz/JJDsjebqkMqSD5rCs6x8FrspfB/tbdo/ME9zEUE46ZnyS
         4XGosvra2To7VLresp4k/I1U23sFFYGXGP3SH6Uznv3QsZrLRg75qOvMxNi0nQKM+vUF
         0xcgb6X0D0pgVBBMjA76Meo8PwKqWqoeOIo4Df7cdN3A3m68hAOWvLFskql/7aUOySfu
         zC2w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of caohp19@lzu.edu.cn designates 165.227.154.27 as permitted sender) smtp.mailfrom=caohp19@lzu.edu.cn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:subject:content-transfer-encoding:mime-version
         :message-id:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=oJGIq1E+7zDOQsskurtpWOkg3t7NTE2ZOMaZdAKrdm8=;
        b=Yl4czwzp5RW5krrLVO1pjdoTcpyIE+bHDB+CQ082SEN3YKLWN2f7zXzkpuh29f4AmB
         4AG/N1CayyL5mzi//cld94Wu6uPfC6zTuXm5ZiEMTh3zvVQKEk9a4z/WtBe7gbmmK2ER
         vD5Ex38PyeFJylYIAYdE/vXh9/bFq3XDEowp9/8JmNekqOMTP89aUEY9XkWZ13pTvKzx
         PeL1B9I354usEpuqZPin0/qbI3rnGtQL52oJn1kZiq5NGbMZxVe5Bwno8zDpSgyxfo+1
         qlXL37kbOEO8mUBJovgGA0dPJZZLVIW3NOXUsZxH2G1NAqHYaDx0kN+lVqZ9qiIdpaFd
         rbCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:subject
         :content-transfer-encoding:mime-version:message-id:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=oJGIq1E+7zDOQsskurtpWOkg3t7NTE2ZOMaZdAKrdm8=;
        b=nN0y1idz7t7RNRX4RWopgx0wHo/g9O+j8vg4o8hiWoK5v/bTvbRQ4TKEV2zQANEe1r
         CT7zl1rcQJLM3EAtYEhIU1w87A01uLzmJqArZtXFMCobZlUklX7amM32WjZur5J3tIRK
         KL34pppgJ/qw3AdISvUWehqwEDrFKkZUxH4BaeHdNrQk7+pfMZQ2fteCiVWyfQk4YcvZ
         DNj6SnGFh7nG+LFz+0RRs7s+8C9LowM0IzsCcWaLkj4xwIxE+Rb0Ilcj42lCK6M8/I2n
         8m9vEI47PsTPNoTqba7nF6AXLOtfxphmO/OSoL1E11Aulm9fMKqcOEM5rqCmcG2gcUNG
         6gMg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5317fvKZOrJINRncDD9kQERY9PwvsdAqNPTYd1NIRgRR3ZaApioD
	QXQV8fYzOKjBnryHt7HA/6Q=
X-Google-Smtp-Source: ABdhPJzuJN2yD+A2aalrG2dIwtofq10/IEV+uNHqppwgd3GO9Pva3JP1u8CtNbVIcmlwIcHrHyEkCQ==
X-Received: by 2002:aa7:c450:: with SMTP id n16mr24001986edr.16.1616940979364;
        Sun, 28 Mar 2021 07:16:19 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:eb82:: with SMTP id mh2ls7340334ejb.6.gmail; Sun, 28
 Mar 2021 07:16:18 -0700 (PDT)
X-Received: by 2002:a17:906:5949:: with SMTP id g9mr25095969ejr.518.1616940978630;
        Sun, 28 Mar 2021 07:16:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616940978; cv=none;
        d=google.com; s=arc-20160816;
        b=Mwd19r2T+fOuKoXl2KSVUhiEikBrwCEn68ABeGmbVnJBHisO+zKKzg5sWh/exZ+rig
         IdsLnKc2OAbwWsUGVUhJ+6tfZt6xP35cjO1nbKhiRNbHXgZQxjmdROdOVhjVZh6Dyz04
         w8XBkvxqBkB8UoldImGQdnkCOHMJjxk4sSOUb2BMdaxNp8XgjG0qjIaGYvrLajahZKB3
         1RfAPlz2Xx09JSQ2GPS9+LOxC+p6AMZ91FhFGZ4gZvkNrcLg2gqUSwsc7HB0LrZwzeBN
         jp9fWIk6ZQ1+UjAFP3O1G2tG8OwxVkpIBK0G3NcafAZ85wYOXPMVTiHAPwQulJuSYYmd
         x7Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=message-id:mime-version:content-transfer-encoding:subject:to:from
         :date;
        bh=ua/d0vhI9WlLGviQRxAzg8ytRLxi+GmMIWJVSf+C6Y4=;
        b=mvHeUGNOLL2mhxzaQi+4IlZGvqXbMYsSHQI297Ps7pru8vSX0zD837A9SkcJ1DOXXo
         GPdnHp8xInYPpGFuNGvn2Np41t3T/EiZ7yjAgfhBSWHKbix5YJoSU7hxHG7tsCcUhYGI
         0vjY8E6Ta7zp8apkyN/aOrZ5Y1jRQhOf9jbCTpuAPNDpHBfeDFVZfH0ejYbezWTjCFX3
         l1cACZ7EgwDO9P54ydIn4KV672YPFdA2s9Ka0O028gxsDex6DOdEya2bNTHFezl9D6jX
         gKXwn1/sr2UnCh9JGsf87+uPUF354kgK64Wj2FAkhCdPb98kio0NQR2kyEDYgshuFvyj
         +DYA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of caohp19@lzu.edu.cn designates 165.227.154.27 as permitted sender) smtp.mailfrom=caohp19@lzu.edu.cn
Received: from zg8tmty1ljiyny4xntqumjca.icoremail.net (zg8tmty1ljiyny4xntqumjca.icoremail.net. [165.227.154.27])
        by gmr-mx.google.com with SMTP id t7si570053edr.0.2021.03.28.07.16.17
        for <jailhouse-dev@googlegroups.com>;
        Sun, 28 Mar 2021 07:16:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of caohp19@lzu.edu.cn designates 165.227.154.27 as permitted sender) client-ip=165.227.154.27;
Received: by ajax-webmail-app1 (Coremail) ; Sun, 28 Mar 2021 22:16:14 +0800
 (GMT+08:00)
X-Originating-IP: [210.26.59.142]
Date: Sun, 28 Mar 2021 22:16:14 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: =?UTF-8?B?5pu55a6P6bmP?= <caohp19@lzu.edu.cn>
To: jailhouse-dev@googlegroups.com
Subject: HELP
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.12 build 20200616(0f5d8152)
 Copyright (c) 2002-2021 www.mailtech.cn lzu.edu.cn
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Message-ID: <53464ac4.9478.17879314390.Coremail.caohp19@lzu.edu.cn>
X-Coremail-Locale: en_US
X-CM-TRANSID: ygmowAC3v4ewj2Bg+3DZAQ--.2589W
X-CM-SenderInfo: hfdrx1arz6z6vxohv3gofq/1tbiAQ0OBl2vOvGaoAABsG
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWUCw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=
X-Original-Sender: caohp19@lzu.edu.cn
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of caohp19@lzu.edu.cn designates 165.227.154.27 as
 permitted sender) smtp.mailfrom=caohp19@lzu.edu.cn
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

Dear sir:

As we all know, the cell could communicate with root cell by ivshmem in Jai=
lhouse. And there is a virtual Network Interface Card(NIC) on non-root cell=
.=20
When I run Jailhouse on my raspberry Pi 4 model b, I was successful to crea=
te a cell and assigned a address to it. The root cell can communicate with=
=20
non-root cell , I know this is based on ivshmem. But I want to know=20

1. Whether the virtual NIC support other protocols.=20
2. What is difference between virtual NIC in non-root cell and NIC in root =
cell.=20
3. Why the virtual NIC cannot ping baidu.com(in China ) or google.com.
If I get your help, I will appreciate =EF=BC=81


Yours sincerely,
HOngpeng Cao.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/53464ac4.9478.17879314390.Coremail.caohp19%40lzu.edu.cn.
