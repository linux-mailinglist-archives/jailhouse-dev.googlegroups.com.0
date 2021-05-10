Return-Path: <jailhouse-dev+bncBDGILGE54ELBBCMC4WCAMGQEXAP2BCA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x63f.google.com (mail-ej1-x63f.google.com [IPv6:2a00:1450:4864:20::63f])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F64637907D
	for <lists+jailhouse-dev@lfdr.de>; Mon, 10 May 2021 16:19:54 +0200 (CEST)
Received: by mail-ej1-x63f.google.com with SMTP id j16-20020a1709062a10b02903ba544485d0sf1136995eje.3
        for <lists+jailhouse-dev@lfdr.de>; Mon, 10 May 2021 07:19:54 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1620656393; cv=pass;
        d=google.com; s=arc-20160816;
        b=hPvU0nXVl3f3ObV9boWirUZKff06Wd9TXIfSCpZXYR3RO1qQ3NPsBXaWA9OXb21Vn4
         Zg08bKUQbQOp32bI+kWo6jU49OYUhBUSbqZfkzdMAWo5L3cpkeYBy2V9HgbDVSVhylwU
         tgGhZI7eSDRAXm0JH3/foDintDUPwVoE7xL6WurtcK/d72OxXoawUz75UBTCXfvCp73W
         4GyTmCyFXq9KuGy4LD5BuaCBlDo/Y+Qrfv3cP7WGv6E+TehVLCM8SSR7ahfPz1x42XiE
         r08td43Py/J1WIlrjEMES6rL6QtBi+oVa7B/GJaZrWwCGuWj2vzIIRFOBDWKpYwkM8wy
         yWfg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :to:from:sender:dkim-signature;
        bh=mjUH3IadVXEwPW6B2GOG8Nf5A93qJdGyfqIP2gFq/Bw=;
        b=C9YuXd5l9QAHyJq7NzhfpoD5AfPHQk+yII6gwYhkAURLsIJeOD8ObEn7OT8Jr7nOtO
         y26cgY52jCE7iif0mvYZ5RvD3fBSqQsMHEPsUTkb8U1YnKGCpp5LXYAa4OQq7NOqWqNE
         SKV75Yu7ynCjJzloRViD1VhrgnGyLvcqyEgXkReO68c9HLk1+rj0j7wC2JZ34bOGVCyp
         o7mQvL0KeArSJjkZMPrB5w7ONZXZG5vVHkfbhUGRVZBJna5yvaduOTBVCUOGRlJOknG9
         1Z8HQysyPknizUPtndavlO1O8Y/UHgazSa9/glPVA0Y7wbGDjRBSVinnm5uCq9fHko9H
         sl/Q==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@prodrive-technologies.com header.s=selector1 header.b=lzLy2s0c;
       arc=pass (i=1 spf=pass spfdomain=prodrive-technologies.com dkim=pass dkdomain=prodrive-technologies.com dmarc=pass fromdomain=prodrive-technologies.com);
       spf=pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com designates 40.107.21.125 as permitted sender) smtp.mailfrom=bram.hooimeijer@prodrive-technologies.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=prodrive-technologies.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :accept-language:content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=mjUH3IadVXEwPW6B2GOG8Nf5A93qJdGyfqIP2gFq/Bw=;
        b=G9w+yQ4/L4somtIM1z4UdR2/zOetwr5lXxalcEved9TKPffv3BLwmfG3IeWg+9JTeA
         ihmtKjv0WVV8deS231F6X5zlwp/Glun7e6zaAgPFnKydZS2dgOZzSh54E7iJza4lmgZe
         ZSiizE+2nxXQJfsocvUV8en4q8U/EqqAuZ/rcdGYVqKcf1sDLks8jWt+Bz9hINPfy2SD
         1JNtCnoFiTj+xG7tB7d0Ei3Ar/ux0ceUarRw0QRmaFn+009fOlmWZqsZv4gK0HFnMBZG
         jeZf1knAYcUdlSfpCqUGJriRAo9IMMks3r6Q2hUEReoMapii6LNpkxsTsKGYHAbP1/Ik
         nFqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:accept-language:content-language:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=mjUH3IadVXEwPW6B2GOG8Nf5A93qJdGyfqIP2gFq/Bw=;
        b=kV/W6hSyNLViZ25h4QVX2Rk2t9LTVLzEaWnjJ0semy8nImRRbgDf12wim/AbVFvKc5
         3IOTQSwKeOBS9/FnZPy/RXJrlNo8mER0edy5km5jerlR62f2jpGpdS+ugbVieRGchUQ/
         GRreb7pUsgh/1NB1rCiZ4Nj7IXSgVp8Vo9vZxOxpWBDFonOIjypWdQ5BV7Ph6m2ifflL
         L7LttjCatJvahBnvTPiJpD41A/e895802SnSCUsrGzjV3LJXUvNcHM2Ws54lXe5ZYJh8
         SfFiRo8jsI1YNzMXcs7NMnu8aavZQyaYvhw0Y5qMUBGLyVv65G4cIUyYG8vSY2OWKVnn
         RmZw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533l5621PiM64ydAJmav2icH4ZaK5kthfaunjcf9H9Qi//y9uTmU
	4nHizTLcBlTbCN39GJLyWP0=
