Return-Path: <jailhouse-dev+bncBDGILGE54ELBBKXW5GAAMGQEIUBEJ3Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x539.google.com (mail-ed1-x539.google.com [IPv6:2a00:1450:4864:20::539])
	by mail.lfdr.de (Postfix) with ESMTPS id 858A130D788
	for <lists+jailhouse-dev@lfdr.de>; Wed,  3 Feb 2021 11:30:03 +0100 (CET)
Received: by mail-ed1-x539.google.com with SMTP id m18sf11163639edp.13
        for <lists+jailhouse-dev@lfdr.de>; Wed, 03 Feb 2021 02:30:03 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1612348203; cv=pass;
        d=google.com; s=arc-20160816;
        b=rJJT1wMLfTP7E298IBADgTWfjzWMbTHiZ8dWSJ5oXxK9gb5rm+nk0XCQUfEzqCPU3K
         IluB++bg5CA9Pa3d31wwPRXayD/PVYT90+72IvcqrMkc6WooOCzgUfyWwLfsCvN7RP+K
         YXSKx001SFdVB3psIdliSPNKtaR2ejWof3lCaB9osumuhKo8r1tViFM2meSooyFjF4IE
         OALnn1tYVT8I+FXBIEQzLzbMF7EMRwU7i6tXUrRDizWP7K77z5RjJCw0nIGwJqURo7vG
         9e9fIFe45cCQwvl7UzMKfRwLrlpDJ6hmZWucYNjsrx9Ch/HGU616M9VaMqYDAteOKAfa
         eN4Q==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:sender:dkim-signature;
        bh=FSTE9XhoRrPCBIIMYoN5ev77fjw36sl0WR9nTyOnQaI=;
        b=p2WH2ltLV5uJuZ7nhKXSyVe7fkbW03n/EGNPZhjhOFIkgoD7Z4mAe9cv02vqL2GPfi
         isXYnpD27dK/4u3cAAw5tPaFS2a9O6/MGkv7NaqPSxq6WCKx5Ewx3UM1R8NgQAyyyGiN
         W0KD+8BbFIBSXLvMxBydFjwpdCrON5s11xow5VUxL0SM1TTDuYl9pMJihdI3c6n66K4z
         oZVBOOHklyIqrMujO/eognBZLqddiexJUe11a/lgYQt1NSwJdN2GyDZcFcoLzvMk9iE6
         hAnpXIkhtkVuDmUMGy3H56aamCgs2lgHofg2oOhvNt5z+bFePDq0nRVhq22Kccltf7sE
         xpeg==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@prodrive-technologies.com header.s=selector1 header.b=ANnzYLUj;
       arc=pass (i=1 spf=pass spfdomain=prodrive-technologies.com dkim=pass dkdomain=prodrive-technologies.com dmarc=pass fromdomain=prodrive-technologies.com);
       spf=pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com designates 40.107.6.114 as permitted sender) smtp.mailfrom=bram.hooimeijer@prodrive-technologies.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=prodrive-technologies.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=FSTE9XhoRrPCBIIMYoN5ev77fjw36sl0WR9nTyOnQaI=;
        b=Y564Nzxg72dMNlkMV4Oleqh4dqb9soF1OiXD0xNFk3HPF7LzFkmkryDKKZEY1dHM9A
         Jb8i/3CaIbCFOm3IOvO5+ug6lbo+MLRRPF3su/DWQsQc49NoSYYQkj+SWgHiW61JqVnK
         NkodOU/UBgOOXMeYaU3KKrmZp0A1Yv5DwQpT2k6KD/ajpD2xglsG0ENa6/7H1VELgtgd
         Dw8TJ+D65jnAJdLYU1XXm/ls4zHZkY10MQGzs+IgCyzsCDEbMk/kYqN3PLMHZ5mISqN7
         ZRBBwx+OEbDUEW7lc9xMembRodV0sIHba9+2FqYxC88vD6p73yYG+np/QzlM57tKSsCZ
         c2xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:references:in-reply-to:accept-language
         :content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=FSTE9XhoRrPCBIIMYoN5ev77fjw36sl0WR9nTyOnQaI=;
        b=rSgNjZlLAZ27HGue2f9tQlhKQh8nmsNwk/oyHDGTAZiToa4bJppKhGU37P0307olZH
         0nvKewZc8u/ZVuUArAb0V7R6c8YkhipP3c5toR+ey6QEfo+ZdudiVh79ozkXaUMJUSIE
         a5bipX4map+o5uUOfcQdF4Z+lQhk2GDryFnZM7KUlMGmqpViLg64SHwvplGu1hKR5knn
         LxxF6zqbuqhB7aEswSJcLD78j4ShkvbJEmhJkLNJXp4MfWQpSqk0T3CYtyNMrI/8YTGl
         f+mSqPb0BfVfQpbWLPs62ASFg5q/Q88pG3ExW5WWW0JkM5XgCRPznZ8EImh7oTltqCEc
         v8hg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532ejPeBNKxcO6DURDt026IlX7puxjzx+KLA+zSZc13OEEGVA5Qj
	Mw0MbU55KaIVVhxbO/wtP0Q=
