Return-Path: <jailhouse-dev+bncBDJ7ZUWTT4DBBENY5T5QKGQEOU5AYVA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x238.google.com (mail-lj1-x238.google.com [IPv6:2a00:1450:4864:20::238])
	by mail.lfdr.de (Postfix) with ESMTPS id D170F283659
	for <lists+jailhouse-dev@lfdr.de>; Mon,  5 Oct 2020 15:13:54 +0200 (CEST)
Received: by mail-lj1-x238.google.com with SMTP id b8sf981669ljk.20
        for <lists+jailhouse-dev@lfdr.de>; Mon, 05 Oct 2020 06:13:54 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1601903634; cv=pass;
        d=google.com; s=arc-20160816;
        b=fYHQ/+WU8vt8zeEuxoq1gfqvIp2qQ4ojGBQQlGCyIBHL9PASlTYeQMnNk1tJx9Y2FD
         ALLZ5kvI7xcZgsDdalyuhm3b8gWbgpK30LkG4Bv5riQ+yWvC+VuFHdvwRPCymGIBENt2
         UAmm8PTUb3SFj+Sg28KnGMure9hsOs+J1SEh8uZjsJ1mNZjHqeLE6bPtI1wGQXnSeqsp
         dp9cY3NoD7RFEl6hvQy0Y3kZrXh/aF0RQkcnpea1B6ZGcj/r9V/KWVu6pvfeSC29YLOl
         x0SGgYlYobtaEBoSp8oiFJnA07DJp6wHkmxxsF9xjf7xOI0ca9knCnOXJ+Hdv17K0D7M
         njzg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:original-authentication-results
         :mime-version:content-transfer-encoding:content-id:nodisclaimer
         :user-agent:content-language:accept-language:in-reply-to:references
         :message-id:date:thread-index:thread-topic:subject:to:from:sender
         :dkim-signature;
        bh=egHFCKF3oTxB3Pjzz00WOjDQcbL7xoSGz060n+oyVAU=;
        b=Es50BYt0ntGfnXqPa27+MZj0xq266x/imooGXT8tw+LULapFCYUp/Hmu5QbftvfMvU
         0HICmUvWBb7IcV2b7i3bGNW6bTqQOWsyu66HIJDBfpATCOA8caoE98VKQYXJPve0Vzsj
         72Z+w/Dc+9lzpgXqJTu1KLppQ48+R0+Tu/F6TBpTYyQH86St7zeWYssFksTG9338tNdH
         z+OyfHVvBeUGBe6Ld8pouuZ2RSjTpcP0cTHk7ZZ+5ChX/VS6k2ngb3lIWpkVWH/QzGYh
         8TvZdHcWZxuWuol61qCQuDSlxm7JTESGihJDVTR3Jgkj907juIxe2+2xrGBL8dxHjfUL
         TkLg==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=s4oPQa1T;
       dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=s4oPQa1T;
       arc=pass (i=1 spf=pass spfdomain=arm.com dkim=pass dkdomain=arm.com dmarc=pass fromdomain=arm.com);
       spf=pass (google.com: domain of chase.conklin@arm.com designates 40.107.1.70 as permitted sender) smtp.mailfrom=Chase.Conklin@arm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=arm.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language:user-agent
         :nodisclaimer:content-id:content-transfer-encoding:mime-version
         :original-authentication-results:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=egHFCKF3oTxB3Pjzz00WOjDQcbL7xoSGz060n+oyVAU=;
        b=ofw3EBOiuzzjYqgQDgZO6m1JLldaA6/q5d26wn02dWhJG9cLJ7J/U73SVvQBZaWKJG
         NmMAhxN2m+Kt3ZltrymjmbQQJ/qnZ0LuVDW/e99Uo/BvxE/JI9YlorIhj5a0i2plINnw
         z06db99DkXjBHxxCxICzVLeWxGK5R7Ni590XjB3BopgdluzaiLdEZwZXIBC1ahv30FRd
         MlA2Zobmt2DtkfDiLqhFvoyL/dAJDhIIzFXPLmp8msxiBR9QMe9H05iXJo3Tu73iHSXP
         x3FA0UCByjQi51Ymsauz5Kv+mgcEV9RQ+2scJdic8fF4AOPVFfsu4IE6B/3lvAZL1vuF
         4YXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:references:in-reply-to:accept-language
         :content-language:user-agent:nodisclaimer:content-id
         :content-transfer-encoding:mime-version
         :original-authentication-results:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=egHFCKF3oTxB3Pjzz00WOjDQcbL7xoSGz060n+oyVAU=;
        b=DcSLr7t29pXlmo+J+DoT/rpbF1XXp+0HRydOWoqD4c3JxiaZSTthGWo7ZHjGsptOZa
         Ux9dXZk79+ZbH3DgIE3pqwFZocNQIhoHkSq/65J/sorBSkFNNMWojmAplzHeIIxY2L00
         lTlifBbyzK0FTru2vAIm1Zn6PRnBvOc1geIryhwnKqThAZyDTsJcJtEmJvIkA2lCqT2g
         UQzsG9d2kU11nf0xIcox/8s2DAwfm0KUTh9IjIugJ/SCLHiHXNzWSY5hLcFIFYsJ9JIN
         TaxOWWSAXzR7BSIw9lC+W/nrra2Z39W1CP+MMoR/CKea6GyOsY7YHYOZ4HiTsUzpfx1H
         1dag==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5328U7LxGP2SJRLPNWxPpnqiCkKcJOZcmMEVae5R+w4yNqIkkByL
	EoqvMC3/n6b3aH12hm2r4Cg=
