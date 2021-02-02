Return-Path: <jailhouse-dev+bncBDGILGE54ELBB6EC42AAMGQER32CBQI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x637.google.com (mail-ej1-x637.google.com [IPv6:2a00:1450:4864:20::637])
	by mail.lfdr.de (Postfix) with ESMTPS id 5225230C646
	for <lists+jailhouse-dev@lfdr.de>; Tue,  2 Feb 2021 17:44:41 +0100 (CET)
Received: by mail-ej1-x637.google.com with SMTP id p1sf10243818ejo.4
        for <lists+jailhouse-dev@lfdr.de>; Tue, 02 Feb 2021 08:44:41 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1612284281; cv=pass;
        d=google.com; s=arc-20160816;
        b=vvewYmwIY8Fx1IgdBa93aucNHGqezzvnwvA2CqwSZngZalyVG5R3xEfaCrCsUx2Uvp
         QUoBppLTg75Gg0b4ccLdokiIbsrBiqr+3Td9c6kqtGlMqFmwaBkwYC1qxD5Xzv9I1rr4
         5qKQP3fsZhCbjH1JRpTscJpaQJ2zQTsZhCOXKXESAths0TZ1TeLsIhiLGmiNZwihdc4L
         YOi+QDqZaFswpBk7pHu2W8G2BA7XNQcV6MrJKZQlGzOvy8MGiYK5817d3qb8dhoo7Mzg
         cda01URj7rG6UWW4j9qLBwQugaHb7ixF6A9JS5uiK00OT91D7yrJQqIcPnZKnU6OjjUg
         W4yw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :to:from:sender:dkim-signature;
        bh=+rZqTwFdvmTrPylily8z0ZRkxd/qT8jnHl6fkX5u0Ig=;
        b=oJmYhibfoAl8Y+oUINsdstbua3PCezWN3LND71FzT94V3h6a4Bw13075Bl6oxqhi3F
         ZkUxB4gzjPpFPMxGYeOgrHAfPruqqet+71yVJjeq4zs+YTDiz2/3CzKKFurifSo1JJfw
         gThfiEUemVUgwDma6eejBStW9EiX275Oqmvvfk8YOirIn91VKVNxjDEJUfBcFFzG41pd
         BVqzmgyDSFSjDg5kmO9XD4orYAZ/tCuLopx12b4vJG+W9kBaCGBr5xT3chP+HFIbz6ad
         m9lsOFONCfzIMG5g8PWIhqccRNp8Iq/a+GGESuQdeu8SInyfYc/cOnEXSxALBNwSFqib
         aiqg==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@prodrive-technologies.com header.s=selector1 header.b=IEXrYZCV;
       arc=pass (i=1 spf=pass spfdomain=prodrive-technologies.com dkim=pass dkdomain=prodrive-technologies.com dmarc=pass fromdomain=prodrive-technologies.com);
       spf=pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com designates 40.107.21.98 as permitted sender) smtp.mailfrom=bram.hooimeijer@prodrive-technologies.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=prodrive-technologies.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :accept-language:content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=+rZqTwFdvmTrPylily8z0ZRkxd/qT8jnHl6fkX5u0Ig=;
        b=a6eq4CMwJ7QzRBbZ0J54uopjJsaEZRBWPLszHAhxX9l+Lm9Bx3GFwQNMZakBLVHTia
         jrK+GAogH/w+kEkpvBPtpvNtEpvO2Vz+yuUltXyhviO3z76IeS4Jbf2O6ScrJ3WWxFGV
         Bbu2lnfSjLc75u7x18/6dieniqQsBChv9Gg6L1zqts18UqfLLaYekVlKCtjAfBsXNt/S
         jGoTHA6Zd/a3vqLJUWEKpQ3YVKJpafoNXMGCc8uSc/UMRsB4QuWTsJAqVuOgod0Hiaet
         KWtdOPm42B1x5gxspk604Mojwtr7cnHW8nKHg7jFCFqtMFJ76VpiTvjA+bG4R4OVLEkN
         tWQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:accept-language:content-language:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=+rZqTwFdvmTrPylily8z0ZRkxd/qT8jnHl6fkX5u0Ig=;
        b=Juf3fSP3engc1hdaH9GAW+Y56mrhpoOaXQR4N4lYnChLebn02Cg0nZ+yRUJVoHNN6E
         CGA5qhBayAQacD4zg4p2pLCQX9+20+oNVQISJfAc4BtVAUvSwh1ghyFw3X4KcMsXFVs2
         E19mB3dKWfpInUborKrh1gjueqZEjDbAsrSgtWy4iq6Dc/4Uw1tsplGXGu3HOlCxoQw3
         TR0PutS2gQTaKttbIh9wor0EYsqENd1FH2jz6uNIRcYdYNcYnCos/1BzB+4iQmQ/tysW
         VexEPW5JGjAs/yzKDnDfFRliU7rD87FjaG87TQF2nFP4CdR3/E0MCLA23S9bcz8A/tyd
         AtvA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533UQ/iVD0CFPfMaDPjd7kNqrZfn6vNMQw5EBeHNjeEgDleGJLn6
	XtCOh5UknRmxByhRM0wzsYI=
