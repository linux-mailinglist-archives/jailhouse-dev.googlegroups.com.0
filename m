Return-Path: <jailhouse-dev+bncBDGILGE54ELBBSHJ6WBQMGQEDRVMB3Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x339.google.com (mail-wm1-x339.google.com [IPv6:2a00:1450:4864:20::339])
	by mail.lfdr.de (Postfix) with ESMTPS id 006B036415F
	for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Apr 2021 14:17:13 +0200 (CEST)
Received: by mail-wm1-x339.google.com with SMTP id d78-20020a1c1d510000b0290132794b7801sf1291175wmd.1
        for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Apr 2021 05:17:12 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1618834632; cv=pass;
        d=google.com; s=arc-20160816;
        b=Ama7W1A3+xvcbTCFgpbe85KjB9JWpA8kmhXTwzc0MegAWqywz5dTirBnY4LrpNGXoa
         2mG5L0C3QP1WkpyhRoDHZ+C1KqdapeeH65B4IX9YI6+4GzwhC84255QGtEnSXlDiiODe
         mCGsaOmLieU/k6T9iAUo4v4fpzet/E2OenEpPzwp1zy/xfrYK1G05OgAXxDibmM8sr46
         tKaPaw0G2e5fNfNvknYir+pzFufx2E7A/xYe0jB6V99J+7KxbkI/JBojVxwhj+9L9v4d
         A90Re8SIZ+HnhgS0EHYBB6wMTN5O5GoMt+AkHfVkrGazBU9x2h6cEkzejKOkufzlrl+l
         gPVQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :cc:to:from:sender:dkim-signature;
        bh=2/ZHrDjI8qCViTUYy2emGoA3AreDOJI24I6/KH1Epb0=;
        b=D1+XPWJRiayty57vvrI95/0Tb+UJZSXJd04WT/9oJIJrTQqJ/x1FStaAP1NWCIo4BV
         z40KnJkCobpRReEqj4On5fRVZs5IUMqze3DO/ttI60DGA5JpSa87rjl/BJBfwWpQ8JA/
         dd1ch3bJZLO6p0UUXlvfjPXvxqVRo4m4/kRdjoV/yVDteHJhiEPz70VfpCEfB9bEvGnN
         P3KaymKFzG0fTrTQkM4WniXTL8ylrNW+lnB5GiHF0DO6zFVSX+AjizLWFX4cc2xIgZXz
         J+DiT6uXb++XhDajVTO22s+i/t0lqZ4GbCSaLYwbBF6cohKcA2Nqyq0mi0Wl/RKpJook
         lxmw==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@prodrive-technologies.com header.s=selector1 header.b=O6o5Tnou;
       arc=pass (i=1 spf=pass spfdomain=prodrive-technologies.com dkim=pass dkdomain=prodrive-technologies.com dmarc=pass fromdomain=prodrive-technologies.com);
       spf=pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com designates 40.107.21.95 as permitted sender) smtp.mailfrom=bram.hooimeijer@prodrive-technologies.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=prodrive-technologies.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:thread-topic:thread-index:date:message-id
         :accept-language:content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=2/ZHrDjI8qCViTUYy2emGoA3AreDOJI24I6/KH1Epb0=;
        b=Sho2HzqeAG9uqVBieU/RuE6lVKQfrlkvfGleqIyv46NF+FKtrwj8v0vQ9gY84LhDUv
         5EOpf+3dy/oxdUYXLyAdBjYmRX5vqUy/wU07PmECFIGAxamU9fUW+S9gifOeLzLsvC0p
         b1Go2t6jtwWImlX3m9gYyq7+JsU5jTAAtljyufQNSoLYoFLxttvmThvTJ/IdOFkMd/0U
         wFaDfMJOL2bjXEXxbSgACkjNZtz7mpNJTPukR5pA+t3h7fAB8G8lVYDghzXpSp27RCkR
         bcLD7udPloI5a4sxNSUt3gm4xSJmRXMLdaynVPkQQqaRkEBgR70uP6MsySWTFR5l2x6R
         Nsow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:thread-topic
         :thread-index:date:message-id:accept-language:content-language
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=2/ZHrDjI8qCViTUYy2emGoA3AreDOJI24I6/KH1Epb0=;
        b=likbW37izJm0Jbb8pN0SoaeBQhv+fOGVA76ScgFGuSkGoVOIqxK9fuG9wESJzZhwWr
         U4q6dI1C+LrV9CQxBLKb1MFhKDPM63JqIa03sGzdLb79iSZS9oBxkce/zmAh8wXbM4CO
         ShwSrXtFgaBC5Os7GJpSvaHSNelS/Z9Df2s7Lm1TeDCcVYDo2QqWZXZOV/FMF5RijLtf
         KFUnc64Zhz9atY3sUkdUCAMTPO5NhdqMQeXg59Di26pPvn2zuLbsdER2ayfmdqtna88z
         moKXDakpHqjw0RqpRBEia0/Z6zseFm/PbL70JUqULsNQlsiuvfUOZen7eV6A4Aoc1kz7
         RQ6Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531lrGEeQzPWqsWaOSLvol+/VvRuxNYBl5nlBYnr6t+FU3TqdvTJ
	4isc8OD5ZyWhiXhwDCtoZg8=
