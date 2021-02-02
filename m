Return-Path: <jailhouse-dev+bncBDGILGE54ELBB6MC42AAMGQE3CUPZEI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43c.google.com (mail-wr1-x43c.google.com [IPv6:2a00:1450:4864:20::43c])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1EC30C647
	for <lists+jailhouse-dev@lfdr.de>; Tue,  2 Feb 2021 17:44:42 +0100 (CET)
Received: by mail-wr1-x43c.google.com with SMTP id h18sf12890823wrr.5
        for <lists+jailhouse-dev@lfdr.de>; Tue, 02 Feb 2021 08:44:42 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1612284282; cv=pass;
        d=google.com; s=arc-20160816;
        b=obkLruOEADwuNCicHb+tQf6JU5tPQGycjsMxWpLpps5pfvC4v0oZn9REXI4DRtVX6d
         A/uX3tD3TewTV8nSo49Hnqz+dgtmnCXWqkFLvMjRpvW77gm04fxgkLrY8VJoGk7SFzNP
         RmWaPoGBcMHR/k2WwWMHK2lbNQJzoxjFt1j4RvoVpX4z1U31Yvb0RCkeaA/tWsl3Ej61
         1XNg4ffc8QRDy+S0EBmkKga3aNAZhv0mEvz4jMiAlW3UG7PpAzkkU/Z31uycMD0W+5sj
         Aa7xSDloHqYR6x0ZHP3wMaUNasDwcw3tvwebRYk/YthzE3Xl9wx6JCY/qmbb1egq6rne
         yOWA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :to:from:sender:dkim-signature;
        bh=MxIXfJmKYZ3+2JIOhSpQH94wamrJ81P7cQreDo13hYM=;
        b=yqNTFeh+WrCpyvioyr7wy6EEFcBC6vtoWFkrhj/IJCxTEHcLS8HmzRH3favf3CN1i1
         PKnz+FMHvJn/xoOYYt2HUDN83vyMcHglg+rx5FjrQ9gt3oPc+lrThZtEe0vTUz9MEMi+
         NJK1ZO2sQivsVUzy3ePZEr2phU6nZNumlYMD4hRT2NUt1R6TsllixR6vj/DwlIWTO422
         Dl8IYRTeMXXDjijGz/IaZSVnSl4VG/5LXrzT2CFJXL7tQjiEy7RDeSi/t8hAMrNaiYGB
         AQg3Tasn29zDUKCVAPg2KFjzPCSPZQv5fTRqBZKbiJFeVkYHHkHYLKoXc8C7XIKONwb/
         UkoA==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@prodrive-technologies.com header.s=selector1 header.b=U3SWtaU6;
       arc=pass (i=1 spf=pass spfdomain=prodrive-technologies.com dkim=pass dkdomain=prodrive-technologies.com dmarc=pass fromdomain=prodrive-technologies.com);
       spf=pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com designates 40.107.6.117 as permitted sender) smtp.mailfrom=bram.hooimeijer@prodrive-technologies.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=prodrive-technologies.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :accept-language:content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=MxIXfJmKYZ3+2JIOhSpQH94wamrJ81P7cQreDo13hYM=;
        b=VzRxhm4X2c+glgR7lciDvTdnk846mapcvRROve2He5qk5oR7Kz4VDjOhyUHwNTUvtW
         vNSbZYXQORwt8dxjY0UW6u8X3uUkRxYM39p+YeUFjldt1OmIANMuvAMSDiPqA9gqqGUH
         NxQNJxlvKO7SCSpzOg7b3ee0br6lI7ubFYmwybam4F+Ts8NjmuPiGOqXQRgkDKspXZN/
         VQV9SZk9XYx6J5PGGN8rJZaDZVoaH1WjhmyOv4QqOIAxGOBeL1ailPtJQUi5+foD0o8z
         sOvT9OBMEwUK8GddDvwd919iwS5p9T4coURyQrY/OiWdndLffVjiqrCMO/rkwdGfO94F
         /kQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:accept-language:content-language:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=MxIXfJmKYZ3+2JIOhSpQH94wamrJ81P7cQreDo13hYM=;
        b=qt8dNsMxhLi168mgVqth3r8O0/MtTBvBu16yady+r2VzhZe0XkXKhpd1ytOGNQztg5
         D0jghGxrK8+W18SzA5YxyCWu8knzANQLdV5EahqlIqBiOvt8W0sv4t2qLD65MiKurTjA
         C2M0Cq9NYBMMDY2ddd523JAOgpajwvShg2ZTONCN08ViqlI7CS2Ozxx3QYYqgypvXQhB
         hV+O8sMyBZNKFs1Y4U1aIClCUR8XRNgGlt/BqNUQFKSQF+dd8MbsCTpEYE9qZj6WfvAz
         X/HsjOG1BN7lTNQSB8k22huQDyYOWBcZb25WHDLNywdMubL4nQmWBO2BTBM7NMnP4yP/
         WuoA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530AGbXd+IUZ1XrqM14X33PQZ3F7pQmwuSNCSTB7pL40jejdyQVo
	ezBDI+uj4ZR2bO6aPo1P3WY=
