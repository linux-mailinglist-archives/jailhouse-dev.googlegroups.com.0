Return-Path: <jailhouse-dev+bncBDGILGE54ELBBVOERSDAMGQETBHJS3Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43f.google.com (mail-wr1-x43f.google.com [IPv6:2a00:1450:4864:20::43f])
	by mail.lfdr.de (Postfix) with ESMTPS id E794A3A3E38
	for <lists+jailhouse-dev@lfdr.de>; Fri, 11 Jun 2021 10:44:05 +0200 (CEST)
Received: by mail-wr1-x43f.google.com with SMTP id l13-20020adfe9cd0000b0290119a0645c8fsf2295631wrn.8
        for <lists+jailhouse-dev@lfdr.de>; Fri, 11 Jun 2021 01:44:05 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1623401045; cv=pass;
        d=google.com; s=arc-20160816;
        b=mS+jOuXn9b+5vvnuc+R/Ilt5ZmpyPtSNM4Og8QAx1Mic4vrIuM3kEu1E2eehVsHFt0
         iojBg5ZrHlqBH8/9ASy2fopSxNdGAFsO9qNA4a60w7LClRE01I1rXqXe7wd7DarH6Krk
         2eGpVEJ/SujYFr9RgGVm06VwF+WXQuvgd6ifd8UUlcbpedoEdtKr+m5+d11IQXCCpPk7
         VhhNXDq5GsxCMsbqIbhMuzR5B1+EU+M0WKy7XzVAoGPop9viyJtr/jpFP3eZtLB4laVx
         ebc8HVXvXgviNz3wNvS3ESkMYZfXXs++1YPeMBfx1HfD+tAuUUFOF6VX2axDZn4RTHWY
         2lFA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :cc:to:from:sender:dkim-signature;
        bh=Wyw29H6+mzCnE+ToVcmrHHi5Er7WcNrQkfN6pdApwnQ=;
        b=d0HLaFC8+vnFVuw2Grrasvt5ygoT0gQipzB7D5nxkKr5ol8mH8Znuz5XkW7lr1tKyN
         BPXLPsrYhJ1eH8Zij9UJE+9oXcuJjhvI6A2IPnmMmQIFzUZClvjqM/b9GvOOrhWu1RqA
         YJNcI2MLtRrRNxjLiigBd+WDtSIfWM9e1XPV3knAJSMNTzna1fWA9cAVWisTvtDM28TO
         Cm+It4m710sm+UdgEd4nDlfYhhjvNjO42nfuj6YoaK+bgXMy6d15ueJ1YZJIh4xd0Wnk
         f/jcgQSabkfTF7nb48OajuvWBNj1zOPdVYQ7kt8uEItp8pdgtLwju9ASLvSwTkThG6ot
         8ifw==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@prodrive-technologies.com header.s=selector1 header.b=MKPGg6n+;
       arc=pass (i=1 spf=pass spfdomain=prodrive-technologies.com dkim=pass dkdomain=prodrive-technologies.com dmarc=pass fromdomain=prodrive-technologies.com);
       spf=pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com designates 40.107.15.92 as permitted sender) smtp.mailfrom=bram.hooimeijer@prodrive-technologies.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=prodrive-technologies.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:thread-topic:thread-index:date:message-id
         :accept-language:content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Wyw29H6+mzCnE+ToVcmrHHi5Er7WcNrQkfN6pdApwnQ=;
        b=rSW9gzJ28b9QlD/O9kJ4J2SPhcOmRQN8jwoqyWNWkXGNGQDmA8jruxvNOHkbmFsNlB
         MQT+vTN0+enaHPTv/TEwEUG7qtpgXdXT1iZySTtafjtJvl7n79jQwneQ9dR/NTy5CKni
         HCzV/Nxc2J0tWz/wagy8ai96on7BzUSgUBGJTN71FeCyQRRnyfLYiSeFna6JavoxUc/F
         y2K6fUp1/tq0OAJtdDlzFmPrhp+MW16eiXb8A5v5LyEI7K5xH10aD3qFAjzt6zuKxIw8
         r6uhCmNKkGIcFG2n46+usy1yX4lidaKkGgObrszABSjua1Ey/KtEsN45gAyLW+xHybzZ
         P3DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:thread-topic
         :thread-index:date:message-id:accept-language:content-language
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Wyw29H6+mzCnE+ToVcmrHHi5Er7WcNrQkfN6pdApwnQ=;
        b=bhLKQZAzNCQFOtid4s2DqKDYLvR0ijzk0OV2WPFl+VhKUsSOyV/tb3pKsjcdxhgMjp
         /sLy2ckBoXFFbwpDgXjWq+Dx9yNEOJaSxxgdXB+cua2KC66u/vGXeZznZKTMwMHPp9V3
         7s3c8CezGv1HBsnup0/lh7jPcmmcjyLlVbhNOoIcfiohSLvwChKdBRl0fyzALu8qn/Ah
         DGAGf+hk0a+0QyK7up9V1IRfl75QK4WhjR2b6/r5MqlnCad1vJ7qzy8vHqZYiaAyFbMS
         hjriiw7Z9rRdKBl5fYPudd4XoAPzK4bjDYhNTAQoou9fARBb6VajtLqg5FqKnGcd7WJb
         QtWA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533uoknXOXh/ASoiHMZ+pR12sfItdTtKhpgu7tnAzZt4y9kdqsPs
	04Df9YvLptH9o7N7/ESTYn0=