X-Google-Smtp-Source: ABdhPJybFdsYb5aBm0fIJaX/QG0WcPKk04XH/GnOARfJqNlSC/hYHLL9ukDRMNqx6/4dxpPS5lP3ZQ==
X-Received: by 2002:a05:6000:82:: with SMTP id m2mr14113784wrx.139.1618834632765;
        Mon, 19 Apr 2021 05:17:12 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:fb47:: with SMTP id c7ls7523913wrs.0.gmail; Mon, 19 Apr
 2021 05:17:12 -0700 (PDT)
X-Received: by 2002:adf:ba54:: with SMTP id t20mr14422938wrg.353.1618834631987;
        Mon, 19 Apr 2021 05:17:11 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1618834631; cv=pass;
        d=google.com; s=arc-20160816;
        b=A1TB0zeRX/ZEU3guc/iwtRZnWnJMmw7NsRYfIE9pMyNmZikuwSEiAtR0BVM5HvFGiQ
         It2FxQQaxkJah1bs/YPyBBulGo4D3DnhD0fnwtxP7GKjaVRLrlyxULA4epX+MuPsQgEc
         ZRH/HcBzzIQOsEKQNeA9kVaI+xpfmAppnivmKXe85X+QTbNQDTxjVvTVdoQoW+tV1O33
         QdXRTce9ByXp88k/ANvqEAGmoqLyEQdrIfm5LIFN18zun0EQEW3wS2J0FCHE6oVepzNE
         a2r73u1PicSubdsWt1VbyK8hf/OzsKNyHHCE/nNXz6RY3bDqB4q6YbuBamMTguW6VU6t
         TY1w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :cc:to:from:dkim-signature;
        bh=3LDcwmsIbk0hH1hXJDqNCq159Dw1Hp3RgsuNbxi6q0Q=;
        b=IaKQ5zVuWhPNNkeHb+O1lGUBCXUzaCYNtjckO9FmlHuXurbE0IxyvtiiFFQ4xoK/7b
         TZ4FG+jFD7CIDnP4XSZmVFjfEaZRGuhrKCBz4WuSmGpcUC9kdo/h0oOnN44xiRkWlPqA
         x7tcynzerraIMSKdJFDsJ3FxjwDbNlF0XFAr6XMS95kgZ/AIGEIZgbIcWt6uhVGh2CAq
         eoCoUMLcTshQJiy8z/fPlhOS3Ill6yy9THyKqh9UE0OiKhesF2aBy1dBVf00NjEfjihF
         OmLBZsCbVUti42bnQaaAyF0hg4XtgILJsCoTR/m4m1oaZ6aNaYdDC+JWNiBlkpBhrbD4
         fgEA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@prodrive-technologies.com header.s=selector1 header.b=O6o5Tnou;
       arc=pass (i=1 spf=pass spfdomain=prodrive-technologies.com dkim=pass dkdomain=prodrive-technologies.com dmarc=pass fromdomain=prodrive-technologies.com);
       spf=pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com designates 40.107.21.95 as permitted sender) smtp.mailfrom=bram.hooimeijer@prodrive-technologies.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=prodrive-technologies.com
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2095.outbound.protection.outlook.com. [40.107.21.95])
        by gmr-mx.google.com with ESMTPS id k6si1067988wrm.2.2021.04.19.05.17.11
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Apr 2021 05:17:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com designates 40.107.21.95 as permitted sender) client-ip=40.107.21.95;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dFfIneAHif0lDtqGkbb6pDdCcyXrt08HjlYsRjIJeuRPDdvgEIzJhNgcIiox83pwMgedsXzLQygn/eiTkNKKSK42LhBi6aE3CvFr9i7tTl5rg2Gn7ewZ3M6Ebt/NkMNLWJClrwzPtOnyLKVphVvPFFPEj06qLWwxFjDP7kh4cLb91B/2hTJtXy1D0c75ONfP40VZwJeD8GB4FiDEEsSc772vS28JYGsQOe4NWGuU5HtMNe/Fek0vtPejfiKZXI9ZMaF1NyCQ3SquQyOWfgNI5bhfckiFPuon1woINxbg+M4nQ4oVlLQ+yeUig2XB8LKUuDoSn8dmsx5FPqW9jDX79A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3LDcwmsIbk0hH1hXJDqNCq159Dw1Hp3RgsuNbxi6q0Q=;
 b=gOj2MTmUgPcQ7fS3zthitWOkjsb/0UOdhYXTL3VKdhmJitEpukejHfaScAJehFbHEXnuDOzuqV0arICa07erUNSJfqRVTt5vEekAolwOwGwZrmp/KbCYXeeMpfQodw/+ja3/lw5CtCG/KDFDHNfeYkhqVWpD3GEq306kK1+YeFjTnKLtfkMxhUvgOqcUgK2oihZP/o5xSoV/8tSfRIGLPVXL0kSZerHSK71RZEFPnI/y1tTF9l2LovtcCMGahuSbhoS1Id3Zjn0pmCEgorjDWTTTTpnTFWWt0SDZPu/NDfC+Nw8fJbjPpyTGEVJ0L6eD4oyt3VPqcHgQYrK0ET4qaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prodrive-technologies.com; dmarc=pass action=none
 header.from=prodrive-technologies.com; dkim=pass
 header.d=prodrive-technologies.com; arc=none