X-Google-Smtp-Source: ABdhPJzaJzLrTNsMpPUAX5JM2N/8CHRlQbVsgi50cMlpJMh5Bvpoc271oCYlFF+aHmkY5Rrk3Ybruw==
X-Received: by 2002:adf:f4c1:: with SMTP id h1mr24754199wrp.102.1612284281687;
        Tue, 02 Feb 2021 08:44:41 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:4485:: with SMTP id j5ls1572902wrq.1.gmail; Tue, 02 Feb
 2021 08:44:40 -0800 (PST)
X-Received: by 2002:a5d:6c66:: with SMTP id r6mr24171079wrz.86.1612284280912;
        Tue, 02 Feb 2021 08:44:40 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1612284280; cv=pass;
        d=google.com; s=arc-20160816;
        b=AQO58Shyb5X7NeCBUBA/3S9fuw5OVKnqKZpYGGcjH9HPIp2k62vuhp6v/jAbDwbRTR
         pt2yk5mYwo7a1xHdc87c2QDvnezfPQJixJuqw54lRA5Dd3TkhZ/gB9uDm8LmUBOIBq63
         WAU92IuiWQZchJTZy7t5Cx6ZHr0GRpiqMBPnVxdgGy2ucFov9/UDoKRO9jHWSWr5+LTe
         p7m0HPXAhq9f6APtTZeP7aUVSIbM7YlQyQidOIpqWNlWrc/pIs3OviPmRuxspXbeNDek
         y1LZnoz8j45v5P+WpO5iace0lDl4MfGFPsxKQWxWJYJSdhK8mQZdgYTCTZnrosK7D63v
         Shyg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :to:from:dkim-signature;
        bh=7ehVLi9VkRdAeKuVKnoF/2bOvOXKKw1Ju8VLqThhlNA=;
        b=omYM6agEb9W9pMiu3UoYEvnT7+OiHpgTPVIp7alspYMmzhi9T2TPtFFVpQUNZ63Ppa
         8DQurjZEbfgv8BzFX4duR1v8OYIkF4KVLQN0c4uQYXIiRbENeMztupqLU4D7oc52sQA/
         gFEPc39Teq/gNj0q7b42BUkQV/bQVSbKs/wInWn0LjhyOGePCe4rXVKkw3S/cqj7oeCj
         R8Dmi9za43UKHBsD1LU60nUaaMqJMZub4/cRMEQ56E3aw6GZg2hMi61YgpC8xtfmxc6r
         6G7wLlBTi6suNFk6f6spGll+2L5wjSa9NP03ygAZN27t/VWh37dqCDc9JOd1uV0IQ6NK
         QYSA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@prodrive-technologies.com header.s=selector1 header.b=U3SWtaU6;
       arc=pass (i=1 spf=pass spfdomain=prodrive-technologies.com dkim=pass dkdomain=prodrive-technologies.com dmarc=pass fromdomain=prodrive-technologies.com);
       spf=pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com designates 40.107.6.117 as permitted sender) smtp.mailfrom=bram.hooimeijer@prodrive-technologies.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=prodrive-technologies.com
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60117.outbound.protection.outlook.com. [40.107.6.117])
        by gmr-mx.google.com with ESMTPS id f196si224270wme.2.2021.02.02.08.44.40
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Feb 2021 08:44:40 -0800 (PST)
Received-SPF: pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com designates 40.107.6.117 as permitted sender) client-ip=40.107.6.117;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GuMEZUKYhg6VgQn22XYebpXorYaDZuraRC+cVH0pQE19OAwVJ8zFyAadWFWT8fBGgYHGNI1vAP2+Rjq5ahW53mO6wfeCKaA84oQJtzqEKIor15JZfpBvOQiVkZNZkOD2+ukHYc7Ngj6lkk6CTo1gQ5Dhm4ZWmyUQt23GJL8Qbcpzent/BPbyQvkxalKKq+ROfrPQRe4dMqh46a7dvAWIXuQ1OzPpM/ZbAs/zvkfbUlDTTmX4DfLkG9xSaeLYUFGr313ABSDC+yO9DXOG3i7yJuyvm6zQXA0lBzyTjQhGVzSAOn6L8qai3SLBUHpwq/U5HWlXlGOJKsNQpaLDy+w37g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ehVLi9VkRdAeKuVKnoF/2bOvOXKKw1Ju8VLqThhlNA=;
 b=EZcauzCVlXYXhvOJvvrzy16Zp1F0H8F+DRzp08Qhc46Ve/cLM+l4Ss4uDmgpfiyvqB0zk0yVJgP0sDaJ7WZJr6boAWCieOuNRx4tk32Egk9p3dcvmCioM4syDvX0TN3z65B39seEZRZL8hKHKy4naGDFtv6iUdrdqzQL7vlOVCfeoh5bGHRLqD1OcGvpW0s6ySwYGM/n4nmJLBbE5ctSGXBORF2JOF/aCLNvx7EyEn4ayQxG/UrbtZIH4fbrNNR2P1/V98pKT3zRCIGvYcfy4QXk8fBD3V31zxgzCkbYFwuDDIZC3T5GX5H/gt0oXcw1QMm/sPD6t9xt3tvfM5yziA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prodrive-technologies.com; dmarc=pass action=none
 header.from=prodrive-technologies.com; dkim=pass
 header.d=prodrive-technologies.com; arc=none