X-Google-Smtp-Source: ABdhPJysALdy9DNq3tOu4rUN1zoaCSCC3PW/x4Ta5fa1FN8Hs8RkotRVzPKcBcg9HPqhAmHq8rBW7g==
X-Received: by 2002:a17:906:3e49:: with SMTP id t9mr14776543eji.507.1620656393679;
        Mon, 10 May 2021 07:19:53 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:7c45:: with SMTP id g5ls6576089ejp.5.gmail; Mon, 10
 May 2021 07:19:52 -0700 (PDT)
X-Received: by 2002:a17:906:2482:: with SMTP id e2mr26037265ejb.212.1620656392746;
        Mon, 10 May 2021 07:19:52 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1620656392; cv=pass;
        d=google.com; s=arc-20160816;
        b=tzRT29KqiRFHwhLILfqqbv9dIV9YgjkdHWnOo0rsYm8nl2cfgXByvsuLTYVnewyOMT
         4wE1uJeP/93GTr7mKvvjUXs6NGsV5n+zV4ZX6g3FWydYpuIblTfhqonWItwtJXlh1nhW
         TSrdwioGGk51a32OC8UUeE9XvgpbvxNrT2wVYoKHI8D9+i+jbr0q+y40wSAM6vKSvymG
         3NIreZ3EMzCKkFNgiYAL6x6Gx58cVOMBA9IHRo+AQ5K4zYL7cwmJ1kWtW+nbnkC5eOso
         C4qgbc6vTFgeekYzULSCfQPyzDMt4lKL/bS89NTHGCS9Gi53rXMTPwCQc+ke3f8fjFXj
         Ae7w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :to:from:dkim-signature;
        bh=WVWgN152Py6r1bJ8KQgu0PUDx5xgGGypTXn2hcbXSZg=;
        b=agzmDuzWidCcKPNp3t3kk2qYeRAXJotE0sHfykxYQk3BBjzJ4zmyBlghP5/6LzWsBp
         NWg4NFr0SUdI1yWJ2zuaYgUfsOI/x5QbowpdudWl7Uo2h8kz22ESsP6rTj8C1Y4U364w
         mNEYawDDFNjSrNrmkvyxVkkUaB5xPKFS5yo41l6Stuk5iq9IaQr2qyP815+nQ4Kq8xZI
         xHUYTg+gGM5hBAGj6hHP0gzX4No7lHa87t9mfTr+vLM6vFXMPGZwXaEHpvNUqUKUpiio
         MxeA3HN71awrCYN4gq/Nv9iS8mivPgSPjcNE2KPQzBjAy4JERvPOmdSHxgsv2DRvhIPi
         Rylg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@prodrive-technologies.com header.s=selector1 header.b=lzLy2s0c;
       arc=pass (i=1 spf=pass spfdomain=prodrive-technologies.com dkim=pass dkdomain=prodrive-technologies.com dmarc=pass fromdomain=prodrive-technologies.com);
       spf=pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com designates 40.107.21.125 as permitted sender) smtp.mailfrom=bram.hooimeijer@prodrive-technologies.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=prodrive-technologies.com
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2125.outbound.protection.outlook.com. [40.107.21.125])
        by gmr-mx.google.com with ESMTPS id di23si610627edb.0.2021.05.10.07.19.52
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 May 2021 07:19:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com designates 40.107.21.125 as permitted sender) client-ip=40.107.21.125;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nvxbNKr1TAFk+vj/6Tj3CTU2jjeH9aOOG015FQ1zXk/WJJspEJbHk0lD882g2gH7U8G3+hZkFEykbTnUtLgFNwIEpBYRQjD4LhL5kIL8qFNJimzzYrXZI318n1O+NzaYsf7nFbFGmAkQliL+p+82YGZI1U4PeccjA3E1yEcT/YcIdpWlDPzFwjF8vWVFjIc7rVdGP7SniZYjBHYJcPpveSxcq9Q8cmgCUEcUNq7Zs3SauIQ8F4Irjzgmxy3rfkkYpDGPzTWlORXJHrcW+tDxj5SD4dh3rMhEc2Dbs4B+hlLCqsrCqoPem/xtdQKsGDPx1O3/9OzljlZ5cvm9T3Cx9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WVWgN152Py6r1bJ8KQgu0PUDx5xgGGypTXn2hcbXSZg=;
 b=fD4cDYpYXrjH7p75AEJWmeJOKq2cZguVnbp4HBvr0d0Fc9Uz+ohgXdhfSvfFO356MQPpfB3HI5w2YTRhAli3ltvDlMOxH1Y2qOz5aoFO5XMy9RJccd+bTI4njoXXUDWpEeIAq0DRdnjzR6md+8XM3QWcXu/47QfUmsTo3YSxV3vj5zWV7LSXTN9I+jIMeYvc+LbGBSfi712Q7NzXi+JcefuEyRUXIEAFLUPJJiSVgfr4hU1sej5w+oIXcWH1CDdOsYG5poEUO3fOVYVGalDFvfR46BjWSvlqBNnVMAt0DujWswQRWQnFVWeCEjxpbcGreAVwZoF2KkVBknK6FX/u0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prodrive-technologies.com; dmarc=pass action=none
 header.from=prodrive-technologies.com; dkim=pass
 header.d=prodrive-technologies.com; arc=none
