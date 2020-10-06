Return-Path: <jailhouse-dev+bncBDJ7ZUWTT4DBBXWQ6H5QKGQEMH34SPA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23d.google.com (mail-lj1-x23d.google.com [IPv6:2a00:1450:4864:20::23d])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA6A284BFF
	for <lists+jailhouse-dev@lfdr.de>; Tue,  6 Oct 2020 14:51:45 +0200 (CEST)
Received: by mail-lj1-x23d.google.com with SMTP id n24sf2926476ljc.9
        for <lists+jailhouse-dev@lfdr.de>; Tue, 06 Oct 2020 05:51:45 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1601988702; cv=pass;
        d=google.com; s=arc-20160816;
        b=xOjD4O1OtswR6LYCogH2a5A3RpUwoKJzCU/xrFX2hyBTs3GFfGxiGKPGUqc1QAzUww
         wLZgL/0JRLZFLKDXxVGvsF9Zk6FlY9C36f8zg/8kg7I+Pb23C8Or6iB1M0l+NHDlK7Ib
         5PCrJQLGdq4fG8UaK4DfgRQqkxMdLOsVnUBtVpUds8LHS7BujxXb0LRyiX+LspYoKQqN
         QbuMgn1h3tKTchZCXI9/geq46Cdm7tQi4uL3VmMIH4kx1Rdqfz2NLljSyw88Bjtvysgj
         APBkB4n0lWM8FXeHdo020PKH3YPQC0VhzB7qTjpu6bhO3f1WDxskBydAvmUkAKcXtvPB
         hHzQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:original-authentication-results
         :mime-version:content-transfer-encoding:content-id:nodisclaimer
         :user-agent:content-language:accept-language:in-reply-to:references
         :message-id:date:thread-index:thread-topic:subject:to:from:sender
         :dkim-signature;
        bh=GSZZhGmz1RcMb3djPMWDoP3EqfNfcZEiMDSTJfwp4qA=;
        b=M8UsXxbHcX9Jw6QTHC2b47h41hmNrLrHWQ+GKp0fVbAuFxkLYCoBqqFoP3GSrwwS3I
         xETXwWJc+tme5kAPRv9dVmXo8t0+nwU18XRn0MhmpACaEf+JiCbHwi6JopBUUlrKRiU7
         ma0MNzlaSJDZpoPyU9nPEm/WYoWhiFain7clLWgD/8hQtN60mbfj9LcgMPnH5QA5UGOl
         htFmixBoJmUIdK9NM0OxJr0NDx8T7GdFpKDSN+WqhylnBuik6IlRWqbeHdHKB2EYpHZh
         Y7eEevKivjVjJcXAj7DcyEjPDOm4NgAXbnQx1/Vw6PJkK0tDUjVOT4+XEH0T0GDNhrVX
         GCyA==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b="uuK7O/3R";
       dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b="uuK7O/3R";
       arc=pass (i=1 spf=pass spfdomain=arm.com dkim=pass dkdomain=arm.com dmarc=pass fromdomain=arm.com);
       spf=pass (google.com: domain of chase.conklin@arm.com designates 40.107.6.57 as permitted sender) smtp.mailfrom=Chase.Conklin@arm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=arm.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language:user-agent
         :nodisclaimer:content-id:content-transfer-encoding:mime-version
         :original-authentication-results:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=GSZZhGmz1RcMb3djPMWDoP3EqfNfcZEiMDSTJfwp4qA=;
        b=biY0pdfpb1KzC0vM3uIIYEgQyyiq23nhcsFcA5ziGXsWZxOiQSfMtCcWGymI65ys4g
         hbhD9e0WWdhytMRa+gsXYK5Fs8em48nhuvM9W3NKHo0fngcwtj6T7LkLaF5Biv1H/vBU
         J2QPpkS7jMkjYPAbGDyG9fSD0cOOi8U70vru0sRVpi0HxAEWMv9Jg4ZThymN9xfoO5NK
         SMazmw0/WA0HAMjAmeuaoG9Iig5pqiV5+HF65k00Cls04wLuRoJKIchV9Yt1XWIeAlFy
         szMDBkXAHUaJdOWiLr1dXLpqP4A80ilPnuwDQh8cExTirb6JPHO517zayNxXo7VstG7z
         folA==
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
        bh=GSZZhGmz1RcMb3djPMWDoP3EqfNfcZEiMDSTJfwp4qA=;
        b=UWImOZ2LpwpX6fHk0ETRipaImjxAEBXGpKZlygb4/avMV9nPb6AZWDALLmVVtc2z+L
         9K7ImROC1O0W5pMiTJrfVe1DLLY04v0phBpjMB5M9IUycwD2hdsqn59trpfV8dKHP1lF
         PUUU7OGDkpWP+j4ChCtY5j6+9rqG6/wah1MU9g0/rswK74VuV3OdwlEVsH3SPjfCR9W+
         Bue18eDF8y8k0U37GCGfhQJPZtwfB5rKIdaHC3FNsL8/MsF5UvlbJln8BkEBinDITDl2
         kKqgM5TJaxdYbMsNQdSp6u6j8E7yAqwaUvQnBR92hofmJyvrcqUuK9NQ7o4YAUyqjxVV
         X82w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5323SYRv9fIBnDc+zxG2iiQwYf7g34j+b+cXyEzkz2vD81xEFDti
	lW5RJosgjveL54JLYZ2qedk=