Received: from PA4PR02MB6670.eurprd02.prod.outlook.com (2603:10a6:102:fe::22)
 by PA4PR02MB6910.eurprd02.prod.outlook.com (2603:10a6:102:10f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17; Tue, 2 Feb
 2021 16:44:40 +0000
Received: from PA4PR02MB6670.eurprd02.prod.outlook.com
 ([fe80::91a7:f5cd:50df:e378]) by PA4PR02MB6670.eurprd02.prod.outlook.com
 ([fe80::91a7:f5cd:50df:e378%7]) with mapi id 15.20.3805.019; Tue, 2 Feb 2021
 16:44:40 +0000
From: Bram Hooimeijer <bram.hooimeijer@prodrive-technologies.com>
To: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
Subject: [PATCH 4/6] x86/cat.c: Fix off-by-one error
Thread-Topic: [PATCH 4/6] x86/cat.c: Fix off-by-one error
Thread-Index: Adb5f6wLXMG23UnPSiizc+S29G0yGg==
Date: Tue, 2 Feb 2021 16:44:40 +0000
Message-ID: <PA4PR02MB66700E196A29A23FD2152CA7B6B59@PA4PR02MB6670.eurprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [212.61.153.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c58372dd-1305-4e07-ca7a-08d8c799d5c3
x-ms-traffictypediagnostic: PA4PR02MB6910:
x-microsoft-antispam-prvs: <PA4PR02MB6910E2FC73B60E13A2BE8CE7B6B59@PA4PR02MB6910.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 77mJzCjAmoHd+19pdh18+XQmPE8VBP9+PPgvLuoGHHV3ezWnZajkNYohsliOGgXySYj3/2eZiTyLMI28grTfGTFxYPH/FZZMmqkHkZ0T31xOzxHIvroodigQqykiQgZ3PWx1A1gsDiBu+sBeNhSiWhcxLh8ZeZoQ8EixjvYoWcnjDQ+c6itRK0JIp10+ECGhWnSvUDpkMZI+zuQxvvg7VNmcrP/BBoOlVPp9NGtx9Z2unSC1qNr/GxraJb+McB9675Vlo6ZRlD0YOaAt5DBw+DXlw11QJXKoptSUYvHJ9ITCufMzP/9eHZkfIKYSVfUf/xzESxU/bKiLFY3YjMB0sb+K/E6nwBUCLH1YdzjG2gk0A68+oCWzag6IGE6av9IK1PDFVwP6iVqllFiQ3jG02cduDt7g2cMK5nBNLAVxonhKHhjKIKgbepkyXKrmzQBLWR2pyEIdenYvABuBn+NoNyFlTh2vw0TO6YFAQeotjGCOWWjOmj4g1L97t8PNxqVx4WsPS6I1Kt0RuekfT4XENg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR02MB6670.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(366004)(396003)(136003)(39850400004)(33656002)(83380400001)(66946007)(6916009)(8676002)(52536014)(9686003)(2906002)(478600001)(26005)(6506007)(8936002)(76116006)(66556008)(7696005)(186003)(44832011)(86362001)(66476007)(5660300002)(71200400001)(316002)(55016002)(64756008)(66446008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?3Wt0Hhs4PWFb4mQUGyZ0VpjLTwHqp/Q3dcYqSYgcQPHapeXg8Ffn/f+CAHd2?=
 =?us-ascii?Q?3ajLIiPvCsd+jbVXydf4RajXZ4VlCDYbfze/0taoKXKtN+CckVpMDXD5WVO0?=
 =?us-ascii?Q?OJjWa9Qh7n26U2/SMbmIsHBJBR6FN1hQ+Q9E3368uqDTyFBGR6kLrVO56aLE?=
 =?us-ascii?Q?4+61hjJ2sqQS7Ppx3qYUm7OuCQnOI/DfRnJY9Grwtpuh1o2im/vrD3aP3BjC?=
 =?us-ascii?Q?wH7TzJmgyV+O+H8y+1zlqmCItrrt4V9mxXMvawQwPm725319NFF3wpq9e0Ep?=
 =?us-ascii?Q?Si+xecF1iR7DurPa60SLWwawKfK5wKf3jn7qAPjDmwGn7Djk5iMKNYOn5TYr?=
 =?us-ascii?Q?Q7jHPOEpJc09Dw1iVh6BbkNuy+qiMH0MYqVJsxhYd4W3Xxd5G3JS1LxEMJNd?=
 =?us-ascii?Q?1QZwqT4bLEdhhabLkzickPMIT360wEmgjvcnxAMzKNDLk7DzlwS7Rkz6hDpl?=
 =?us-ascii?Q?5bAzirEEXHcSTsHd6IaaP2/Ai4UV3OJRS/5y5RvXe36Ue4m5xmNwizSdLHKo?=
 =?us-ascii?Q?zreiDXTNbGr+929eHHatimVwRZf3OMGXVNPQMuZV8y/Mv/C4ovCCqQ2JuWck?=
 =?us-ascii?Q?9Vz+dVsMUCSEbmZc3YpcUd/VNrWT1/u5CiSM0I1SCp2dNveI8ddFT9/VgKdL?=
 =?us-ascii?Q?RC/O+KKVarIEq5c/SdRf42MY5c7bbi81yluqk6Xj0f4iYyrd9q5JnlsKqk8u?=
 =?us-ascii?Q?d8t2gd2aDUrlY88+t80heSHQhPBLjUqv84AvJZwaYBiJEP5ypFOGjn0iLRC+?=
 =?us-ascii?Q?y572jVlB4GSbc5qNTww4x2BKkqPVao31DPGdFz7q2hIlX8PaDYLSaYEEubNj?=
 =?us-ascii?Q?Hwxg+8ykewlSEWjGOIhSHXnPHdOTYrvUGKWKKtCb9fhdI1rIxMYTw9thKUJS?=
 =?us-ascii?Q?1QES1pKuv2/AqUL5J6pYgNipSxD3AnlTFuh7gVCZQ5K7peQz/lgATlXfZTHI?=
 =?us-ascii?Q?jwIXtInbHyoMLA8zX2NWatyNEFLCm5ALeSkBkitCZ3lk7lgsXqMTUuTnArnV?=
 =?us-ascii?Q?/4rgEPhpz3FI4z68Eq4zd5LfA1nzAKaAHUKmeZR5xz3oJ1tQ8NWsMHxMmV/m?=
 =?us-ascii?Q?AgWC8171?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: prodrive-technologies.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR02MB6670.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c58372dd-1305-4e07-ca7a-08d8c799d5c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2021 16:44:40.2221
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 612607c9-5af7-4e7f-8976-faf1ae77be60
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DHVFh/jfOn2CEObx4PGCEjIJO8dbQfvMJIa1z4CoouA3/IImFCiazo6CiQlW6fMHOBLUXMOzH/7LrdOnrIOS8vloKZYu3NmeYnmBe8JVOHwz1rWabWiYC3UvvTYsqg9U+AGOJF/5hHm9BOUFDsIxLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR02MB6910
X-Original-Sender: bram.hooimeijer@prodrive-technologies.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@prodrive-technologies.com header.s=selector1 header.b=U3SWtaU6;
       arc=pass (i=1 spf=pass spfdomain=prodrive-technologies.com dkim=pass
 dkdomain=prodrive-technologies.com dmarc=pass fromdomain=prodrive-technologies.com);
       spf=pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com
 designates 40.107.6.117 as permitted sender) smtp.mailfrom=bram.hooimeijer@prodrive-technologies.com;
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

The variable cbm_max captures the position of the most significant bit
of the CBM, rather than the number of bits in the CBM. This should be
considered when checking non-root cell configurations to be valid,
otherwise the non-root cells can never access the top-most bit in the
CBM.

This off-by-one error ensured that the ROOT_COS CBM always had at least
one private bit in the CBM, preventing it from becoming empty. However,
empty ROOT_COS CBMs are well accounted for in the code.

Fixes: 3f04eb1753bb ("x86: Introduce Cache Allocation Technology support
for Intel CPUs")

Signed-off-by: Bram Hooimeijer <bram.hooimeijer@prodrive-technologies.com>
---
 hypervisor/arch/x86/cat.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hypervisor/arch/x86/cat.c b/hypervisor/arch/x86/cat.c
index d3425f7b..f4c6f5d6 100644
--- a/hypervisor/arch/x86/cat.c
+++ b/hypervisor/arch/x86/cat.c
@@ -173,7 +173,8 @@ static int cat_cell_init(struct cell *cell)
 
 		if (cell->config->num_cache_regions != 1 ||
 		    cache->type != JAILHOUSE_CACHE_L3 ||
-		    cache->size == 0 || (cache->start + cache->size) > cbm_max)
+		    cache->size == 0 ||
+		    (cache->start + cache->size - 1) > cbm_max)
 			return trace_error(-EINVAL);
 
 		cell->arch.cat_mask =
-- 
2.28.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/PA4PR02MB66700E196A29A23FD2152CA7B6B59%40PA4PR02MB6670.eurprd02.prod.outlook.com.