X-Google-Smtp-Source: ABdhPJwkJEYzWca/kLjkxZTyNX2jG35khsY87QqVIZunX6ospJpOVBOTMk3db83vHF6vD+BHmBzRbw==
X-Received: by 2002:a05:6402:1914:: with SMTP id e20mr24397982edz.89.1612284281011;
        Tue, 02 Feb 2021 08:44:41 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:907:e8e:: with SMTP id ho14ls1349787ejc.3.gmail; Tue, 02
 Feb 2021 08:44:40 -0800 (PST)
X-Received: by 2002:a17:907:2805:: with SMTP id eb5mr6559673ejc.277.1612284280100;
        Tue, 02 Feb 2021 08:44:40 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1612284280; cv=pass;
        d=google.com; s=arc-20160816;
        b=Qia70y8iIwMOeSnvHnPJAr1a9ZvDWqRnH7GgEAYOEq0dGJ6FxsO24U2ny1VPT/Qt5a
         H8+mol0RZbeM5hz4z+7Vxniul9jX5gWEaCh8F7Y4AncycCJyocqFGf9dcLtK//8hZBu0
         Gtb6xbg7fvgccq1sLvcKx294+1Ld8FIC9CT61swQWxcvzYjiZ7Rkr2ZNcn4aqRs7LoSe
         XDeaJjQHe+H80NQpQAAeWIUF0NRbmSyLBF7tUldqOE0hFXBqz/HB/VGfgGFbjhPl+U7t
         SqcRKORs0C95vpomgiPv30qFx0YTV7Ynkbt47aCnaFl0JdD7jKLCxfhhAZ11KDKaArnS
         wzTw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :to:from:dkim-signature;
        bh=24OrhCQgaGHdq4vdhza4q5jH2U3yePUY8c2Eca63cvE=;
        b=yTqa1/c/w1Sc9RcTwWxKR0EfVsRKg8enA10BezfMUzXHy4N0kVGVkoOSjo3YmQJowr
         D58h1JJ3hoWh6n0SN/nuEjkUjJsyi1nJSYbU/uFODEEqaPZjcmXWxT+47BYyWdskHLcU
         aZQ5D+XWcANWos3HMluDnYL8e08DCxi4Q8VtSrirSJYsqnzRFm1X6F3vaGa2SenuEG7b
         K751X1DNjeR9NvgtvW8I98t8ErlEdgAvH42zQOHRgoD6M4kU3dxCR27STAaOW32pKbmV
         Ijj9qn/ECanYCQ1k+t6a0R6VAcTt8Q5fg3SMSQCm92YuN+Q/WVqOlM5/sERgM2TS0fZs
         rA1g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@prodrive-technologies.com header.s=selector1 header.b=IEXrYZCV;
       arc=pass (i=1 spf=pass spfdomain=prodrive-technologies.com dkim=pass dkdomain=prodrive-technologies.com dmarc=pass fromdomain=prodrive-technologies.com);
       spf=pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com designates 40.107.21.98 as permitted sender) smtp.mailfrom=bram.hooimeijer@prodrive-technologies.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=prodrive-technologies.com
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2098.outbound.protection.outlook.com. [40.107.21.98])
        by gmr-mx.google.com with ESMTPS id m5si901997edr.1.2021.02.02.08.44.39
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Feb 2021 08:44:40 -0800 (PST)
Received-SPF: pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com designates 40.107.21.98 as permitted sender) client-ip=40.107.21.98;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S00mJlAAoKmB/Q27tHRUPRtL4qeaGDl1k0O9qs4vTdvmCqsBv0CEV2q6X4mDS2zge/b+QYe4046noOEw19mX0jJsDlxB6YE0eXWeh/qqkKVAjP0FHvWD+G3NpQ/nGpEWdTjM1LJopH1dtwOuAjEWcb1/0y/ry3dyhsnFXcRw1rk/GUED4kE+wlPU3AD4DV/OdwsvEZJJMVVRSyovJJTtzHw7nGa2WsKfTk179Z8JnB02oE4JQ27bBCTxnIDKdk6TPhxY9jUDg8HfWEH79WaBcWyweruOEMq9BgxrYgstWTyvGmnIHAXaGkDcW3GFp2fUIz3M3bfpTrzeYzZFOTomLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=24OrhCQgaGHdq4vdhza4q5jH2U3yePUY8c2Eca63cvE=;
 b=gPol1AvXO5Aw2uknbilndw0Z+C+WwvAghcZJZhzyEnVyBjdqxLEGHox1LwzPklw5JAGTOLRqyPoulzuQfgV8BEcRga4D1y2Hznp3TuaHJf6/YDlQGgV8wGk/rDpVkt6RIWCA6veBVdFlkWpfNzvzJvPA0E5yhkeR7mmCX2VB63yQ+KAaZiZS+F8s8aPw2oOX1eYsy1ND+HdEcH8wosae1rKjJOzHxAJeSaF9L60c5N52FiRBF/MjtU9xPDKUJUb8E3KuZSb2jFN1mv7FbmU5UQAa6mNuTh3zDY+OeIJQAAI/sa8QgFu1NIPB0bfGDws9Zrz+ZZN1M3PDo9H4FT35MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prodrive-technologies.com; dmarc=pass action=none
 header.from=prodrive-technologies.com; dkim=pass
 header.d=prodrive-technologies.com; arc=none