X-Google-Smtp-Source: ABdhPJw6gR6QMSBdH+Aj3DpX/Qp2vdm23l4qK15Nj1/qaqo9iqtgmv7vDwn0ymHRHsDj64hh8d5iUw==
X-Received: by 2002:a2e:9612:: with SMTP id v18mr1664402ljh.255.1601988702795;
        Tue, 06 Oct 2020 05:51:42 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:3c13:: with SMTP id j19ls1673627lja.10.gmail; Tue, 06
 Oct 2020 05:51:41 -0700 (PDT)
X-Received: by 2002:a2e:5304:: with SMTP id h4mr1797107ljb.460.1601988701540;
        Tue, 06 Oct 2020 05:51:41 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601988701; cv=pass;
        d=google.com; s=arc-20160816;
        b=pOr6Wjj5iFTZb1P7DaQcp1E8cvbC7AGX3UXxwoCqgwWSixqZ16dJArn4IP8MgbEILp
         jPlh2+3wvoXVkXLDkHMfMYIOnDiUtAJmvk4NRPf39DIayPQ87aFyrONCGmqmE15+Q1rT
         SKCgwhIXpC4QT8WabRpqKBhmdIXd+KHSTH7AJ5Dzj7N+OX/3fFJkM/9t/1bHfZwWajAA
         GBPdWiwn0dDw6z7e+twy63ayYtcD3v80Ts28OYEOzZZmX7wEvtSEHLzKnSxXedW90tmN
         6yhA2v79NNGLB1U5G2UWO3SGPmnNjweKK6k0H+q6G0e/2tLJdbR/IilJwfgRreFMiZV6
         j4dQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=original-authentication-results:mime-version
         :content-transfer-encoding:content-id:nodisclaimer
         :authentication-results-original:user-agent:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:dkim-signature:dkim-signature;
        bh=cfBImb6J/L2GaFX15KHndMeAL2KdCVTYAJ/hkcaZEeI=;
        b=ljcyFb31PWlJ2rakKpKnrAcVbI+RoeMVjxISXdIBmhnOvl/Nd0M/sg/Rt25dsyRmhm
         d0FOJzeiwJakldPuieiH5RIgIqtIcLImvHumr7shOxIkDf3JQoVf3lrVtWvx+SKE7/nu
         J5kbkKKk3UzESin3AvxKbRi3fgzJM2kBYI1CkDDpQZ4koPgrpaMIu3l+cD6/z93kUF+B
         rcCdrZB17Q31ckbQ1cCOz15q7M5jeusQYd6Ni3ffjWRbEJ0jjQkRGEMlZFK/szUOx2Lk
         zZhtPm1h41asgCSmM4WqxFsn7CP4re6Aqpbu2N2hESr52lOM2MWQa6QWiAyJWMlqHjuI
         t1pg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b="uuK7O/3R";
       dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b="uuK7O/3R";
       arc=pass (i=1 spf=pass spfdomain=arm.com dkim=pass dkdomain=arm.com dmarc=pass fromdomain=arm.com);
       spf=pass (google.com: domain of chase.conklin@arm.com designates 40.107.6.57 as permitted sender) smtp.mailfrom=Chase.Conklin@arm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=arm.com
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60057.outbound.protection.outlook.com. [40.107.6.57])
        by gmr-mx.google.com with ESMTPS id n5si72826lji.5.2020.10.06.05.51.41
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 06 Oct 2020 05:51:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of chase.conklin@arm.com designates 40.107.6.57 as permitted sender) client-ip=40.107.6.57;
Received: from AM0PR02CA0083.eurprd02.prod.outlook.com (2603:10a6:208:154::24)
 by VI1PR08MB3391.eurprd08.prod.outlook.com (2603:10a6:803:83::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.21; Tue, 6 Oct
 2020 12:51:39 +0000
Received: from AM5EUR03FT017.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:208:154:cafe::e8) by AM0PR02CA0083.outlook.office365.com
 (2603:10a6:208:154::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.34 via Frontend
 Transport; Tue, 6 Oct 2020 12:51:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; googlegroups.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;googlegroups.com; dmarc=pass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT017.mail.protection.outlook.com (10.152.16.89) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.34 via Frontend Transport; Tue, 6 Oct 2020 12:51:39 +0000
Received: ("Tessian outbound bac899b43a54:v64"); Tue, 06 Oct 2020 12:51:39 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: dc56621677050510
X-CR-MTA-TID: 64aa7808
Received: from e822c1d72242.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 28876C20-11C6-4675-B105-1C1BE48ECF61.1;
	Tue, 06 Oct 2020 12:51:01 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e822c1d72242.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 06 Oct 2020 12:51:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mYtfh13q4hAUq8L/p5j6Yyqm3wOkXO5oBdLsvsvDdzXYkeVIZL+3mjtxsz397+haTgE1HMZcIbACC/5KEay54K/pT+FGekMTt7OSjOpr6aMaIN2ABas/LoUnvYAR9M5VFlI2yTOTRs86ttMxSu0wS6qxGwwd6sA57I6iB9PaBdZ2ZPpgdoO1j/qK4qk0B290U81vu6S8C0sgWReoZmFGF9jO4uUJPQ8C+VzQS7SDX5qbdqwJk8wjkKd/Q4n6iwjUtptNSHELhEwQh4gS+Lw0O7NsAfABqwUe2paTPKFFn3UbzQpMOEyu3a6MI8ZiDBvLJrqAMjMKbSFczZv1ouhznQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cfBImb6J/L2GaFX15KHndMeAL2KdCVTYAJ/hkcaZEeI=;
 b=Jo9pqPzGdUPgxWJV9qM+97w/8TT162LCovvfVd1l3PXjLx0uvnzSQ2sWOIrajxUByeDpcLXzI4NciDTayldS0sIh1/CR4NI+0sZcoRg5APdpnzRxHzi0nQpALD/lvU73a+zOmjEeVkrZXlWpMK5HI4SX2neszLKCbZBOP1bctvvdO/Jg6w7DG2QvOu8dMdcZbkr/CI2RXV1JJMFgO2X2egFF7GnxZeI3ReQ0Xv9l/IhFz0PwpESWqwZ4L189BUm2BTsbCdHPW5KZiVie0BiGkm//TXrEodwaFUNtVI924auS9kJLYhZZ4Ss+pdE8hludL/VfyKS1dvjKqcKtWB5vOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from DB8PR08MB5481.eurprd08.prod.outlook.com (2603:10a6:10:114::9)
 by DB8PR08MB5484.eurprd08.prod.outlook.com (2603:10a6:10:111::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.35; Tue, 6 Oct
 2020 12:51:00 +0000
Received: from DB8PR08MB5481.eurprd08.prod.outlook.com
 ([fe80::b0a9:222:8373:97e1]) by DB8PR08MB5481.eurprd08.prod.outlook.com
 ([fe80::b0a9:222:8373:97e1%3]) with mapi id 15.20.3455.021; Tue, 6 Oct 2020
 12:50:59 +0000
From: Chase Conklin <Chase.Conklin@arm.com>
To: Jan Kiszka <jan.kiszka@siemens.com>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 03/45] arm64: Simplify get_cpu_parange, add 52-bit case
Thread-Topic: [PATCH 03/45] arm64: Simplify get_cpu_parange, add 52-bit case
Thread-Index: AQHWmoCdMq31ERIHdkapS9nxLVFgIKmIqbgAgABXKICAAQKiAIAAAiAAgAAwOIA=
Date: Tue, 6 Oct 2020 12:50:59 +0000
Message-ID: <D7163164-6A8C-4704-9E08-CB0E97BBCCF4@arm.com>
References: <cover.1601838005.git.jan.kiszka@siemens.com>
 <7434305f16589d47d0248ba127edd82bf234d9e0.1601838005.git.jan.kiszka@siemens.com>
 <AF18C444-D146-4E7F-9D8B-F1DCBD161882@arm.com>
 <3a2f9cd9-3cb6-611e-4cb2-642f8280ee86@siemens.com>
 <a4e8e137-e632-c312-3252-261a03cfc46a@siemens.com>
 <de3b9649-6e4f-cac7-2216-8c88572b0a16@siemens.com>
In-Reply-To: <de3b9649-6e4f-cac7-2216-8c88572b0a16@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/16.41.20091302
x-originating-ip: [72.177.104.243]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3e3fdef1-b088-45af-e30c-08d869f69163
x-ms-traffictypediagnostic: DB8PR08MB5484:|VI1PR08MB3391:
X-Microsoft-Antispam-PRVS: <VI1PR08MB33918068A0FC4157AEA4E7C1FB0D0@VI1PR08MB3391.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: b3WiHzVE1j9mYsjLvtDRsX3JrFCo5lrHRHUoARc3kAvnYlaO2+mI01mOJbigyYIFKAISbBQiojrSzw0/0/emgzL9UwRJIv2O5PtXzBHBDR/ZHRKSvWdx6UHwa5pBie4teE57Zsz+Sy5Fc8eVz05lDN50kEU2bHT/THas6U5v4fuP28zyIqnlXDWkStTDGIwq/JVlHK1++oWd06EiOvIN4HQx6IfoyFXJRzgrbebbkaZTWhhbLBjKGGS518Sc1o0fS4t2QwpN2FCKP7wifEc01y4A/jtBS1Ye9SXHamvzP9NJ6x/870nSJuMpk2jgnpJk9uVDRQ5kfxs9kb12DqiLhg==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR08MB5481.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(396003)(376002)(346002)(39840400004)(33656002)(86362001)(5660300002)(76116006)(71200400001)(91956017)(66446008)(66946007)(66556008)(64756008)(66476007)(478600001)(36756003)(2616005)(6506007)(53546011)(26005)(8936002)(186003)(2906002)(6512007)(8676002)(316002)(110136005)(6486002)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: na7XglHdiIIOTtT+nrvUAXkDBrULnPMOqXINDUgEIcoRBHoqatka0rbqVtdW07eWVXnohK+VAQRIGobj10Fwb6Ffmuh2GMnlNSdnHBI04onhFuTPtXwTYx/7w/OGaJGAel0I6uoiVyyWVdK/sekXko1kI9tMycZdyVlEYR89gdpsysHdnoxG20zt2qgSbvhr0qyJwd/t7Sq6uSPPgT8GH9zHWRUFaElAARGWj6RSnh2sBe0VfdQPiOPIGzoFcL61W3AilHqGxE3/7WAO8A6Wn33B4RRipxVkw72je9NCS0vfL0r/wPKHG+GLdnbiuBJW9Rvc5fupZ1+/dTg/koI5gEhTmJvuZCP47wXQDbUKkeCIAx2/ndRiR/MsFUet0iKwKDE/hX47wrWu5Xn4G+t0Ps9B6R30E52WnYhvo2YzfEQz3Jrqchq+0hEVmu8As5kxVNl9FmGPtXZ5D/M9sOPRIVdtIsd1WLtQq+Y+Hp3WTqJo6MSxImdPu66QjKxhK8dZdh//z4YaNEaftZtN3VfiR3opMeJG5ZqbXo2J0U4kmUB8Whpmw5XSIrb1x8E6mPFbUTMH61y/2BI1I/cveWqL/rbjvSxMQwAXZwHUllQKlh9JmJryrAuwcWwHVQdYPPi/Frvuftc0a4DQg3GR/cXC4g==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="UTF-8"
Content-ID: <9FACDEEF7EFBE044A9A728DE10075FC6@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5484
Original-Authentication-Results: siemens.com; dkim=none (message not signed)
 header.d=none;siemens.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 4702f5bb-5720-4249-7aca-08d869f679c6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SKj7q04TwF6lV8oDQpuVL+oWc9wlIRBSr+lkl7tQAP3KnX4Ao4TzFo/ipzrXcyQblYP2ECJg3/K+e3gFFFZgHlUuzi27QyMfqik1Bf3uJpsa4Vf1+RG4997XsD6JcdmTMp3yb5Nf8RLVTCyvlSfmlLIN4WPnWj1UTEwR2RkRA6OpPZwdkXboN9A4Bb+b65d5b2M1bbeJCPiqoLxEK7eV3tW4FHnFtKhor7Jr64zJJBnzb9wABfifGYdCwtBXszCVk2EfRw1CUJuzIFLCl235aDx7IdeuUS2E3MMlnCtct+SpPW5FzO1JOgsoq5NhUg/KaxxaeOwi/iVCR8+bVfISHyjak6bn6hx/1uVyIe3Z2QE2YsYwW5wZTiCaJW6WxVLRXgWNKeG8bYYTEG5xO+2aiQ==
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(396003)(39840400004)(46966005)(356005)(70206006)(70586007)(2906002)(83380400001)(8676002)(47076004)(6486002)(6506007)(81166007)(36756003)(2616005)(26005)(53546011)(478600001)(186003)(82310400003)(36906005)(316002)(336012)(110136005)(8936002)(5660300002)(6512007)(86362001)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2020 12:51:39.4429
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e3fdef1-b088-45af-e30c-08d869f69163
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM5EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3391
X-Original-Sender: chase.conklin@arm.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com
 header.b="uuK7O/3R";       dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b="uuK7O/3R";       arc=pass
 (i=1 spf=pass spfdomain=arm.com dkim=pass dkdomain=arm.com dmarc=pass
 fromdomain=arm.com);       spf=pass (google.com: domain of
 chase.conklin@arm.com designates 40.107.6.57 as permitted sender)
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

On 05.10.20 23:58, Jan Kiszka wrote:
> On 06.10.20 06:50, Jan Kiszka wrote:
>> On 05.10.20 15:25, Jan Kiszka wrote:
>>> On 05.10.20 15:13, Chase Conklin wrote:
>>>> On 04.10.20 2:00, Jan Kiszka wrote:
>>>>> From: Jan Kiszka <jan.kiszka@siemens.com>
>>>>>
>>>>> Array lookup is simpler, given this input-output mapping. Cover the
>>>>> 52-bit case as well at this chance. This also obsoletes a couple of
>>>>> PARANGE constants.
>>>>>
>>>>> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
>>>>> ---
>>>>> hypervisor/arch/arm64/include/asm/paging.h |  5 -----
>>>>> hypervisor/arch/arm64/paging.c             | 19 +++----------------
>>>>> 2 files changed, 3 insertions(+), 21 deletions(-)
>>>>>
>>>>> diff --git a/hypervisor/arch/arm64/include/asm/paging.h b/hypervisor/=
arch/arm64/include/asm/paging.h
>>>>> index 67664efa..932dbb50 100644
>>>>> --- a/hypervisor/arch/arm64/include/asm/paging.h
>>>>> +++ b/hypervisor/arch/arm64/include/asm/paging.h
>>>>> @@ -101,11 +101,6 @@
>>>>> #define SL0_L02
>>>>> #define SL0_L11
>>>>> #define SL0_L20
>>>>> -#define PARANGE_32B0x0
>>>>> -#define PARANGE_36B0x1
>>>>> -#define PARANGE_40B0x2
>>>>> -#define PARANGE_42B0x3
>>>>> -#define PARANGE_44B0x4
>>>>> #define PARANGE_48B0x5
>>>>> #define TCR_RGN_NON_CACHEABLE0x0
>>>>> #define TCR_RGN_WB_WA0x1
>>>>> diff --git a/hypervisor/arch/arm64/paging.c b/hypervisor/arch/arm64/p=
aging.c
>>>>> index db8314a6..cccce410 100644
>>>>> --- a/hypervisor/arch/arm64/paging.c
>>>>> +++ b/hypervisor/arch/arm64/paging.c
>>>>> @@ -26,6 +26,7 @@ unsigned int cpu_parange_encoded;
>>>>>   */
>>>>> unsigned int get_cpu_parange(void)
>>>>> {
>>>>> +static const unsigned int pa_bits[] =3D { 32, 36, 40, 42, 44, 48, 52=
 };
>>>>
>>>> Hi Jan,
>>>>
>>>> I think it's safest and easiest to treat the 52-bit case as if it were
>>>> 48-bit.
>>>>
>>>> The 52-bit case is a bit trickier than the others in that it requires =
a
>>>> 64KB translation granule. With a 4KB translation granule, the maximum
>>>> number of PA bits is 48; programming for 52-bit is treated as if it we=
re
>>>> 48-bit, so having this indicate that output addresses are 52-bit is a
>>>> bit misleading.
>>>>
>>>> The real problem is that we set T0SZ such that the input address size =
is
>>>> the same as the output address size. When not using a 64KB translation
>>>> granule, programming a 52-bit input address size will result in
>>>> translation faults.
>>>
>>> Ah, good to know. Will fix this. Also requires to cap
>>> cpu_parange_encoded accordingly.
>>>
>>
>> Fixed up in next. Not resending yet as the series is large, waiting for
>> further feedback first.
>>
>
> Hmm, I just realized that we are hard-coding PARANGE_48B for the initial
> page table in entry.S. Is this safe even if the supported range is smalle=
r?

It should be. Recall that the issue with 52-bit was really because the
input size (VA bits) was larger than what is supported in the 4KB
translation granule; there was no functional issue with programming a
larger output size as the architecture would treat it as the largest
supported value. Here, we don't have the input size problem and, like
with the 52-bit case, the output size is treated as the largest
supported one. We'd expect an address size fault if the translation were
to produce an output address larger than the maximum supported size, but
that shouldn't happen here since we assume that the PAs for the UART and
hypervisor binary passed to init_bootstrap_pt are sane.

Chase

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
jailhouse-dev/D7163164-6A8C-4704-9E08-CB0E97BBCCF4%40arm.com.