X-Google-Smtp-Source: ABdhPJwXU+j0aMddIWBzn0Ny26jmuPj06AHZLUmmVVE63iHkkVoBIPtUlWBKg9RfD0G23/YGV5b6Qw==
X-Received: by 2002:a7b:ce13:: with SMTP id m19mr2887638wmc.159.1623401045524;
        Fri, 11 Jun 2021 01:44:05 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:ded0:: with SMTP id i16ls682898wrn.1.gmail; Fri, 11 Jun
 2021 01:44:04 -0700 (PDT)
X-Received: by 2002:a05:6000:10e:: with SMTP id o14mr2803480wrx.76.1623401044647;
        Fri, 11 Jun 2021 01:44:04 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1623401044; cv=pass;
        d=google.com; s=arc-20160816;
        b=Q4jxtQZaBainN4NRO+BpImo7SG8GaD8yPGA9mVk9lmDckup+p3YEB2bTcOnCME6EAO
         CN/LZirA/WMCRTMA+oCQNxIeXenaOGA6s/hCfYk3yEKdr8ZN8VOPl/ScPvA24DMnPmsz
         nMyfso0aQVlXrr+IQUJ0sU5V+XvkSJCzaBeth46ubl5VZKWHGU06jQxNVQuGGOllJUZ+
         atHUB+BGy9l6yie4/yMIdznVKpU/Cy8qb3HPgUwjDsvJpcykQlk7utc1/jUHOtTsTVg+
         F+JMuz2zly7odkYuWVTSQwr/KZ5YSNE1q76Jwmg4BD6vLrXmelAAc7ABSwDiGY2tyDuH
         Y/cQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :cc:to:from:dkim-signature;
        bh=7kQQ/IgPjFuOhZgd9jYzMWvLByAa0DeJacPgUH4l9yQ=;
        b=muuj+eVGSmHuUIHd7GPuX3jyNa8Oi1KYxdRWyPT938bv/a6f/oZ8lq9iR3nceOIzP7
         TKR0r1iSAEMghN3qfPgCnkGfRg9b0lq3l8gXZP/kFvYEDcxtFnz7FTxoc+cNDPPEQjWP
         K2FFqZ0UpSzwkCvFtwltmkImDf2T96LQKg+UuVSX4Ew5bqJtfmurtX+piwH62VUN9wUX
         wjLYQoi238aU7/yZtEzJFOlrUnRq+zW8r99mJqOxQdViDKKH/gCdEwr87XqsbQamnIlc
         xkEC2oA8SdYZb3M1G1qXJ97skUoDj89oWyzt7dtabCsCQRy7v4/IVLF5ICastCgM6YFt
         CJdA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@prodrive-technologies.com header.s=selector1 header.b=MKPGg6n+;
       arc=pass (i=1 spf=pass spfdomain=prodrive-technologies.com dkim=pass dkdomain=prodrive-technologies.com dmarc=pass fromdomain=prodrive-technologies.com);
       spf=pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com designates 40.107.15.92 as permitted sender) smtp.mailfrom=bram.hooimeijer@prodrive-technologies.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=prodrive-technologies.com
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (mail-eopbgr150092.outbound.protection.outlook.com. [40.107.15.92])
        by gmr-mx.google.com with ESMTPS id g18si223460wmc.0.2021.06.11.01.44.04
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 11 Jun 2021 01:44:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com designates 40.107.15.92 as permitted sender) client-ip=40.107.15.92;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RNdC+UVKPrzLQJ8JB+P5tgylKxkX1k6vqGg/O4UCCYk9X1qhKSA6v6OjFvPVHZ1QqQ6OYZF/LaHY9KVPC1ctqM86CVrQBP6hODGO8dRqlz79klilS8HBcPcTGspkH3PnmaAGCVT3hW0lUcB/fpPHQFoLmg8M35dsMG/Qt9I9bmAtDgJfYJ5BjM6JDns6F+ZC2T6FXPVyJtKus4jXyT+nGRFUP5rlZfrOip3TGvilqwObiDRXI4v+nVcXRFU5bwo9Rztwfe+vC7V94ngLYotkxpQp8KGdDNGnWnmQ7YG2WpsLCHkFpgKR4sM8S9W97BnmfjFzWwZ3kH5/63xX6jL8RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7kQQ/IgPjFuOhZgd9jYzMWvLByAa0DeJacPgUH4l9yQ=;
 b=eGUXKCAmHiqY1585RSYtB4yWkTOKeyNi0X880lRcRsDyTb1z5DEq+RUH8vRw7e4xsyYJs3uuhvkhrt1uMg0g2qbp0tpV16fuALUx0KsqQH89BMqSK1uaS3Gf2RhUpaNKSML1bpP3OXxuv8qi7XMFs3/g2y9g4dgG5X5vlGzFI5SvW3U2phwDiYUqySvUMvrIxhW308hj3re30OrZf30A3EFXyBCe+1uHiUV+WwvrnBl3QZTIQ0P72bYlunXldeUKsxn44rR+FCWx9og6JRvbg8F/F87AZw4+s85Hk8Bq8AYC1vSqEDZP2xlNL/dnrRIkL/TJ+yWhhi/UR1vgEgYXUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prodrive-technologies.com; dmarc=pass action=none
 header.from=prodrive-technologies.com; dkim=pass
 header.d=prodrive-technologies.com; arc=none