X-Google-Smtp-Source: ABdhPJxG8pMHKrnLVEi+rvKGubE4lHUrX8CCLqr5s4M+5+WCA+L2PYBrjvj4VsQegIeUbI0ftwCbfQ==
X-Received: by 2002:a17:906:6b91:: with SMTP id l17mr2414690ejr.171.1612348203156;
        Wed, 03 Feb 2021 02:30:03 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:1192:: with SMTP id n18ls1016843eja.5.gmail; Wed, 03
 Feb 2021 02:30:02 -0800 (PST)
X-Received: by 2002:a17:906:b50:: with SMTP id v16mr2384467ejg.298.1612348202328;
        Wed, 03 Feb 2021 02:30:02 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1612348202; cv=pass;
        d=google.com; s=arc-20160816;
        b=YZQzN8hEFFNiHQz9A0uqvJ4Y8n8xMJgrvsOxoRL0hQMhu8201FpT4soe2FLYxjkuvc
         B6rR//kSQ88buhVh/tpxR7LVSx7Z93477QKD41537SQOMZ1MIU79Drn1V9yxLkpDZNq7
         RhyC2w59xAcfBy/DVb0XTB3CvpzusjYwN1U0Xanb5THLdk7PTzYz3U0GdY3OY+jQxbPn
         WH5NwzDrs9o3YlUb77EvJMidnUHdGcqCEQdtlQleuBFOWXcyJKaWFz6yQoYCmQSZy8yF
         lzDARQq/a2/hu8ZiSi8IiLA/n2cWvHbHrEC8UcDcU+hIjl9vaqhyBCmTK/+s3+LrT8Z1
         4Ewg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:dkim-signature;
        bh=hcUNBFAbbnlIGSVIdUFNsk5Dd5qZFjP696hk7L0wFGg=;
        b=RQMX1VSim/x2HtRDB8SSMLre22+7W8C3t8Egx2aEUa4afTxPbkRu3GweebZuf9Bgww
         QOhPLKdmkH3Xl1H7Q8arkw3pG5T3rp+bqlXRKikkBS3ESzdqyioJnDs5476dCHEvPLFq
         H6pr61x0KcscxE0Z1JfBXdnGPWNqYbhppnyYJtvO9jJTlEAP0NDLV0wuAdRKhIv6eafB
         +sVpvC3B1tmx4dZYRFIVjr7gE5QuwY1SvhwGPNum6yey62DcQtERNdBRvinQ/RwvMKRO
         MmwfYpn4/UYuGOXuT1bPpyTOhfoJPonJT8yiCoa7J/8ZJ0Zc1ynQ0NzzN4hBx9TIJIWA
         23Tg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@prodrive-technologies.com header.s=selector1 header.b=ANnzYLUj;
       arc=pass (i=1 spf=pass spfdomain=prodrive-technologies.com dkim=pass dkdomain=prodrive-technologies.com dmarc=pass fromdomain=prodrive-technologies.com);
       spf=pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com designates 40.107.6.114 as permitted sender) smtp.mailfrom=bram.hooimeijer@prodrive-technologies.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=prodrive-technologies.com
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60114.outbound.protection.outlook.com. [40.107.6.114])
        by gmr-mx.google.com with ESMTPS id r19si75793edq.5.2021.02.03.02.30.02
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Feb 2021 02:30:02 -0800 (PST)
Received-SPF: pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com designates 40.107.6.114 as permitted sender) client-ip=40.107.6.114;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f98gn5krBEYHPaj5hgBT4hCSR0bkYGLbPeUI7XMmV0p0O3rPVFX3QUaN/YzqUjDqjr0ZO2wzG7MxYgGdxfGXOrdvBKs5RrJ/uJpOykLboKh54VPE58fUfM/L5EaXj4jXywHeyNY6X49aMlq4PycnG7FNxnpTcR7gQ/mfxnfocYzA1n0jkwaba2awaL5pyaz4/a2dr5Apj2R6yYu4QA3k5/guiqBfWQKCz3Eq/5kRNCkslpKHy8OIMjh6k2D2F727GarLe7WYj0qh1IvPFO365mByUHpXnkSGyM0CIGnnsWb5CVSxstHkVhmacGMJK4EnS6rfJOgnRf7tF6dhFv3c0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hcUNBFAbbnlIGSVIdUFNsk5Dd5qZFjP696hk7L0wFGg=;
 b=ZTFSfc6aFV1RwsFx2ellX6D14/LuQofLqVSHEIF4tUdRemPw4hyv+B9Pc4xNGc3IujAg5YXqvnaqGEQjJMYuGP2B92Sn9SiAGw1k6mqwCdVHBAE0TGUEaN4/xhz0oxPkndCh2npAWX/3m87L52/Fzus25+45wmeC5LgkAwxBVG/5PmDCkK4pBsE8ibhNMGRPSr5l0L3IemcPnaAmlwnCzdq1NDi4d4xFowRoSsx/pV8lTEp1BpXg0RkgBTv9HIITOjcLfjxAzZFcYwwbqOIXLteljlocQrvAuqR1VcM38t1zd3Cs317T2ZVB0pc02OEg27iiT4xJvFYLF4n9OAgX2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prodrive-technologies.com; dmarc=pass action=none
 header.from=prodrive-technologies.com; dkim=pass
 header.d=prodrive-technologies.com; arc=none
