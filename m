Return-Path: <jailhouse-dev+bncBAABB34VY6GQMGQEFHBSMUQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23f.google.com (mail-lj1-x23f.google.com [IPv6:2a00:1450:4864:20::23f])
	by mail.lfdr.de (Postfix) with ESMTPS id 4490A46E576
	for <lists+jailhouse-dev@lfdr.de>; Thu,  9 Dec 2021 10:22:57 +0100 (CET)
Received: by mail-lj1-x23f.google.com with SMTP id r20-20020a2eb894000000b0021a4e932846sf1600892ljp.6
        for <lists+jailhouse-dev@lfdr.de>; Thu, 09 Dec 2021 01:22:57 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1639041776; cv=pass;
        d=google.com; s=arc-20160816;
        b=HueTxyuMctmep1izqxfKgj+kZFVu8/E2yf5/m4ErkIEcBge6iX6U9VL7nwqXsO4Mfo
         HwIl2Iqu53yOnRZk0nFEZaGD4yj06ZvZ1M2UH7qtaRKZRkVygycXvrZWzxFQALI4BXBl
         0e8CBfbma4HCP2i0VRKcWtDZIHWR29yv7fgegnmo2Ae/hP6B29A3ig1nHI8L0XAbXlC6
         I55w7Yjq+wbQZimyCXGpGnxFpQudmqWT7RsqwtMD+nP5IFyryOU1f6+/xJWrJHySbd2z
         KbvzvZXxXoFzQf5mkaHxVXe4VwLdkAbFlQf8BkiNSCy0KlDXaZ/1sn+IBghRz7N+xPBy
         nCKw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version
         :suggested_attachment_session_id:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:to:from:sender:dkim-signature;
        bh=Kdh3L/YeO0+JXpa11h1m1RKsQLNUHGHQQqoVOgiDrY4=;
        b=hhjmt5zU+aRBJsPjlttMnADh40I7kex1b7KCAxfd9gK3KwJ7S+CBghNOlQN/VwQjU1
         DtF178DFt8mI22RzzGpY4CYRNoE+tA+Oong+6d5Hql/6RcN4HoyJeb7ZZXUeazb9XyWF
         pc3jJ+H/3naNY12sq7G9R+7rre2IyZpGXH4RvOgtj5OaHZukmKRa/SryLs/Vhjc+ANMs
         alLsvKdtQOOyj/KeFM98BJZqankxFekNVkBW3M5HvsN7/w9KEjr4xD6n5rghOZlklIYf
         5xy4XskzszqZy506cs5agp34YyW4cgJdcIwvNTVXFQGQlfU0aONSS6ichh47+0KyVcVw
         TNDw==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@NXP1.onmicrosoft.com header.s=selector2-NXP1-onmicrosoft-com header.b=iJq9GBzC;
       arc=pass (i=1 spf=pass spfdomain=oss.nxp.com dkim=pass dkdomain=oss.nxp.com dmarc=pass fromdomain=oss.nxp.com);
       spf=pass (google.com: domain of stephane.viau@oss.nxp.com designates 40.107.6.44 as permitted sender) smtp.mailfrom=stephane.viau@oss.nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :suggested_attachment_session_id:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Kdh3L/YeO0+JXpa11h1m1RKsQLNUHGHQQqoVOgiDrY4=;
        b=tuWC8UumrK3NQOj+xHDao7LqjGcq5sCH/H30FWJ3sd36YrR2QFxrlv3zFdsiBhZ7fQ
         nN1bZ4UAI9jz/q6JtJ0eZvBG+44M522VwguEV/y3NPlAa2CEhHHLpxpRzyKN3GqVL5ZB
         r4qepeP6F6xhy56aqNJbi5B1/34/m6oFRD/US3BUA19IO7TZjOFelHMaU/csnv1olC24
         LkAZt01tDm5SGn9QKNti0LWtCf8K8tYUwSShh+ikxY2CDfEvj94/J+yWP/9P+e8MBryc
         jDuUtnuE5REnzvynGNToI6lcRAANrodboLfRlTp+yDv+1E+/KhJAwT/oPVd2uGS26X1U
         J2YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:references:in-reply-to:accept-language
         :content-language:suggested_attachment_session_id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=Kdh3L/YeO0+JXpa11h1m1RKsQLNUHGHQQqoVOgiDrY4=;
        b=zBoCHda3VXkjU/lD+ggkpaF/ysPy9qD7Vdm5nZ6dYtD4UT8n8pt/UbMzN90qWTKmjX
         fb63qackzJj+6S0vFF9tdYtI/Y5TlQgqMmSkn4skvOtnS2ISr4kPJpBCllFvvSn7gRZV
         bw3RetxVjMp/hg3gqu71swhtj+vtuqSS/u56DLxHcZQsaZqTnWIUvitoG7ei5KJQBpZR
         MpmM+f0h1+mTV9USOCmIUxfo43eI5Vw1G+R03HeA1N71l2Vu6kDkHa8Qtcgq/QsdxusT
         qtbG5jWocWjvY2S5oVnevRGWiStHXElXuxQ0Glv+oTKLdp9g7CSBpzRgq3Mr81oWC5MV
         zgyw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5333nTRrG+rvg7Y6jye7U6rkzrD60vA42lQ2hBtX4471uVEaLiCi
	bvZ06NfXpUYYD4DNg8scSUk=