Received: from AS8PR02MB6663.eurprd02.prod.outlook.com (2603:10a6:20b:257::14)
 by AM7PR02MB6019.eurprd02.prod.outlook.com (2603:10a6:20b:1af::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.23; Fri, 11 Jun
 2021 08:44:04 +0000
Received: from AS8PR02MB6663.eurprd02.prod.outlook.com
 ([fe80::f197:f089:10bf:b446]) by AS8PR02MB6663.eurprd02.prod.outlook.com
 ([fe80::f197:f089:10bf:b446%9]) with mapi id 15.20.4195.032; Fri, 11 Jun 2021
 08:44:04 +0000
From: Bram Hooimeijer <bram.hooimeijer@prodrive-technologies.com>
To: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
CC: Jan Kiszka <jan.kiszka@siemens.com>, Ralf Ramsauer
	<ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH V3 1/1] inmates/lib: Set cell-state to shutdown in stop()
Thread-Topic: [PATCH V3 1/1] inmates/lib: Set cell-state to shutdown in stop()
Thread-Index: AddenWHTdGbU4WOhRZ6XtZWtG9tRJA==
Date: Fri, 11 Jun 2021 08:44:03 +0000
Message-ID: <AS8PR02MB6663FDC5904F5F8703613B34B6349@AS8PR02MB6663.eurprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [213.127.65.146]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cf8b076e-de80-438c-8acc-08d92cb51147
x-ms-traffictypediagnostic: AM7PR02MB6019:
x-microsoft-antispam-prvs: <AM7PR02MB6019FA1F71BD79DD0E906996B6349@AM7PR02MB6019.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:212;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qtFdiQHXEotChISsqmHCGcjHkDcjcgBW+VXZFooy9k93s++SgWSF85IPgG1AykckYVGg9kzHGrvTiBV0hJ2MOipaudHCpX+GophOA/MBssa8oW5dYTRq0rBlwFkgSxmZtuuAQgFB/exYhHJiddpBw7gIoIoafcJk4zCrR7Ier3G8d6WPRnfXhTmSGMZENO9NbVXoSuZ5oPf7IWjkw/FirRAKhLx3FQ6AvoK1CeZTm55rkutndqYwdwpDO71g6JywqhDD8h2zqoHgMitxVxh+E9Jh+inaxsVMce609dRufk5iWgzceSCjWV+Hm9ghcTFW3hCnJSl79jhPdn25f9eaoXvmSF2WarJ/K2GBM7uF3y5GdMFyWPQ4C3LGO+Sc+SaBiuGBkrHHal/5aiOvx53BZUK6Z0r3e4IT1pmJc1/f83od+CY4VXt0wIG7FHDtqSUI2mdIFvpCaVb9bklNwbmjxHlTGAnoZTyMrfW8W0KyKUSNjMZhNXBd5HX/Bn1YAVkT6hJ7xn0PjGz5Bpcb5VV68R6j0TYqlxKRmHCUT1MNwQ1605DUW1tkFi9WZOzouTsaR26Xe9+itBDe8DzJs65/YY4qV7jxxCyusBkXAWfif+4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR02MB6663.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(376002)(346002)(136003)(396003)(366004)(71200400001)(55016002)(6916009)(8676002)(7696005)(9686003)(2906002)(33656002)(26005)(4326008)(44832011)(52536014)(8936002)(478600001)(83380400001)(66946007)(53546011)(86362001)(122000001)(38100700002)(186003)(5660300002)(6506007)(76116006)(66476007)(64756008)(66556008)(316002)(54906003)(66446008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?x2Td4XgvRg1xcL6KY9KJUBM751XVFjsLRzIZ/hxd+EYBqXAKEaSsm5cvJF0B?=
 =?us-ascii?Q?QcjTwsfHi2b2ZiZ2dFG3k2w8OiBXCRJ7l1OHHjIreBSGaYq1bY/E/fGIquGW?=
 =?us-ascii?Q?s1nXcPCdgRfDgAzlZwJEUbeHpsoW7BN4jNq7OQ5GZQsjaZn2VAOpYbmEqohp?=
 =?us-ascii?Q?BvA5syrPNQo08Ram7VxdBzqcL8Ucr72y1T0gL4o7wtWH0hk+h02YKjAOzGKh?=
 =?us-ascii?Q?UkMo2uFnEA7ZB/DJ73v6zNnsYOy5zEsAmNEfvPV1KaRV8KFhcNO/RwD/wky6?=
 =?us-ascii?Q?M1lZoEJNnYJPT7gSOLEECMEmIyISPpeM1o2o4bYYB0HACjQp/mkRyTBryDRB?=
 =?us-ascii?Q?DlcJaaz/tLReAvoi/K4TI5RmF0QoI5moBoKMO+h99Ei3P/V4yvkn8Lc3xpLI?=
 =?us-ascii?Q?85CBGxVHP+E+55BskDahh6K2Ztl455v4HnG1jgpcoUZ6O00vjdd/YWt1RCA7?=
 =?us-ascii?Q?QP8PuhS2uaR/uktdK12Jk4xABHnrX7auIZjfNlCqdFVdcKhsZTcl6bX+tRWT?=
 =?us-ascii?Q?H4kQOCMgrZ4P6kt4HHhd5NHLnjKTYfMbOanm87sieX8GaUvM0clsyLvK7ycJ?=
 =?us-ascii?Q?9F3kGiNpZYsz4FAUbgYAXoPmV0ZilCeyvDto2it10p5BLGb57GexEAn3UkI7?=
 =?us-ascii?Q?SWmAy/w+52jz+ITkEC7uHfFofthE5HS5kAqk3MhHyDDlrc2micHjBuKuSoya?=
 =?us-ascii?Q?91SizPSi4OSIxgTk3lUlEMsfS6DzGuF2pWsgyP4fbYjs5T8i5UXZ98vPQa8u?=
 =?us-ascii?Q?nCmy5CGH5G7kukwHpUAd/SbXvl7hmK+7BstOkMAIZNzhorZiO4AUzkciWCHK?=
 =?us-ascii?Q?w5JPtYAdHNAw1PkFhB7CUHnIEqD/w8hIbTy2Wn8cnEQCIqwlA9ASCeihOQcb?=
 =?us-ascii?Q?2XToRsvjW6RN3anGjthP9wcAGo9+Q0wncxSYqixp+JtaX9JcJGwU0Pc4Hj7a?=
 =?us-ascii?Q?Ng+fU5tq0A1l4TKph/kJWP22FmXj7TXLaMTVZl0ycNip5KIt+ro975853U3u?=
 =?us-ascii?Q?DcV11gRXdqYVlIk5TnYN5vpWzW+QBZJFUA9uK4nJsi7U02DJIoicUnTX/azo?=
 =?us-ascii?Q?21Ib6hAcv3dATxOkBp5BaVxv2Yj0Vl0gCUqfY+BVDmqwhPt8t0VTMMeLzzoB?=
 =?us-ascii?Q?nz1VM4doHKHUYmbGnpK8RiuRydDlSuD/ziT55QgjG7GuCWGfaaKOxGUJaUxM?=
 =?us-ascii?Q?incB15Axthb+eXoW6OqvyleIrxx3AG0XTVv+yKlSg2J2EBE0cqF0Ok6cY4s8?=
 =?us-ascii?Q?Kizp35B/7OeOs7oVuD48xZUtEOpy8aIq5MHxr1n7voeL7rwVDmf0IkgLRANM?=
 =?us-ascii?Q?C0KsUHCvdsjnWyAnVPoI5Iqn?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: prodrive-technologies.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR02MB6663.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf8b076e-de80-438c-8acc-08d92cb51147
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2021 08:44:03.8796
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 612607c9-5af7-4e7f-8976-faf1ae77be60
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PLriS8X62Ssf0cIBIiXmEB1IMSWjNu7eaPUdB7ErE2qJ8ragM6sZdkcxhgHBe/F8Ak70QoX45L3RrAWB/KSTxlE/UDZxt20Jmjwc4MSOiCiReepb2EQaTU5yMg1gYVQ0znf1IRAKXlQxUCaJDmcClA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR02MB6019
X-Original-Sender: bram.hooimeijer@prodrive-technologies.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@prodrive-technologies.com header.s=selector1 header.b=MKPGg6n+;
       arc=pass (i=1 spf=pass spfdomain=prodrive-technologies.com dkim=pass
 dkdomain=prodrive-technologies.com dmarc=pass fromdomain=prodrive-technologies.com);
       spf=pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com
 designates 40.107.15.92 as permitted sender) smtp.mailfrom=bram.hooimeijer@prodrive-technologies.com;
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