X-Google-Smtp-Source: ABdhPJyaR8K+LQyHxyWCeiPly8/fdJXy3+nEF0PME4xZEsMNVCOjmOXysDG+zfOl50rBSl2OH/ccxQ==
X-Received: by 2002:a2e:87c7:: with SMTP id v7mr5002449ljj.13.1601903634311;
        Mon, 05 Oct 2020 06:13:54 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:554:: with SMTP id 81ls21051lff.1.gmail; Mon, 05 Oct
 2020 06:13:53 -0700 (PDT)
X-Received: by 2002:a19:5214:: with SMTP id m20mr5365790lfb.138.1601903632921;
        Mon, 05 Oct 2020 06:13:52 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601903632; cv=pass;
        d=google.com; s=arc-20160816;
        b=yNKjSeUsLAprly6m5F/A8gCA+Bqu/bKXpeKgcDS/TYUDUSBiM4fkHWOZli5ISz8TcR
         hkWbUg2Xjmz+GggIyX8SiXzPLtK6yrCSdAi+b6S/tKB4cNFUtLardKBglkhp0/hS6puI
         7k3p2zUSKFlCpTWVSVr4fCWRqLF3ENbtn9Bk+RnJaMos8novmIbnfWi81vW9xRrTRu3o
         UQbh4UzRJGPgyk3sPNV6gas25q9CQpPz4JJcGq2Xc4wTuzXZ7yAdzlh3bC+Em9w7Lgei
         aKEx/clBmgsfCzxf4Rz75v3O/pM2HEsSrjbD0ZZ7j7I3cZbyG35t3+gXTOfs7oGkp3F+
         awmQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=original-authentication-results:mime-version
         :content-transfer-encoding:content-id:nodisclaimer
         :authentication-results-original:user-agent:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:dkim-signature:dkim-signature;
        bh=+zqQa+6lvJZQKZ8nYbMXfYing9M5mSk9ygF62F47DHI=;
        b=YUPkCUH4PJPSM8+pb9HHpXUUYxzF8G0AcFPBoyz7e4TSqtzU9pT/YdN2o40p3IeAdM
         itd14XKqbDFYLSQQeQZSJ3Gc66+H1oe/UWBukhT43U2kyvx9584L3qOe5ifQIkwEjXwH
         kXA8TIVU5vICiqh8MspgJz7LlzV2YlLRwMKYL5AlOlYT24LHQ9Enw7as2DqnqHZFh6pY
         C6G+7uaeV3ARt9bX8g7Hl1s5biXo/OfnFVIrlOu4mnkrKHBnc6wO2udfl/YeLSuej4yc
         urHFrjkKH7LMZmx6vuCvtTTS9UXSKd9r9R/whe/zCJXFIkryxB56xC/qtmDN3b7BoKV+
         RGnA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=s4oPQa1T;
       dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=s4oPQa1T;
       arc=pass (i=1 spf=pass spfdomain=arm.com dkim=pass dkdomain=arm.com dmarc=pass fromdomain=arm.com);
       spf=pass (google.com: domain of chase.conklin@arm.com designates 40.107.1.70 as permitted sender) smtp.mailfrom=Chase.Conklin@arm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=arm.com
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (mail-eopbgr10070.outbound.protection.outlook.com. [40.107.1.70])
        by gmr-mx.google.com with ESMTPS id x74si262165lff.12.2020.10.05.06.13.52
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Oct 2020 06:13:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of chase.conklin@arm.com designates 40.107.1.70 as permitted sender) client-ip=40.107.1.70;
Received: from DB8PR06CA0061.eurprd06.prod.outlook.com (2603:10a6:10:120::35)
 by AM0PR08MB3713.eurprd08.prod.outlook.com (2603:10a6:208:fd::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.32; Mon, 5 Oct
 2020 13:13:50 +0000
Received: from DB5EUR03FT019.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:120:cafe::e) by DB8PR06CA0061.outlook.office365.com
 (2603:10a6:10:120::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.36 via Frontend
 Transport; Mon, 5 Oct 2020 13:13:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; googlegroups.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;googlegroups.com; dmarc=pass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT019.mail.protection.outlook.com (10.152.20.163) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.34 via Frontend Transport; Mon, 5 Oct 2020 13:13:50 +0000
Received: ("Tessian outbound 7fc8f57bdedc:v64"); Mon, 05 Oct 2020 13:13:50 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4c58370d6283c598
X-CR-MTA-TID: 64aa7808
Received: from 9d329ab85cab.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 2C056A49-A46D-44E7-9E75-1ADCDCA4E2E6.1;
	Mon, 05 Oct 2020 13:13:12 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9d329ab85cab.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 05 Oct 2020 13:13:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ORTHstDR3JBITNW2CBb6kWMauMTs1Uib0L6elzdzH7d9WtGZs3Ta67j6h0aosnU8Z/hVR8Zpct/g2giBCOQ1Iu+08C9sODMLVsAxlEqVo6P0hhFEJ7hMtYLXEN8uXHQyQ1JaS258eQIV4+4zV7IBNQXt4gDGlGXgpXHkqjlCoxBSJidBBcyDDxdV7KukGytk7hYZIyeJizJ2rB5WVCQPQSuKpAeqV/F1WafOM99S37NIsJZDrg/1yI8dmQgt9NlDwPljl4HSPvGTXCMvBwXOxcu2gs9DisZ7bp6RYVNF4RrH7T4VIJim766yYQKB6Klf8hPj3bbDhkZD/9AbHdDerQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+zqQa+6lvJZQKZ8nYbMXfYing9M5mSk9ygF62F47DHI=;
 b=lHECJo0r/7Z8+Qgwe7bMwfWG6suMUZ278ftnfdUpKxOlPjtCLCkghuSFlMUjJ60agMmzFRX4m+YmnyBGPFxxj05K7JRvfUR7Kgz6nJooQ4hY3ROjPSYi/4xSMk9PSm2+ziOn/1OUOyIWhKsst7+lskWqb5xA+y0TbjZW4+HqoPaC8tIdQFs0xBMKYO8R9BSpI4MeTTN/C6pIEiEl8Q0swPh+0r3QxwSS1mhUeSCEVZ3gNZRzJqD0BryaF6F4BXgxeUE+0/+leUHfPxBz6u9jBCRNgYpu3ikgol1527fO0s88EuJm01b4VDq8hGmfTdKF7p8UvOjEJi0AkP9NgSnh6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from DB8PR08MB5481.eurprd08.prod.outlook.com (2603:10a6:10:114::9)
 by DB7PR08MB3884.eurprd08.prod.outlook.com (2603:10a6:10:78::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.38; Mon, 5 Oct
 2020 13:13:11 +0000
Received: from DB8PR08MB5481.eurprd08.prod.outlook.com
 ([fe80::b0a9:222:8373:97e1]) by DB8PR08MB5481.eurprd08.prod.outlook.com
 ([fe80::b0a9:222:8373:97e1%3]) with mapi id 15.20.3433.044; Mon, 5 Oct 2020
 13:13:11 +0000
From: Chase Conklin <Chase.Conklin@arm.com>
To: Jan Kiszka <jan.kiszka@siemens.com>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>
Subject: Re: [PATCH 03/45] arm64: Simplify get_cpu_parange, add 52-bit case
Thread-Topic: [PATCH 03/45] arm64: Simplify get_cpu_parange, add 52-bit case
Thread-Index: AQHWmoCdMq31ERIHdkapS9nxLVFgIKmIqbgA
Date: Mon, 5 Oct 2020 13:13:11 +0000
Message-ID: <AF18C444-D146-4E7F-9D8B-F1DCBD161882@arm.com>
References: <cover.1601838005.git.jan.kiszka@siemens.com>
 <7434305f16589d47d0248ba127edd82bf234d9e0.1601838005.git.jan.kiszka@siemens.com>
In-Reply-To: <7434305f16589d47d0248ba127edd82bf234d9e0.1601838005.git.jan.kiszka@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/16.41.20091302
x-originating-ip: [72.177.104.243]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7f8555c0-563f-4100-056b-08d86930806e
x-ms-traffictypediagnostic: DB7PR08MB3884:|AM0PR08MB3713:
X-Microsoft-Antispam-PRVS: <AM0PR08MB371349C2F8298B812DEA16BDFB0C0@AM0PR08MB3713.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 44RGtF5gx3XHCFOj8ufBOg8AHGEBpJ2GBvcsiakoWQkhCHd4f/RhI9oEJDR+BdMlqrOLW3cLOv7sYdVV2Cvt9UYcs7kP8v9ABM04zua38BWxYyZKJ4fWnp8ZuC4ebRo8nsCgi29cvYOOE1kaTZni7gTIZKOWtxIJYDPVm0l8wWV8nrGGRXBDIbNBCe92rlE6zktWUP47mu/v9xkJF/repVaajcqA61FnfAxUc8iTgHUQmVxK2S//8i6qmHkLddQHJxDUG9jXzkKhSokWKdvavXWdTSNq/OKMKKFskQ5OaQ0tpjdWsnWQ4qWMpWu40KirhB6+dbK2OQ++1oSBY1XDhw==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR08MB5481.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(396003)(366004)(136003)(39850400004)(6506007)(86362001)(71200400001)(53546011)(2906002)(316002)(6486002)(8936002)(8676002)(2616005)(36756003)(110136005)(33656002)(66476007)(186003)(26005)(66556008)(5660300002)(6512007)(478600001)(64756008)(83380400001)(66446008)(66946007)(91956017)(76116006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: hNh+34ntWGL7B+5vybYtk6CTLZwywgX/N7d5RWlOD0hoaVEocb9pos3wl2VV3q2WQDNr+BoKjVTHZ8wrW0I+5vVB+c8I8hsHgNHQyUEABcJLBkEhTKjwxy0gBSQ6mCW/XyHAbE/MjppSwwm8/ZvLvf1RtI42JMgVcEwg2dqvwY5NQRUB8Kcf7rEnBtUirrEYpFljqTQ4+RQgxbixWeOgBLgNLKgOHGP22EtNXx5k/NDt0diwv+ZziZOTGXq+zPpzbElICF0ctyaqAChCxequEzszL0OniJDk6q3IwQplkJmXQS/MimRAAWmBDFINkJvbjJ+VeHKlG3fGG5/GwNlqL14NJHuoQZmFWPKgaj3MH45flsPoAO9PMnFbmJIXhE43g/ZqK/7Z+/Q7ZFgJlBqQdx8/bxqvvYhLLKNbDWuZJl1c7diC3OiRAYaNuTsHf8/J0sJ6jGfioebc148JYsQFzeMGqZpHDVTeNeB9VPMK931+NLaWiXRVUSZZnIQ+we8/LsXgenxWHrWkkPGqtTxC8TNXrDzoXNN30BybM61dE2U3HBhYQuZTn9tr5OdylfxCaC+qDx/0vt0b+4dEEeXxxjiIrTCYUDH9MmO2QmgDs36+3oQtV3hefuYyRiRgnhytQwa3gQkiFZQbPdFVeEGctg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="UTF-8"
Content-ID: <1DBEC9B4070EBD4D8620F79D8552DE0B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3884
Original-Authentication-Results: siemens.com; dkim=none (message not signed)
 header.d=none;siemens.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 173881e7-68b3-448a-ba6e-08d86930691d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hHEbjXETs82bhH2L02jyvIG/a9JIyzJVma6uAD2du4SrqmMkaNl1zllhb088Su+ayx9goFc2Yoj+XY8vStZtujwuJGEZTr4aW9jBnAb0NQSp7OyV6J14j/Cyuy2x4z4UElct1c/uo3GnL9Q4LsZ+Di8UwNNxCGEE6HgAih81uyh90BD4gkSOc0dAWq+3oHdetEa8McPfE85GhnyxO+P2r2sPZGt5EIy3yqlJdUmSSVUKnpWyDasopakp4BykJ3YpvNvDWFsJy+c2sKmKE/lyL28wZ37H2gcqBypxMtywYlG/dELuMgdsAIKCqfRsXPwprRjeYH0dtEYFfVZlN+3exsIcacHJjdTY6gw+5ypWTc79N8W8Zw8xiF4LS2Meugb3MZwyULnAQA63kCy1bixUrQ==
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(376002)(39860400002)(136003)(396003)(46966005)(5660300002)(2906002)(6486002)(336012)(86362001)(36756003)(356005)(316002)(110136005)(8676002)(82310400003)(81166007)(83380400001)(8936002)(53546011)(6506007)(26005)(47076004)(82740400003)(33656002)(478600001)(6512007)(186003)(2616005)(70586007)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2020 13:13:50.6885
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f8555c0-563f-4100-056b-08d86930806e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3713
X-Original-Sender: chase.conklin@arm.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com
 header.b=s4oPQa1T;       dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=s4oPQa1T;       arc=pass
 (i=1 spf=pass spfdomain=arm.com dkim=pass dkdomain=arm.com dmarc=pass
 fromdomain=arm.com);       spf=pass (google.com: domain of
 chase.conklin@arm.com designates 40.107.1.70 as permitted sender)
 smtp.mailfrom=Chase.Conklin@arm.com;       dmarc=pass (p=NONE sp=NONE
 dis=NONE) header.from=arm.com
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

On 04.10.20 2:00, Jan Kiszka wrote:
> From: Jan Kiszka <jan.kiszka@siemens.com>
>
> Array lookup is simpler, given this input-output mapping. Cover the
> 52-bit case as well at this chance. This also obsoletes a couple of
> PARANGE constants.
>
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> ---
> hypervisor/arch/arm64/include/asm/paging.h |  5 -----
> hypervisor/arch/arm64/paging.c             | 19 +++----------------
> 2 files changed, 3 insertions(+), 21 deletions(-)
>
> diff --git a/hypervisor/arch/arm64/include/asm/paging.h b/hypervisor/arch=
/arm64/include/asm/paging.h
> index 67664efa..932dbb50 100644
> --- a/hypervisor/arch/arm64/include/asm/paging.h
> +++ b/hypervisor/arch/arm64/include/asm/paging.h
> @@ -101,11 +101,6 @@
> #define SL0_L02
> #define SL0_L11
> #define SL0_L20
> -#define PARANGE_32B0x0
> -#define PARANGE_36B0x1
> -#define PARANGE_40B0x2
> -#define PARANGE_42B0x3
> -#define PARANGE_44B0x4
> #define PARANGE_48B0x5
> #define TCR_RGN_NON_CACHEABLE0x0
> #define TCR_RGN_WB_WA0x1
> diff --git a/hypervisor/arch/arm64/paging.c b/hypervisor/arch/arm64/pagin=
g.c
> index db8314a6..cccce410 100644
> --- a/hypervisor/arch/arm64/paging.c
> +++ b/hypervisor/arch/arm64/paging.c
> @@ -26,6 +26,7 @@ unsigned int cpu_parange_encoded;
>   */
> unsigned int get_cpu_parange(void)
> {
> +static const unsigned int pa_bits[] =3D { 32, 36, 40, 42, 44, 48, 52 };

Hi Jan,

I think it's safest and easiest to treat the 52-bit case as if it were
48-bit.

The 52-bit case is a bit trickier than the others in that it requires a
64KB translation granule. With a 4KB translation granule, the maximum
number of PA bits is 48; programming for 52-bit is treated as if it were
48-bit, so having this indicate that output addresses are 52-bit is a
bit misleading.

The real problem is that we set T0SZ such that the input address size is
the same as the output address size. When not using a 64KB translation
granule, programming a 52-bit input address size will result in
translation faults.

Chase

> unsigned int cpu;
>
> /* Larger than any possible value */
> @@ -42,20 +43,6 @@ unsigned int get_cpu_parange(void)
>     (per_cpu(cpu)->id_aa64mmfr0 & 0xf) < cpu_parange_encoded)
> cpu_parange_encoded =3D per_cpu(cpu)->id_aa64mmfr0 & 0xf;
>
> -switch (cpu_parange_encoded) {
> -case PARANGE_32B:
> -return 32;
> -case PARANGE_36B:
> -return 36;
> -case PARANGE_40B:
> -return 40;
> -case PARANGE_42B:
> -return 42;
> -case PARANGE_44B:
> -return 44;
> -case PARANGE_48B:
> -return 48;
> -default:
> -return 0;
> -}
> +return cpu_parange_encoded < ARRAY_SIZE(pa_bits) ?
> +pa_bits[cpu_parange_encoded] : 0;
> }
> --
> 2.26.2

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/AF18C444-D146-4E7F-9D8B-F1DCBD161882%40arm.com.