Received: from AS8PR02MB6663.eurprd02.prod.outlook.com (2603:10a6:20b:257::14)
 by AM6PR02MB3973.eurprd02.prod.outlook.com (2603:10a6:20b:48::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.16; Wed, 3 Feb
 2021 10:30:00 +0000
Received: from AS8PR02MB6663.eurprd02.prod.outlook.com
 ([fe80::448b:147f:5ab4:b402]) by AS8PR02MB6663.eurprd02.prod.outlook.com
 ([fe80::448b:147f:5ab4:b402%4]) with mapi id 15.20.3825.019; Wed, 3 Feb 2021
 10:30:00 +0000
From: Bram Hooimeijer <bram.hooimeijer@prodrive-technologies.com>
To: Jan Kiszka <jan.kiszka@siemens.com>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>
Subject: RE: [PATCH 0/6] Fix unexpected behavior x86/CAT Module
Thread-Topic: [PATCH 0/6] Fix unexpected behavior x86/CAT Module
Thread-Index: Adb5gNRYivIxkOZOQByCY1H1R4JytwABB3yAACE/yxA=
Date: Wed, 3 Feb 2021 10:30:00 +0000
Message-ID: <AS8PR02MB6663E803EF369EF2764E94A2B6B49@AS8PR02MB6663.eurprd02.prod.outlook.com>
References: <PA4PR02MB6670EC0868445B5454C42969B6B59@PA4PR02MB6670.eurprd02.prod.outlook.com>
 <7d1fb7a3-b427-74c2-2f2c-8bfd62453ac7@siemens.com>
In-Reply-To: <7d1fb7a3-b427-74c2-2f2c-8bfd62453ac7@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [212.61.153.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9c86224a-5fb2-4d97-bb59-08d8c82ea963
x-ms-traffictypediagnostic: AM6PR02MB3973:
x-microsoft-antispam-prvs: <AM6PR02MB39737891645EA5371C6E5521B6B49@AM6PR02MB3973.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Chz7Nzwye8/c6LyAXNLtZfYrnUzCaXLA5FsJKxACBH4Rao4QGWA479e61LvG0ohbVTNZfEC56PS5oGC3UDYsu1mYg4wpiJcSfsL9nX4wgYuiql8lZ1Afe8LA1OFYoHLmxFTcS0KrjVzWCjbd/cS1Gu+AtKbDqMxnvJX14jFT56j7KE5Uot1/MVodwi4lyohOjFmk/I5ICBbGav0pEClb3PSIgOo0VUPMECY99AnTKFuQQkBHrNWIViggWL3tatp74dVIXi8VJwC3MnLPCP8p+68bIi+Dc/V6NoA9OXEtpj6levDfxNu6zO/cCI3zOsR7SLsFRiBQC2acLJx+DyS5cP7KKu3LyPRzWH8LH4wDSdD2/m8wuu9fISquDEFN2yZEiTaL7SMR+tq7575MVsoJ/hMjYGItMQ9USD4J9C2TUJui3jSP3Dliz2WpCwXLpE4TObw4FRrhbIC9owuIq9MuWnh27gmeUNFWNvQvSwvoRZ/dMYeG+WbILu8e5QYXoTIgnomlybjM2VqpbwsI5WbU2HVlXZnvU/lTv8/4c6grJ7yNH2B7kHK5dq62xYkSvCP+FjMdLmsqZbK8Hf7cJ/a87cDpf5yBtbquNJQrPAYpIbo=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR02MB6663.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(376002)(39830400003)(396003)(366004)(6506007)(52536014)(5660300002)(478600001)(2906002)(76116006)(86362001)(966005)(66946007)(316002)(66476007)(83380400001)(110136005)(45080400002)(64756008)(66556008)(8936002)(8676002)(9686003)(7696005)(66446008)(33656002)(186003)(26005)(71200400001)(44832011)(55016002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?IzdEZIiJkEmKGhUw+k0btb84EJBjqc22RJPhs0jtXv2pLRjCZ+sRCn46USOJ?=
 =?us-ascii?Q?ak/0s7B3PmEo4/Fq9MQYGa7bxN8crBeGK1RAyaYIt6E6Qe7NqMi+YRi9l3u5?=
 =?us-ascii?Q?+1KlbwSeG652/6Wfoi/Pzx4VU+2BdAhxIkGKbZED+wUmN5eAJkxcDTjIU6aw?=
 =?us-ascii?Q?C+qI80jV2cTbei7LR/tItt/0jDtFktIcvOgZBxDxB17GRTkl2mCFkRUR4dGo?=
 =?us-ascii?Q?tgLpWYG0FRJYqCBb7Oj8QsHsnH0nvGOet78SySLQOAnEw10OAU8gUTdYsQqX?=
 =?us-ascii?Q?DMfnjHZYgkAxgXE8nDohHXoZ4RNbhiO0IiKUUgoKUsQrCMDy+Lv0diIYMCe4?=
 =?us-ascii?Q?04S0komGseeuqUVdr3Gu7C8OpEf33fqDIr2of9XyDiNU7YxFRJuuWsXxuI8I?=
 =?us-ascii?Q?1MLVCgd4q0pX5EjVuIRdRwOPEazGW2NHzYjtw+MMxBtKs5a+UEXpvjbM/vD4?=
 =?us-ascii?Q?ID0Lxoryvi2rQ/g+jtfmvFAva8ULW0aOORHQXA8JMyeoegMr6kkJMZyUySXm?=
 =?us-ascii?Q?ulpAHoRm0cXQGAtwt4xyTF+8sYtyrtiyKcF6MD0xjIJiKMFn5IGW71vOegJD?=
 =?us-ascii?Q?ILt5NbRQcOe3OHXfeUhtUCca5YtFUJKAeiyHNWVJhHqQGTOQH/0tnFjzpyv0?=
 =?us-ascii?Q?iHsiPVQ+V6/FwaJpqRdoi3YmlYNvRHdhVeDK2Ae8UqSQ2HwDUPJp6iSaZYrw?=
 =?us-ascii?Q?8kyGlt+4iKr47vVCXb7trkF6aaJSAfjd7Orahv0+H8bLGqmUFM+6D4Tu1P3w?=
 =?us-ascii?Q?1lVZqz4KEUu5ETJ+VPkIV6USS298DItbT1xmuz90xkAutXzOOFqRmXORraq8?=
 =?us-ascii?Q?Dn0YEcjUOnHR1PvobCOiMKRB4JZvhmf7LEKuLQb1VyUCNFbZZxv7ZmKzf0ur?=
 =?us-ascii?Q?Mjte66kdW2+Yj1J+6cQc5+O2n8+x8bcJm9pHb9Ap/JI6GmtxyFpPaeZXRbHE?=
 =?us-ascii?Q?X4IEXO4QebaR1UYEvjaiwEffeESvKhbllSsO8pBJOQxfipJ/8uEluTb3d16F?=
 =?us-ascii?Q?73dyoFrlVGG7/vlK77mDrt7rejyhKFs7Lj78eYu5W6Od1dT2snmuoBHJrO0L?=
 =?us-ascii?Q?kuNr/xqF?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: prodrive-technologies.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR02MB6663.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c86224a-5fb2-4d97-bb59-08d8c82ea963
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2021 10:30:00.7656
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 612607c9-5af7-4e7f-8976-faf1ae77be60
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u1Ok+srdegJKZMUw/LcCVU8W01R1cmRkwguTBQ6nNSqUlWCwVGYGUaSSqvAupNr1mmqyv/3OsvLBM9czhG65o350fxt9/q6d5+E4nFewGifGBs2E63nAJOnkNCb1dm3qdRsew4D9V7M4Pa7hJLsIJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR02MB3973
X-Original-Sender: bram.hooimeijer@prodrive-technologies.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@prodrive-technologies.com header.s=selector1 header.b=ANnzYLUj;
       arc=pass (i=1 spf=pass spfdomain=prodrive-technologies.com dkim=pass
 dkdomain=prodrive-technologies.com dmarc=pass fromdomain=prodrive-technologies.com);
       spf=pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com
 designates 40.107.6.114 as permitted sender) smtp.mailfrom=bram.hooimeijer@prodrive-technologies.com;
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

> > Dear Jan, dear Jailhouse community,
> >
> > We are running Jailhouse on an Intel X86 server-grade processor and use
> the Jailhouse CAT module to isolate cache usage between cells. This patch
> series contains several fixes to the CAT module, to ensure the root cell
> remains isolated from non-root cells.
> > I have tried to explain the grounds for change in each patch, with counter
> examples where needed.
> >
> > Jan, I hope to extend the CAT module in the future to allow each cell to
> change its CBM during run-time, e.g. to distinguish critical and non-critical
> sections. Now, the module dynamically allocates each cell a COS, and
> considers any write to MSR_IA32_L3_MASK an illegal VM exit.
> 
> Right, the simpler model.
> 
> > Disregarding the last patch in this series, each cell had its own unique COS,
> which might justify a cell changing its own CBM, for example as long as it is a
> subset of the CBM in the config file. However, in the last patch of the series I
> drop this behavior due to issues on larger CPUs -- the number of CPUs might
> outrange the number of COSes available.
> 
> One COS -> one cell is so far the model. If you have one cell -> one CPU, you
> may hit that limit, true. May I ask how large your systems are?

We are running the Xeon Scalable series. These packages come with 8-28 cores. 
Our system has access to 16 COSes, which should be sufficient for 11 bits in the
CBM. I didn't take the opportunity to check to what extend the amount of 
COSes varies among the different processors in the series, but I this to be
invariant.

> 
> >
> > Allowing a cell to cleanly edit its own CBM, without affecting other cells, is
> difficult if the COSes are dynamically assigned at cell creation. That is why I
> am considering to extend the cache-regions in the config file to allow for a
> statically allocated COS -- and make this a statically partitioned resource just
> like e.g. memory.
> > What are your thoughts on this? Any reason why you omitted this in the
> first place, and opted for dynamically allocated COSes?
> 
> The "why" is generally best answered by "it's simpler to implement in the
> hypervisor". Any moderation of hardware features add code to the
> hypervisor. And an interface that could break or be misused if not done
> properly
> 
> So, you want multiple COS per cell in order to hand out sub-control over the
> cell's CBM to it and to intra-cell partitioning? Sounds complex from the
> hypervisor POV, though I understand that there can be use cases.

I understand that disallowing modifications to the CBM is the simplest
solution. Modifying CBMs properly while COSes are allocated dynamically
as is the case now, will get complex very quickly. For example, should one
cell COS be modified if another cell relying on the same COS wants to modify
the corresponding CBM?

If I understand correctly, I would expect it to be outside of Jailhouse's
philosophy to start modifying COSes at runtime to accommodate cells
changing their CBMs. Additionally, I find this undesirable as this would require
hypervisor exits which incur additional latency.

Ideally, all these resources are allocated statically, at cell creation. As an
alternative, I would consider allocating COSes to a cell statically in the cell's
config file. Then, the cell would be able to modify the CBMs corresponding to
its own COSes, perhaps controlled by some additional flags. 

Anyway, I will look into the possibilities offered by VMCS. If I can find a
workable solution which preserves the simplicity on the hypervisor side while
allowing the cell some more control, I will propose this as a patch. You can
then consider whether this solution would suit Jailhouse's simplicity and 
whether you'd like it included in the mainline. This might take a while though. 

> 
> >
> > Thanks,
> >
> > Best regards, Bram Hooimeijer
> >
> > Bram Hooimeijer (6):
> >   x86/cat.c: Fix type freed_mask
> >   x86/cat.c: Fix CBM for non-root cell w/ root COS.
> >   x86/cat.c: Fix returning bits upon cell exit
> >   x86/cat.c: Fix off-by-one error
> >   x86/cat.c: Fix overlap on moving the root COS CBM
> >   x86/cat.c: Add COS re-use in cells with same mask.
> >
> >  hypervisor/arch/x86/cat.c | 140
> > ++++++++++++++++++++++++++------------
> >  1 file changed, 95 insertions(+), 45 deletions(-)
> >
> 
> Thanks for these, need to dig into the details.
> 
> I have locally an unfinished CAT rework pending that addresses L2
> partitioning as found on Apollo Lake and newer - or conceptually also multi-
> socket L3 partitioning. For that, it resolves the wrong initial assumption that
> CAT is system-global. Baseline is a new CPU description, see [1]. All that will
> clash with these, but it's my job to resolve that.

Thanks. If there is anything I can do to help on this, let me know. 
I will keep the new config files in mind with future patches. 

I only took a quick look, but I understand that Apollo Lake offers L2 partitioning
only because it does not have an L3 cache. It might be worthwhile to abstract
this to LLC (last level cache), if this relieves some of the complexity. 

As far as I know, there are no CPUs currently that offer both LLC and MLC 
(mid level cache) partitioning, though there are some Intel rumors suggesting 
this might be introduced in the future. This might introduce new complexity. 
For some thoughts on this, see this LWN patch [2]. 

Thanks, Bram

[2] https://lwn.net/ml/linux-kernel/cover.1561569068.git.reinette.chatre@intel.com/

> 
> Jan
> 
> [1]
> https://eur03.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithu
> b.com%2Fsiemens%2Fjailhouse%2Fcommits%2Fwip%2Fnew-cpu-
> config&amp;data=04%7C01%7Cbram.hooimeijer%40prodrive-
> technologies.com%7C6559d5c239d143be055e08d8c79c15bf%7C612607c95af7
> 4e7f8976faf1ae77be60%7C0%7C0%7C637478820492030539%7CUnknown%7C
> TWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiL
> CJXVCI6Mn0%3D%7C1000&amp;sdata=35z3GNSCx%2BeBq0sJvTt4tADM3IIW
> UG1Evtf04JsiFIs%3D&amp;reserved=0
> 
> --
> Siemens AG, T RDA IOT
> Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/AS8PR02MB6663E803EF369EF2764E94A2B6B49%40AS8PR02MB6663.eurprd02.prod.outlook.com.