From 8519ca72db9093d80d9a32c4482483c9ef8c51f0 Mon Sep 17 00:00:00 2001
From: Bram Hooimeijer <bram.hooimeijer@prodrive-technologies.com>
Date: Thu, 10 Jun 2021 17:27:57 +0200
Subject: [PATCH V3 1/1] inmates/lib: Set cell-state to shutdown in stop()

Ensures that calls to stop(), defined in the inmate library, set the
cell-state to shutdown if the cell is still running.

This prevents the cell to be locked but unable to respond due to being
stuck in the halt() loop. It also ensures that a return to inmate_main()
shuts down the cell.

Signed-off-by: Bram Hooimeijer <bram.hooimeijer@prodrive-technologies.com>
---
 inmates/lib/include/inmate_common.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/inmates/lib/include/inmate_common.h b/inmates/lib/include/inmate_common.h
index 1c20a0af..b7ea5559 100644
--- a/inmates/lib/include/inmate_common.h
+++ b/inmates/lib/include/inmate_common.h
@@ -93,6 +93,9 @@ typedef enum { true = 1, false = 0 } bool;
 static inline void __attribute__((noreturn)) stop(void)
 {
 	disable_irqs();
+	if (comm_region->cell_state == JAILHOUSE_CELL_RUNNING ||
+	    comm_region->cell_state == JAILHOUSE_CELL_RUNNING_LOCKED)
+		comm_region->cell_state = JAILHOUSE_CELL_SHUT_DOWN;
 	halt();
 }
 
-- 
2.25.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/AS8PR02MB6663FDC5904F5F8703613B34B6349%40AS8PR02MB6663.eurprd02.prod.outlook.com.