Received: from PA4PR02MB6670.eurprd02.prod.outlook.com (2603:10a6:102:fe::22)
 by PA4PR02MB6910.eurprd02.prod.outlook.com (2603:10a6:102:10f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17; Tue, 2 Feb
 2021 16:44:39 +0000
Received: from PA4PR02MB6670.eurprd02.prod.outlook.com
 ([fe80::91a7:f5cd:50df:e378]) by PA4PR02MB6670.eurprd02.prod.outlook.com
 ([fe80::91a7:f5cd:50df:e378%7]) with mapi id 15.20.3805.019; Tue, 2 Feb 2021
 16:44:39 +0000
From: Bram Hooimeijer <bram.hooimeijer@prodrive-technologies.com>
To: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
Subject: [PATCH 3/6] x86/cat.c: Fix returning bits upon cell exit
Thread-Topic: [PATCH 3/6] x86/cat.c: Fix returning bits upon cell exit
Thread-Index: Adb5f6ET39YxumBRR2GmwAxhRq3xmA==
Date: Tue, 2 Feb 2021 16:44:39 +0000
Message-ID: <PA4PR02MB667022FEAA58A2425E69A019B6B59@PA4PR02MB6670.eurprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [212.61.153.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 20c6d816-a575-4e1d-f881-08d8c799d52f
x-ms-traffictypediagnostic: PA4PR02MB6910:
x-microsoft-antispam-prvs: <PA4PR02MB69104A0707ADCAC00DF7AB44B6B59@PA4PR02MB6910.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WiOzVpQQgFE6f0SgyzvgO5hzKUtsfi8hud1/n/BafESgroJqaIqJZmzZKXEv7k7iYpepHm3ZVeC252Akrdx26yUK1geSHypvohD9E3iiBVcM9ehsHw1GV+IPVVKD5caIkC2s6x8DjWiEieMK9nAJ6ZUnZP5hmZaPhXalpcnEhU7vFm57yDJ0yoQmYGGRagCdVconUMiYgplj8BuCdgJFXGhtyKYrJETjmM47qwEuoAvuwvSApqqd0CC94D0KAVazUNIq7DZ9R2SsCcaX0reHT2n8xw4BxXuxUg6PGHcEiCeMPV+bp69bWX6/NwU0LGbahuDj383YeYjA+1U7Ke9thI/x7cuH4F4m411cKoASmVCu3C6BfipokHDVdk7QeIpwLFoKZBxIy9GfLUMyhlu4NAb/yab5oZIOFtzl5EMHDscT5eFDGdESyR0WdZxw8ReRZhbfirp/u8vJEYg2ILxL18emi5IQQu6RUZI3U32aOcxL0bHBhlGOuGVGsIeBV7Ny6OcQ88ubcUD/saEBEjAYMA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR02MB6670.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(366004)(396003)(136003)(39850400004)(33656002)(83380400001)(66946007)(6916009)(8676002)(52536014)(9686003)(2906002)(478600001)(26005)(6506007)(8936002)(76116006)(66556008)(7696005)(186003)(44832011)(86362001)(66476007)(5660300002)(71200400001)(316002)(55016002)(64756008)(66446008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?dHkFKzTY/hwz2StwOVE3ygy2Ex0UyzFK4syBfbPSThaVQW1YiyTlAYPTq/bD?=
 =?us-ascii?Q?wY74w3410pH9yJjsmg3rWYVUcUKzA8F+SKiznPsgg8UO69GDfuPyTByhl97t?=
 =?us-ascii?Q?V9TnJljT4VcyMMH3+f35gmpQcJFPz4p4TGEm029xCwNdwvbqOBBgJTyH8ruU?=
 =?us-ascii?Q?xy//sbIaQuMPoliHNJMSgfcNJ66irkrr4ecVsqHvopIpNLev14MIyHP+tCGf?=
 =?us-ascii?Q?0JlxhX7JRMKok9Eg9XbklKCumT5N5YHyOvzw57JmXsSwwaP+EeLXacJTrh/O?=
 =?us-ascii?Q?+O3nkdYbpGCihICyGgA7hlmsvTWDirc4QMNxKxHbuJocRgcrwzruLHasVNOc?=
 =?us-ascii?Q?j1ioV8VN5qOwd83Yd1n/AkxL1aiBI2ETCbtRqZ15fm0/PBXA7PixYoCQQ8qt?=
 =?us-ascii?Q?vKxXrYym+QXOE4yEdOFbkx9YfCHSRqCzSqxPPoi7cKcnr4j1F3fvR+cHmafr?=
 =?us-ascii?Q?h1wfE3i9o/XUHOjX1lBP0CYgnt8FJytOYvBDHmeucHmXnoiterfQV7MHbfOQ?=
 =?us-ascii?Q?eYsTp0GK06MvYrZ8x3LwE7ppe6BxgQ8eWNLlv6EeFwuHgD3RvxIzhDYN8wXH?=
 =?us-ascii?Q?l9Uq9BvKTtK15w0DY6cc8fwN+OkB2fac3lz7QG4d5H/1sRtezpmdUPhxvDx9?=
 =?us-ascii?Q?D9k+Cv+Zwd47T9Nss8cXhJN3eL9G5qvdjcUn0AIG8gGWDB7UCxuoc1FSLPtv?=
 =?us-ascii?Q?+plSNXKCgWoNGRjuQQwEZ1mPkebU7TaA9rFDr5X0S5JHrqWapxh3TMuXmHhP?=
 =?us-ascii?Q?ETig46mHEoowxDFe336dUhjPqMmZ9CxcIcJ3lS5qezNdSeu/gJEPqtFWtet4?=
 =?us-ascii?Q?GHy5cbihK3iPyYd9GqKM2KaE1qPICu7eRY18reb1zULl9nv+DzdhrYskTs8N?=
 =?us-ascii?Q?CSOLg0Bt3pHc/B6pXY9jKQ5b4vT7VWJjL6fO2hkkr2/uLc7TSeyEnXfezv6B?=
 =?us-ascii?Q?ByNzJfVoWZhllunNz5ElFHGVkgTWrNFQXRsU9WfZ1jYvaAAwOKLCeSCf2qQv?=
 =?us-ascii?Q?uS1ZdXCjdI7TPUP5GW09pBm+iIwIx8zCMl1RbMVrzZe4Hl9f6aKwwBwIGHGl?=
 =?us-ascii?Q?slPafMQN?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: prodrive-technologies.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR02MB6670.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20c6d816-a575-4e1d-f881-08d8c799d52f
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2021 16:44:39.2504
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 612607c9-5af7-4e7f-8976-faf1ae77be60
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xbRKbCw9KhYXQHtXLjmB2YM/6TJLEijMMQH2b4pik+MNGdL/nO6wjIc1fBkl7lBtR6w5+NqkUmENlihpVgYoPy4XWbEtllLIMWV8hcyNrCf6etwf1njFuGS5g8h57S5Mey6q/TCMEA5I/vnl88+eTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR02MB6910
X-Original-Sender: bram.hooimeijer@prodrive-technologies.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@prodrive-technologies.com header.s=selector1 header.b=IEXrYZCV;
       arc=pass (i=1 spf=pass spfdomain=prodrive-technologies.com dkim=pass
 dkdomain=prodrive-technologies.com dmarc=pass fromdomain=prodrive-technologies.com);
       spf=pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com
 designates 40.107.21.98 as permitted sender) smtp.mailfrom=bram.hooimeijer@prodrive-technologies.com;
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

This commit ensures that creating and destroying a cell returns the
ROOT_COS CBM to the prior state.

Previously, the following sequence would change the CBM of the root
cell for a 10-way (bit) CBM:
jailhouse enable: creates a root cell with COS0 and CBM 3FF
jailhouse cell create: creates cell1 with COS1 and CBM 1FF
  The root CBM is shrinked to 200
jailhouse cell create: creates cell2 with COS2 and CBM 1F0
  The root CBM is unmodified.
jailhouse cell destroy: destroyes cell2 with CBM 1F0.
  The root CBM is extended to 3F0.

The last extension is considered undesirable, because the bits freed
from cell2 are still in use by cell1. Due to this, cell creation and
destruction are not inverse operations, but instead leave the system in
a different state.

This patch checks whether the bits are in use by another cell, and
whether this cell allows the bits to be ROOTSHARED. If these bits are in
use, but not shared, they are not returned to the root.

Additionally, the root_cell bits are removed from the freed_mask to
prevent merge_freed_mask_to_root() from considering these.

Fixes: 3f04eb1753bb ("x86: Introduce Cache Allocation Technology support
for Intel CPUs")

Signed-off-by: Bram Hooimeijer <bram.hooimeijer@prodrive-technologies.com>
---
 hypervisor/arch/x86/cat.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/hypervisor/arch/x86/cat.c b/hypervisor/arch/x86/cat.c
index 42fd83d9..d3425f7b 100644
--- a/hypervisor/arch/x86/cat.c
+++ b/hypervisor/arch/x86/cat.c
@@ -204,6 +204,9 @@ static int cat_cell_init(struct cell *cell)
 
 static void cat_cell_exit(struct cell *cell)
 {
+	struct cell *oth_cell;
+	const struct jailhouse_cache *cache;
+
 	/*
 	 * Only release the mask of cells with an own partition.
 	 * cos is also CAT_ROOT_COS if CAT is unsupported.
@@ -212,10 +215,22 @@ static void cat_cell_exit(struct cell *cell)
 		return;
 
 	/*
-	 * Queue bits of released mask for returning to root that were in the
-	 * original root mask as well.
+	 * Queue bits of released mask for returning to root, if
+	 * - the bits were in the original root mask as well, and,
+	 * - the bits are not in the current root mask, and,
+	 * - every other cell using these bits indicate these to be ROOTSHARED.
 	 */
-	freed_mask |= cell->arch.cat_mask & orig_root_mask;
+	/* Remove bits from cell->arch.cat_mask used by others: */
+	for_each_non_root_cell(oth_cell) {
+		if (oth_cell != cell &&
+		    oth_cell->config->num_cache_regions > 0) {
+			cache = jailhouse_cell_cache_regions(oth_cell->config);
+			if (!(cache->flags & JAILHOUSE_CACHE_ROOTSHARED))
+				cell->arch.cat_mask &= ~oth_cell->arch.cat_mask;
+		}
+	}
+	freed_mask |= cell->arch.cat_mask & orig_root_mask
+		      & ~root_cell.arch.cat_mask;
 
 	if (merge_freed_mask_to_root()) {
 		printk("CAT: Extended COS %d bitmask to %08llx for root cell",
-- 
2.28.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/PA4PR02MB667022FEAA58A2425E69A019B6B59%40PA4PR02MB6670.eurprd02.prod.outlook.com.