X-Google-Smtp-Source: ABdhPJxIl/5BKo/oxhw8uipoWU6TqeKb7Avfd32OC6W+ii9KEUr6E9Vw8ePakm99EUHx4nz5iOky1Q==
X-Received: by 2002:a2e:8396:: with SMTP id x22mr4996848ljg.255.1639041776280;
        Thu, 09 Dec 2021 01:22:56 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:234c:: with SMTP id p12ls2907229lfu.0.gmail; Thu,
 09 Dec 2021 01:22:55 -0800 (PST)
X-Received: by 2002:a05:6512:3a89:: with SMTP id q9mr4773354lfu.515.1639041775267;
        Thu, 09 Dec 2021 01:22:55 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1639041775; cv=pass;
        d=google.com; s=arc-20160816;
        b=cSCvkFWILw9gLwPCp5/p0Lh1mo0VsSmHk/C5LkI6EINFUo+4HXHawrRBnjwZ9kY8o8
         uN6h4eL+gIKdxeopoI/nT6ET2o2IpT+A4j+yGWzzlKIEOIQkjxOrvO2rrVARoOypnG2c
         Bu6dK4y6EAlI/syIXmc/L56DUQO40NVaju0gCRMIuK0KmUU8JjcYXtb3bAQ0AjNAkqxb
         RQ0ipmCkdDxQhN/B+/+0GDv+8N4NuQae1RVE/62pjrNTuJTTXly+qwVBvlGqhPJqMM+e
         s2VsT32ybi3H2r5ISWZrIwDgENgUq1dhr3Bc65AVlmAPHjOmdQ1XZgQhc0lUgT2Nsek5
         X/ng==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding
         :suggested_attachment_session_id:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:to:from:dkim-signature;
        bh=9gxerzoFsiQrtxvAcqiOZc++b9EYaSyZaLuLUUmLPRA=;
        b=ouj6q0WyMOTdYROVGwiv+WwXHXLmpAQot3qy92RxAdVi4bLNS4A3VtRqZpmwF4n7TU
         +LwtZZuCF8WLMQTip45w3Wt1zl9blDrV6wOzP5hBB49rBarf88Bizz9NNEnKjxLsyyx/
         tAgdKSePqmLY2o3B8aEwA4BZXvyU6/FtO80loX/uE6D85xa3aMAe28DcXGpuIOdAqwsm
         +Km2saEGqx4wHxwHK6YSNNJkbWDjHfbl9u5DOjE1/cORruPY1jfCDYcBL7xhD1iQyzfG
         T8+aL12qVnX+Hzt6c4H3ubwAGnfPRG1b+Ar83Yg45oZf9Jb+L98caEEnXWIjK2kdxmd+
         /Csw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@NXP1.onmicrosoft.com header.s=selector2-NXP1-onmicrosoft-com header.b=iJq9GBzC;
       arc=pass (i=1 spf=pass spfdomain=oss.nxp.com dkim=pass dkdomain=oss.nxp.com dmarc=pass fromdomain=oss.nxp.com);
       spf=pass (google.com: domain of stephane.viau@oss.nxp.com designates 40.107.6.44 as permitted sender) smtp.mailfrom=stephane.viau@oss.nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60044.outbound.protection.outlook.com. [40.107.6.44])
        by gmr-mx.google.com with ESMTPS id b29si385432ljf.6.2021.12.09.01.22.54
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 Dec 2021 01:22:54 -0800 (PST)
Received-SPF: pass (google.com: domain of stephane.viau@oss.nxp.com designates 40.107.6.44 as permitted sender) client-ip=40.107.6.44;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FWBgVaeKF1G53UVhh4Lvuv5dntnZZoVIoM6ZpCAUFE3cv2e3T+V7jWkwPcjYY9kjjvlH0uw7AypHDqsdqGk7mB39WldaVZ25PjyfYXzP3myLJ5tM8lb/LFneg5uLPSigKJKsMSHaF7jr53RFAWcqW8rwuqqMTjj6iZ3cliXHiEEyVbJdlzIWxEY+EeJ7ZGKYK8Y2z4eYXbsGdlfF4LwlwYX3p/6rxTIw5PQBv9c48n7VwFr2XMaKDpsVMTOaNN6J8UiGu8I3Fn46N11lrrPWqlMJSnTtglSBhwGz6iQ/39MDwly8g3nVA+2eOxeOsyXQziuE8db/SjSQqk70Dj7pig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9gxerzoFsiQrtxvAcqiOZc++b9EYaSyZaLuLUUmLPRA=;
 b=DGU6FGF8Ce8iRBXIQ5uV8V/4rmA36ak0X9kkO90I/3eKc7iRYR1cXh+BG06a64qZ5UdM25UiyN2F0wGxUVe2Uww8jQ2S9wFPEXEDPPlMfBZl9nwmkfdIuiWNcwlbovb9uG7V3Uwxvc3kImsVdmMTB4OP8hQl7Yeqb3XRgl6cD0SYYVnDXB0fEVeT9brx2AoqDMtt3cU2coZiEsmb/cYmYEoBAa+hueM0iEZv6C19wpbeEzXw0+n2okqy1YM3WZVuR1ec9oZeWLVOFtA0p+8sVSvwF4JK3PoajCe3lvhHyGIK1sVdrmf5discVZSpt4oPU9rSy96YOQywfcr091Yfmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