Received: from AS8PR02MB6663.eurprd02.prod.outlook.com (2603:10a6:20b:257::14)
 by AM6PR02MB5654.eurprd02.prod.outlook.com (2603:10a6:20b:d6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25; Mon, 10 May
 2021 14:19:51 +0000
Received: from AS8PR02MB6663.eurprd02.prod.outlook.com
 ([fe80::69b5:15e2:476c:e151]) by AS8PR02MB6663.eurprd02.prod.outlook.com
 ([fe80::69b5:15e2:476c:e151%3]) with mapi id 15.20.4108.031; Mon, 10 May 2021
 14:19:51 +0000
From: Bram Hooimeijer <bram.hooimeijer@prodrive-technologies.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Subject: Windows on Jailhouse
Thread-Topic: Windows on Jailhouse
Thread-Index: AddFoqOnVrUoL2CBQu+zdXE40qULPg==
Date: Mon, 10 May 2021 14:19:51 +0000
Message-ID: <AS8PR02MB666306E1B7F04C85B36BFC40B6549@AS8PR02MB6663.eurprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [213.127.65.146]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 78afd558-6052-48ee-2595-08d913beacc1
x-ms-traffictypediagnostic: AM6PR02MB5654:
x-microsoft-antispam-prvs: <AM6PR02MB565413853FAE267E55A6054EB6549@AM6PR02MB5654.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Dw7IbchMGand//2vfkL/u0r45cgt3ziFSFpjL+B3rcHmDNI9au+WZl4YWtfHlcW7S1x9WuBP8sSTd3mxzST5ef+pfhEuSgmWaDNKqMMflPCiWQX15LaJeQBJKYZaRzAt7ld/XKIHDFTuw4f5nPzJ2Rhk+7EIcUZ4WKlty87DOsarZ/+mFIOo7s8L/ZjoDpXgiXi7sEWYsLDhNde8i2UYuPNdhV+/F+7wTShQVlWhsAkK5W9zqIOKx7tLefaufz/42CHbbtApes1TzYQhGkWqhgwA0e8Wb6/4fr+Fgoy0e8LYAP2mnphmg9KNnvRRb/mnYlgPC2UyFNq3GZeRM0GGIX3Tlr8LFZ9Swhle4r73HWBWcJZ5YRWqhVC+kD864lQlJaFEofLU+Ux3ZO2XAXWY7smvPBhJ6ioqc5L+gpIeg+Dth99SFkfvpWj1s8nX/NbQ8dv4LHi7dsP+xEW4qgoWJNHbT/lO9hgfrUJVXtCNcRsyWxlOsCsEtNvqPzl2LGOn8+GgG2yqhhgA2hvdANUvi8mSliS6TBzjh+AwYmrqIaLe8SpI30ETFoQYqGcHMTg9Me/XikHaNnsqOZntBEBdmZMwmwFP9nhLGTHHsEhcGd8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR02MB6663.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(396003)(39830400003)(366004)(376002)(66946007)(4744005)(9686003)(76116006)(26005)(55016002)(316002)(7116003)(8676002)(64756008)(478600001)(33656002)(52536014)(2906002)(66556008)(66446008)(83380400001)(8936002)(6916009)(6506007)(66476007)(71200400001)(122000001)(3480700007)(86362001)(5660300002)(38100700002)(7696005)(186003)(44832011);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?rm8SrP134ayeBAJlg610v02VFk9a6tLOdfSVIvcdA8ShL8tW/imcWTk/8Zdx?=
 =?us-ascii?Q?a+kUtIX3T5MZOhNaug7fHbJIWgHU3uLADTVfe14ojaOgB7rF3q2mKUu2dDd7?=
 =?us-ascii?Q?a/btFSWYErqW1EPmHUxs2uTEysNvrvn42C+VhtPs8U+lh1H3kJ+4IYljR/N/?=
 =?us-ascii?Q?ThJmEt3Dl17+wKbvX+I9ff/3Tww9SbtjH42v7ZeEhLZdxxQGPW3gHKWQJFQL?=
 =?us-ascii?Q?2pnVuYCBbBzZr/42upAP8YG9fi0BNf4q6jUTMCMEsbfJvyZHD4f3vflu4Uyk?=
 =?us-ascii?Q?OuN0HJ/IqenT0axlDOhioRzrZF4FD9snCc8SHlIOeMxDRT8VkwQQ4qtUktjE?=
 =?us-ascii?Q?Rzje3HVhrain7YJZndw5ntpgspjx0WftNrKzJh1Gz+UE5YQEixvg91po56qD?=
 =?us-ascii?Q?IwL2GuS3a8HfaRf2lmn0wg36BivXlC1Wss9hEc621nZTDjbcqMV5sweR1pCW?=
 =?us-ascii?Q?rPzabA7n8CNpz63mV5BYHDYimGrgH5yjgmgHEDmR4riuX5enhhT3rcu7/TZN?=
 =?us-ascii?Q?UrE482FzWKPfTDbV1PAJKBnV3eQZ4gZH8CIAkecPYIZUuZE7rervV7a3ZXWx?=
 =?us-ascii?Q?NOYl9P5hiagj9RkdcEsbDAHFWLNkh8wKbhdbcBuUEtxhaCKnim5hwOx0uUlc?=
 =?us-ascii?Q?c1YYH+fKabzOxKBZs0LkQ1jtFPQtYGuAJNCoDr6U4k/iVvYkuqp+MwKHplg7?=
 =?us-ascii?Q?Pp/SFDSMN3iIB7U5TMNh5ioJBlhT9fzZ15CSWDej+HpGKvbZdrAwyMPndK22?=
 =?us-ascii?Q?ab2Danrb4MzLQDb0Vd0SKFQOKu2y3w4R35D3Fi+uNhCXKpiw75r6T6Lb5aMz?=
 =?us-ascii?Q?Y5daGdSTmGKFJmMnpf2dz9vfyXIcTqeG/oU8Y5W5Hpf3RL3XYerCC1S9sHEB?=
 =?us-ascii?Q?BwnJd6rFgOp4V9azFgmZcIivixPh/ErZc3YiU/hOwf+hFoNtIKtDqFHIZYAD?=
 =?us-ascii?Q?Yq3ARpFl1lnHgj5ysH0+5vIws+zG/r60FxQ6igBxH3yocHDI04dpTMVPRsbO?=
 =?us-ascii?Q?NwGd1AkVvZ1jj3vuEBHNdu7kSgIkDZPxfRFxmDGLrQEdwehHyd/v7J11YmYp?=
 =?us-ascii?Q?DKoJdyI6SwyhfJ0wlemwlliHE9KGoX2TGpYz0mugHQ96Qxtnw0mKpwOLSkcM?=
 =?us-ascii?Q?fgo5JzuS71T4EFg+bFY8MtfPTth/R+BfmkE74D9YfFpVgU6r3iDWtPcXtSYB?=
 =?us-ascii?Q?GCLnxLMnGQVmoxe/U5mieVFwJ1Tpskmie22tV+acKc+ubMfdPnRl2/ikwhlZ?=
 =?us-ascii?Q?E+IwZOzpIm7qgMjqPDTOx+Hbiw9JXbK21kCKapPt3z/nGkcha6PPhmDm9MMJ?=
 =?us-ascii?Q?YZg0JHRxAMlWlP0DbHH1f4Ci?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: prodrive-technologies.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR02MB6663.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78afd558-6052-48ee-2595-08d913beacc1
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 May 2021 14:19:51.1046
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 612607c9-5af7-4e7f-8976-faf1ae77be60
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qGWR7hud1zd28CHOaKB3SU7lfkMdZh/BXZdEtWs2j7u6WbknHAbXvy8ycx1Tzf2LCnBhMqJ3NgK7YKJzlLR1A2sNPKEG6zgmHMaoUvGKK30RskTC5zhijyXwobZ7uxp5iMTcm4yvI18LNIdgHjUfdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR02MB5654
X-Original-Sender: bram.hooimeijer@prodrive-technologies.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@prodrive-technologies.com header.s=selector1 header.b=lzLy2s0c;
       arc=pass (i=1 spf=pass spfdomain=prodrive-technologies.com dkim=pass
 dkdomain=prodrive-technologies.com dmarc=pass fromdomain=prodrive-technologies.com);
       spf=pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com
 designates 40.107.21.125 as permitted sender) smtp.mailfrom=bram.hooimeijer@prodrive-technologies.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=prodrive-technologies.com
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

Dear Jailhouse community, 

Is there anyone who has tried to get Windows running in a Jailhouse cell?

Given that Windows is often used as HMI, it would be interesting to see whether it would be possible to use it alongside Jailhouse.

What are the fundamental limitations one would run into?

Thanks, 

Best regards, Bram Hooimeijer

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/AS8PR02MB666306E1B7F04C85B36BFC40B6549%40AS8PR02MB6663.eurprd02.prod.outlook.com.