Received: from AS8PR02MB6663.eurprd02.prod.outlook.com (2603:10a6:20b:257::14)
 by AS8PR02MB6968.eurprd02.prod.outlook.com (2603:10a6:20b:2b6::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Mon, 19 Apr
 2021 12:17:11 +0000
Received: from AS8PR02MB6663.eurprd02.prod.outlook.com
 ([fe80::69b5:15e2:476c:e151]) by AS8PR02MB6663.eurprd02.prod.outlook.com
 ([fe80::69b5:15e2:476c:e151%3]) with mapi id 15.20.4042.024; Mon, 19 Apr 2021
 12:17:11 +0000
From: Bram Hooimeijer <bram.hooimeijer@prodrive-technologies.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
CC: Jan Kiszka <jan.kiszka@siemens.com>
Subject: [PATCH 0/1] Fix memory mapping x86
Thread-Topic: [PATCH 0/1] Fix memory mapping x86
Thread-Index: Adc1FW6fHn/FBFZSS92Xu+SKtPNN1A==
Date: Mon, 19 Apr 2021 12:17:11 +0000
Message-ID: <AS8PR02MB6663A9CC53D81FE82365EEEFB6499@AS8PR02MB6663.eurprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [213.127.64.7]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 56213bfc-f95c-4813-ecd3-08d9032d0f12
x-ms-traffictypediagnostic: AS8PR02MB6968:
x-microsoft-antispam-prvs: <AS8PR02MB6968E8C641D8C39C29EE494DB6499@AS8PR02MB6968.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1MWwDssoA6NNyE39AOBFvGL5Zlk7jL5/6/9DjiYKxw82mjHgaHADSwCKArFbv6B7USLRPY3hpX/suv3TfHmnSvRocMrzCzQOvAFMi8fw3cqlxpQF5aD5DB+kdOmWtwpHFR1DUpnTuNpDLKBXq2fKqEBLZAi6FI8JNcpY7j2bCbbYLkY40nFd/6eqR3agnHIYvdhyrGlKsRBf+XEVw99+DC/SWm9Vp7kAOokX7MfAbQObX7KNiItbnQwkQh5FnyKH7DlnJpAUhAJ/TjQyVSYVjcaiKvcs4t71awBjAGNYpqcyuOEZgQdaPhchUrxsfiOImUCQBkxFz3JoA1lJDT465oLmVU+4sN4xsikQH84DJ+a5Ve/IA13FbFIrConEU+wmexzY17VUv8WEqOgBH+8ndA1Wld5sUF4+TMVw3PlXXVAn+p0PoYedRm0DsWOs7mb38fdcq+HiWIKBP4LptMhgJzLquy62z9V1PsLBNUNi4g4WiR9kSVtAtV/JhMix9M6SEC6uCo70NWSadFEbuVxCY5+WHAq/MmR9gK+DedqgiAs5EtS+c7azRV8ZjCjRmPjsM7Zw8W8ZYsTBQs2ilxvowhi88IB8aIYSd0jsRUqzn7w=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR02MB6663.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(136003)(396003)(376002)(39850400004)(55016002)(6506007)(4326008)(86362001)(38100700002)(316002)(66946007)(71200400001)(52536014)(2906002)(4744005)(76116006)(7696005)(66476007)(33656002)(44832011)(5660300002)(83380400001)(66556008)(9686003)(8676002)(8936002)(122000001)(186003)(66446008)(64756008)(6916009)(26005)(478600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?U9/COIPWfqEfRm6/HscKHOOEUJmj5Owyl5ZiPNb1h/JE//3gl5APxL8JBFzx?=
 =?us-ascii?Q?QQC9UbwZZgQFJS2MBcPW2csEoOotIqC7vej7+I/klkSd6CKYDPaxIEZOwmHd?=
 =?us-ascii?Q?RVCBeHE6ykh4LBDaUihC1SwPBhIj2IoeGw1OuREj5o/KQ6sqhdHj7kIV+E5v?=
 =?us-ascii?Q?V3K+KpdasDVbgMXlivHbAGWrB/s7xGQZ6bXu3lGHjnbAKRq2sDE+Rn0O2OV+?=
 =?us-ascii?Q?vmJzt6CQQLY7xxKU1TbHM2VIZZ1eCax54BZ0A3NzKaOAU2cXhKo28+sjnCPV?=
 =?us-ascii?Q?6b76L5w/8s9D31vNDh24knaF4aVdnjysRWYOTmnZkuHYpNJ2q7UufZa0ZIVU?=
 =?us-ascii?Q?KiCNeXlEwIkLrfgCygU7e3N7yRJc/xyL7FOGuGbLpem2mG9lCHVdlPRLK/Lb?=
 =?us-ascii?Q?IqSTE27AqX2Ri2G+B8HUo+F17Y24kKeS0HZ5wfeMaanzwhu6Z2rjvyOgNyAm?=
 =?us-ascii?Q?uTnLuAq0dG9hky9miCH+n4io1+QJm8fWfuER+zUDKvxd3EMXe53otsi/xl43?=
 =?us-ascii?Q?7A6p1nftmmrPKah/GoZCp1xtdPOU8iIJQIrAX+Lr+aQyF208uu4vNauw6ivJ?=
 =?us-ascii?Q?i1pmQBJIkFMExAUQ8Jg5PqG6Imt4U1GpKe9YFvRC6Nek7pNXRXgiikwR7VAC?=
 =?us-ascii?Q?VDzOVx74Ss2pXBlUjh1JIXcrEUxg1r2E/+gx8gr8V1ThnCwuG3LlZiU55AQ6?=
 =?us-ascii?Q?3xfImQTPbtJrjipmdpQwCkCw2IW/8d68WtKOkonXyOKyn3k5GSMbqPA9Mnik?=
 =?us-ascii?Q?V13VPE7O1VFvkpqU0oIYOrIJkP7Ci+JKcMLS2rzqUbhcZ6Iea2Wc+IRnZl/q?=
 =?us-ascii?Q?/TBxKhckZ1eAeLcpz1HdZOUkN6jJhMFzScg87N/ygg3Tjpc5oNj7Jvsg+g/y?=
 =?us-ascii?Q?RYVm/LIHkhQxsD1RM4TLXDe3BDtrMnuGXPHpvSMQQ+SfaVM305Ryf4TOdus7?=
 =?us-ascii?Q?YeWj0p+ojgbqe7h8jGk0NOTmBk5WaEenGac3xBAQOk4qhLVJytXlW+Q2LqZY?=
 =?us-ascii?Q?4O3SY71LisP+UrcRTDGqp8QYwKVlYa+h0B1WjOVhibJxzaZqCFDRGEoXRo02?=
 =?us-ascii?Q?5YchzO0BaB7HsCnFDMu5ywks57+BrgVKyLoV5UkcwmqqDpSMCvBDJkMjQvRJ?=
 =?us-ascii?Q?OAwW1Mbx/67HS2LUBXDneLmz680uUY4gJoyOxOOtO4qpgOkQ3t0wrLNXeqrJ?=
 =?us-ascii?Q?EY4KBR5ktoPMUAfyAl2IO6A5ZvtksMm8lEadcsgGL/5E7o1xyEAEZY00czek?=
 =?us-ascii?Q?83wqAXMhoSYgm2p5CxIHL1Y0rguDnuQ82db2AK9NluJAMFlu4jwJslYi0loi?=
 =?us-ascii?Q?nRM=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: prodrive-technologies.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR02MB6663.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56213bfc-f95c-4813-ecd3-08d9032d0f12
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2021 12:17:11.0507
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 612607c9-5af7-4e7f-8976-faf1ae77be60
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nGowUrkXaInKnxfrrQVXkyHw3mZRCbBbb3wFyrrDN6GUfhG41sV3J/wQ1CucurUV7/tftzcIEFpVE7SFzFZi+gUEGUHrqiv6b0V5G5u7FLRfL9gMCV6MjMS6WYQNuR1qnjpTNWHKciR8zTZcdI9L6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB6968
X-Original-Sender: bram.hooimeijer@prodrive-technologies.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@prodrive-technologies.com header.s=selector1 header.b=O6o5Tnou;
       arc=pass (i=1 spf=pass spfdomain=prodrive-technologies.com dkim=pass
 dkdomain=prodrive-technologies.com dmarc=pass fromdomain=prodrive-technologies.com);
       spf=pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com
 designates 40.107.21.95 as permitted sender) smtp.mailfrom=bram.hooimeijer@prodrive-technologies.com;
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

Dear Jan, dear Jailhouse community,

A small patch to ensure newly allocated page tables are zeroed upon creation. 
Jan, apologies for not using the mailing list first time round, and thanks for your quick reply on my inquiries. 

Best, Bram

Bram Hooimeijer (1):
  x86/mem.c: Fix allocation bug

 inmates/lib/x86/mem.c | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.25.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/AS8PR02MB6663A9CC53D81FE82365EEEFB6499%40AS8PR02MB6663.eurprd02.prod.outlook.com.