Received: from PAXPR04MB8863.eurprd04.prod.outlook.com (2603:10a6:102:20e::19)
 by PAXPR04MB8781.eurprd04.prod.outlook.com (2603:10a6:102:20c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12; Thu, 9 Dec
 2021 09:22:53 +0000
Received: from PAXPR04MB8863.eurprd04.prod.outlook.com
 ([fe80::81f8:3fd:3f3c:df36]) by PAXPR04MB8863.eurprd04.prod.outlook.com
 ([fe80::81f8:3fd:3f3c:df36%7]) with mapi id 15.20.4755.022; Thu, 9 Dec 2021
 09:22:53 +0000
From: "Stephane Viau (OSS)" <stephane.viau@oss.nxp.com>
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	"jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>,
	"jan.kiszka@siemens.com" <jan.kiszka@siemens.com>
Subject: Re: [EXT] [PATCH v3 2/2] [RFC] configs: imx8mp: Convert a cell using
 helper files
Thread-Topic: [EXT] [PATCH v3 2/2] [RFC] configs: imx8mp: Convert a cell using
 helper files
Thread-Index: AQHX55QRSE03bzdvo06jlOf5EAGa3Kwfy7IAgAofLS0=
Date: Thu, 9 Dec 2021 09:22:53 +0000
Message-ID: <PAXPR04MB88630D511CA5956C1BE79DA9A7709@PAXPR04MB8863.eurprd04.prod.outlook.com>
References: <20211202154800.2671-1-stephane.viau@oss.nxp.com>
 <20211202154800.2671-3-stephane.viau@oss.nxp.com>
 <51f0d564-bcba-23b2-1651-1525d3b35e4d@oth-regensburg.de>
In-Reply-To: <51f0d564-bcba-23b2-1651-1525d3b35e4d@oth-regensburg.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: ddbf883a-2d16-3630-ddd9-8dd0ad0cda1c
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6e28626a-d282-46d8-8d38-08d9baf57a57
x-ms-traffictypediagnostic: PAXPR04MB8781:EE_
x-microsoft-antispam-prvs: <PAXPR04MB8781BA10D0711EF2471B264DA7709@PAXPR04MB8781.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VMhCQBotIX+gYz0Z9LjHtLmadK4+i/+52Be3VLQgbo2zVAw3AUXYPdW8iX+vp8cF3s7dndwRkHBnQTAnKWChot+VVdczjg/UlbmSS1a7nMhoRA/1owlM/MxXZjY7onHQxiY4+eFlSwVRXmKJOcxIHh6IsmtQtNh+owrXb2APD7vR2uQxiyTmGE0cZBw3NpWMYLfzLdkFRNQZaupqfvyVk00c+vvf2+E7qAY7CWVSklZ6aXGRkxTdATO3Lp6ncA9iC7s4ei7vLttzpWcQfEItnkOYVVPWb7dAvT07zj27ueTkGfyBALQ3iUvKHG+4jbepwZ+/yvgNgGywPhdn4hkTVg9Fcs9ymBKc4uvBDG16ntrbSMRob1iPtixCtv+deIBQYWwpD+ztvi2mRKSeZyKCvoYEfkWSt858ZVUWFIW8gjTpzN1QI6Pdq+WB5LXWi34FJKMktiO1vNvNgFqviLGW1OZOAuSr3+SSPQI12Y6lJU/eFugUkeqZy68xTEKB0bWiuOlRwuSvEKyil+bft2S03uFf5JiLCyPtPecDpdtDCs74XAYG9p/7IS9WFBF4mK1QK1s2hRqdxEVrWws2szl87oSSP7h/+kTsg738eFbo/sD7aiC9Z6NcVy7jrO6W5xq3RyHSwydy0w+3o+hMUD5CTD2nF9rmeFiMrKjpoYC8eQhTLaH1LYxkzKd+guddZB/EgNGTZrrrqV7rPX6HtrYpwSU8qa+ZV/Jw4vw+dvmp/fw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8863.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(122000001)(52536014)(33656002)(86362001)(55016003)(83380400001)(26005)(7696005)(110136005)(38070700005)(6506007)(91956017)(186003)(71200400001)(8676002)(9686003)(2906002)(508600001)(8936002)(76116006)(64756008)(66556008)(38100700002)(66476007)(66446008)(316002)(5660300002)(66946007)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?TpAGpJ1ZnEH4FLFTYfHCaTqHbhdvcSyUYeJ7KDTD1DblKQKw5UpWEnWJiP?=
 =?iso-8859-1?Q?PAcNRFcOAt/NoATHEzEJo/jwKoVtXkTntvT1dEkEzzxKX7E0Lq9uzdrJCH?=
 =?iso-8859-1?Q?AxrTxj/8tZ9kXuxKWuE/HlBMbWuwCxobMue4fitdiqFy74R3B7KUf4XWOI?=
 =?iso-8859-1?Q?8qAA/KHPeR7ZykHY+goON7442ifU7wfOF95ie5A3FEoxZiN6j47jWVdsqI?=
 =?iso-8859-1?Q?Gs/psPVvWSUFMqOSd3TOsjJm2WzOxWlObTTDN8idsZJiMllfeVEd7LdinB?=
 =?iso-8859-1?Q?ZH8SOZxYH2rvQXopITeH2WrD53ZoF+5tu45AcLrUO/ghJqatLNYrzXFSRF?=
 =?iso-8859-1?Q?EsuUAuobWE/LjUTKAuOTJdadhSWXxQeKKCYeRM3Ux8RBnFl3oPPIqyut9r?=
 =?iso-8859-1?Q?M4+cNXsDjD3bmgechN5vtE+DhqJlP0kIyOBhGZbXKl3UW/dQJdGgNRI7c/?=
 =?iso-8859-1?Q?zml57nUsBuma1DFcTTC2cYGpl4Z/XsobsiPsuS9NF2DGrekCCiPsXLBZBu?=
 =?iso-8859-1?Q?spNi/1+bIij6Elec+uGKDzPoi7ODzEU2IU8G7pweh3AlJYEllIc50/AcJ1?=
 =?iso-8859-1?Q?yQu/wLKKZ/MiswtiAdy+J0RdD7uHcyo4rOemCwlEX16abz+M4rFDjBsd38?=
 =?iso-8859-1?Q?+9LOqO1oseU02jXgZTSLPeIsbe/ZdZyMU/E2JHcJPztVKJO3p5N2eh2VjI?=
 =?iso-8859-1?Q?iwMdROfPbCOR4CJdPFl5MYu6iGfoHvtl3tzylSOtVCvefk65gEUlsvefKT?=
 =?iso-8859-1?Q?r6ugDNcjFtyT3/CUttwG3HJgLBiNC13yo3PcKYGAhll1sOTxX2PadPojrb?=
 =?iso-8859-1?Q?2otTDNZZLc4I7IZAPHz/4KvWhquw1ZFgZ3IJNfTHliLvyD9tA3P0973AXZ?=
 =?iso-8859-1?Q?K3TabKIUQRfuUrFtypKuS2Y8t2ZtKfsTxg0+hgNrh/Lmbb8ELaLXQVJl0x?=
 =?iso-8859-1?Q?Q/sGS4Yg/HhbzdWZ3Ox2/XWI/mIA8mGz7oGb9ChphLQcS5/Y9Gon0rZ+As?=
 =?iso-8859-1?Q?NRC3K1515DsNv4GbtDDMFveZbWM6ROwIvajnmyyX37t5sUoE8w/Ee6tu9R?=
 =?iso-8859-1?Q?+6jdnwa7BkTWFUvYqoStLEHm5ZnQI+qh63Q/Zk3stl7m8qArUOhOxnSrrc?=
 =?iso-8859-1?Q?xDTn1vN853c8K5rDJU5OHOB+dtVXVdQriWB3O0lfzorB8NP1pIlzAmsIUr?=
 =?iso-8859-1?Q?/Of4ormAVUGer4bXeYAE6rTacPDZYfXQmCTTMw3hGFfOvEd2HZHCCwEkzj?=
 =?iso-8859-1?Q?a/WBYZkERWHM23WaNy4UR1MqbB9EaOvzLrFTKaizNO6hJ7rE7tz2Els4mG?=
 =?iso-8859-1?Q?X1dqXn//RWQUh2TfdIiszgzQBjdX0E85LWR55/oXpGVN13Y1OZ0wl68IXV?=
 =?iso-8859-1?Q?XlJ0+X+dBmIeGnLl7+AenFRLL8ZkSU+XIjtiyfHNFEo6l2KpdqXYr24f5j?=
 =?iso-8859-1?Q?SLFln9fqwdtG8M6WlrsgtIZKkP/rLh03DZJus4zqkVgjDYtH7cISZ/BTil?=
 =?iso-8859-1?Q?4MvljnZQYSm0t/LGoUz08Q/YdeHo6NyRrBDdb74ph5iqtp6MIGO1sSbN/v?=
 =?iso-8859-1?Q?YyD++52hMO9f4eU4eXo6tPeEHT73RQABTK2pL6UUVJnlyff+j7JAB1BfMR?=
 =?iso-8859-1?Q?jIfNSxhD1HUUxCmFhxOB+cxxgcJB31ICwolQUoPAc3HM0khGwiuIqM8ynC?=
 =?iso-8859-1?Q?qdcaEdYi7B+r3NZYpcEGB4S2UE8wODb90kWArcCSmPRz1z5GGFtaV5B4Ix?=
 =?iso-8859-1?Q?upW0eCRRYiN5YuiLhhF8gmgqG53uOeHb8Fiun+uiwAc4n3?=
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8863.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e28626a-d282-46d8-8d38-08d9baf57a57
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2021 09:22:53.1031
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vlVCsvpCUcef2es5JCJsH2ssDIiCnzT+GXvxmIeTLj+0LIMCHWwkM4INCPjHgpOqlucGU1g3y/NhkiDjFH5wC/WOjoR/kg+6eNI6LoIVPBKdy6t2P6M9+Tf671i07BnF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8781
X-Original-Sender: stephane.viau@oss.nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@NXP1.onmicrosoft.com header.s=selector2-NXP1-onmicrosoft-com
 header.b=iJq9GBzC;       arc=pass (i=1 spf=pass spfdomain=oss.nxp.com
 dkim=pass dkdomain=oss.nxp.com dmarc=pass fromdomain=oss.nxp.com);
       spf=pass (google.com: domain of stephane.viau@oss.nxp.com designates
 40.107.6.44 as permitted sender) smtp.mailfrom=stephane.viau@oss.nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
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

Hi Ralf, 

>
>
>
>On 02/12/2021 16:48, Stephane Viau wrote:
>> Pick a cell and convert it to show the influence of these helper files.
>>
>> Signed-off-by: Stephane Viau <stephane.viau@oss.nxp.com>
>>
>> ---
>>
>> v2 -> v3:
>> - Get rid of the *_NUM macros in config files and have them computed
>>    instead (suggested by Ralf)
>>
>> v2:
>> - Convert an existing cell to see the impact of the helper files
>>    (suggested by Jan)
>>
>> Signed-off-by: Stephane Viau <stephane.viau@oss.nxp.com>
>> ---
>>   configs/arm64/imx8mp-inmate-demo.c | 161 ++++++++---------------------
>>   1 file changed, 45 insertions(+), 116 deletions(-)
>
>nice diffstats.

I thought so too :-)... especially when we multiply the number of cells (per use-case, per device ...)

>
>>
>> diff --git a/configs/arm64/imx8mp-inmate-demo.c b/configs/arm64/imx8mp-inmate-demo.c
>> index 127392df..169177ad 100644
>> --- a/configs/arm64/imx8mp-inmate-demo.c
>> +++ b/configs/arm64/imx8mp-inmate-demo.c
>> @@ -1,126 +1,55 @@
>>   /*
>> - * iMX8MM target - inmate-demo
>> + * iMX8MP target - inmate-demo
>>    *
>> - * Copyright 2020 NXP
>> + * Copyright 2020-2021 NXP
>>    *
>>    * Authors:
>>    *  Peng Fan <peng.fan@nxp.com>
>> + *  Stephane Viau <stephane.viau@oss.nxp.com>
>>    *
>>    * This work is licensed under the terms of the GNU GPL, version 2.  See
>>    * the COPYING file in the top-level directory.
>>    */
>>
>> -#include <jailhouse/types.h>
>> -#include <jailhouse/cell-config.h>
>> -
>> -struct {
>> -     struct jailhouse_cell_desc cell;
>> -     __u64 cpus[1];
>> -     struct jailhouse_memory mem_regions[8];
>> -     struct jailhouse_irqchip irqchips[1];
>> -     struct jailhouse_pci_device pci_devices[1];
>> -} __attribute__((packed)) config = {
>> -     .cell = {
>> -             .signature = JAILHOUSE_CELL_DESC_SIGNATURE,
>> -             .revision = JAILHOUSE_CONFIG_REVISION,
>> -             .name = "inmate-demo",
>> -             .flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
>> -
>> -             .cpu_set_size = sizeof(config.cpus),
>> -             .num_memory_regions = ARRAY_SIZE(config.mem_regions),
>> -             .num_irqchips = ARRAY_SIZE(config.irqchips),
>> -             .num_pci_devices = ARRAY_SIZE(config.pci_devices),
>> -             /* IVSHMEM_IRQ - 32 */
>> -             .vpci_irq_base = 76, /* Not include 32 base */
>> -
>> -             .console = {
>> -                     .address = 0x30890000,
>> -                     .type = JAILHOUSE_CON_TYPE_IMX,
>> -                     .flags = JAILHOUSE_CON_ACCESS_MMIO |
>> -                              JAILHOUSE_CON_REGDIST_4,
>> -             },
>> -     },
>> -
>> -     .cpus = {
>> -             0x8,
>> -     },
>> -
>> -     .mem_regions = {
>> -             /* IVSHMEM shared memory regions (demo) */
>> -             {
>> -                     .phys_start = 0xfd900000,
>> -                     .virt_start = 0xfd900000,
>> -                     .size = 0x1000,
>> -                     .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
>> -             },
>> -             {
>> -                     .phys_start = 0xfd901000,
>> -                     .virt_start = 0xfd901000,
>> -                     .size = 0x9000,
>> -                     .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> -                             JAILHOUSE_MEM_ROOTSHARED,
>> -             },
>> -             {
>> -                     .phys_start = 0xfd90a000,
>> -                     .virt_start = 0xfd90a000,
>> -                     .size = 0x2000,
>> -                     .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
>> -             },
>> -             {
>> -                     .phys_start = 0xfd90c000,
>> -                     .virt_start = 0xfd90c000,
>> -                     .size = 0x2000,
>> -                     .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> -                             JAILHOUSE_MEM_ROOTSHARED,
>> -             },
>> -             {
>> -                     .phys_start = 0xfd90e000,
>> -                     .virt_start = 0xfd90e000,
>> -                     .size = 0x2000,
>> -                     .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
>> -             },
>> -             /* UART2 */ {
>> -                     .phys_start = 0x30890000,
>> -                     .virt_start = 0x30890000,
>> -                     .size = 0x1000,
>> -                     .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> -                             JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
>> -             },
>> -             /* RAM: start from the bottom of inmate memory */ {
>> -                     .phys_start = 0xc0000000,
>> -                     .virt_start = 0,
>> -                     .size = 0x00010000,
>> -                     .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> -                             JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
>> -             },
>> -             /* communication region */ {
>> -                     .virt_start = 0x80000000,
>> -                     .size = 0x00001000,
>> -                     .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> -                             JAILHOUSE_MEM_COMM_REGION,
>> -             },
>> -     },
>> -
>> -     .irqchips = {
>> -             /* GIC */ {
>> -                     .address = 0x38800000,
>> -                     .pin_base = 96,
>> -                     .pin_bitmap = {
>> -                             0x1 << (76 + 32 - 96) /* SPI 76 */
>> -                     },
>> -             },
>> -     },
>> -
>> -     .pci_devices = {
>> -             {
>> -                     .type = JAILHOUSE_PCI_TYPE_IVSHMEM,
>> -                     .domain = 2,
>> -                     .bdf = 0 << 3,
>> -                     .bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
>> -                     .shmem_regions_start = 0,
>> -                     .shmem_dev_id = 1,
>> -                     .shmem_peers = 1,
>> -                     .shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
>> -             },
>> -     },
>> -};
>> +#include "cell-helper.h"
>> +
>> +/* Name, cores, entry point */
>> +#define CONFIG_INMATE_NAME           "inmate-demo"
>> +#define CONFIG_INMATE_CORE_BITMAP    (0b1000)
>> +#define CONFIG_INMATE_BASE           (0x00000000)
>> +
>> +/* Memory & peripherals */
>> +#define CONFIG_INMATE_REGIONS                \
>> +     MEM_REGION_RWXL(0xc0000000, CONFIG_INMATE_BASE, MB(16)), /* RAM */ \
>> +     \
>> +     MEM_REGION_ROS( 0xfd900000, 0xfd900000, KB(4)),    /* IVSHMEM */ \
>> +     MEM_REGION_RWS( 0xfd901000, 0xfd901000, KB(36)),   /* IVSHMEM */ \
>> +     MEM_REGION_ROS( 0xfd90a000, 0xfd90a000, KB(8)),    /* IVSHMEM */ \
>> +     MEM_REGION_RWS( 0xfd90c000, 0xfd90c000, KB(8)),    /* IVSHMEM */ \
>> +     MEM_REGION_ROS( 0xfd90e000, 0xfd90e000, KB(8)),    /* IVSHMEM */ \
>
>superfluous whitespaces.
>
>> +     \
>> +     MMIO_REGION_RW( 0x30890000, 0x30890000, KB(4)),    /* UART2 */   \
>
>No need for the backslash.
>
>> +
>> +/* GIC */
>> +#define CONFIG_INMATE_IRQCHIPS_ADDR  (0x30890000)
>> +#define CONFIG_INMATE_IRQCHIPS_BASE  (32)
>> +#define CONFIG_INMATE_IRQCHIPS_BITMAP        \
>> +     /* interrupts 32..63 */         \
>> +     0,                              \
>> +     /* interrupts 64..95 */         \
>> +     0,                              \
>> +     /* interrupts 96..127 */        \
>> +     1 << (76 + 32 - 96), /* SPI */  \
>> +     /* interrupts 128..159 */       \
>> +     0
>> +
>> +#define CONFIG_INMATE_VPCI_IRQ_BASE  (76) /* IVSHMEM_IRQ */
>> +
>> +#define CONFIG_INMATE_PCI_DEVICES    \
>> +     PCI_DEVICE_IVSHMEM(2, 0, 0, 1, 1)
>> +
>> +#define CONFIG_INMATE_CONSOLE \
>> +     CONSOLE(0x30890000, JAILHOUSE_CON_TYPE_IMX, \
>> +             JAILHOUSE_CON_ACCESS_MMIO | JAILHOUSE_CON_REGDIST_4)
>> +
>> +#include "cell-create.h"
>
>In my opinion, it's good to have your patches and helper macros to
>achieve more condensed configs. And they don't have any impact on
>existing configurations. The open question is, if there are any other
>plans on modifying the configuration format. We had a lots of discussion
>on that topic before.
>
>So before posting a new series, I'd say to just wait for further
>comments; no need to hurry.

Alright, sounds good. Let's see how this goes after more discussions.
Thanks for your feedback!

BR,
Stephane.

>
>Thanks!
>   Ralf
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/PAXPR04MB88630D511CA5956C1BE79DA9A7709%40PAXPR04MB8863.eurprd04.prod.outlook.com.
