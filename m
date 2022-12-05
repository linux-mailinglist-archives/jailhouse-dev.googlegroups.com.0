Return-Path: <jailhouse-dev+bncBAABBAWJW6OAMGQEHZMPLKQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13e.google.com (mail-lf1-x13e.google.com [IPv6:2a00:1450:4864:20::13e])
	by mail.lfdr.de (Postfix) with ESMTPS id 079CE642886
	for <lists+jailhouse-dev@lfdr.de>; Mon,  5 Dec 2022 13:31:00 +0100 (CET)
Received: by mail-lf1-x13e.google.com with SMTP id w14-20020a19490e000000b004b12aab341csf4797090lfa.11
        for <lists+jailhouse-dev@lfdr.de>; Mon, 05 Dec 2022 04:31:00 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1670243459; cv=pass;
        d=google.com; s=arc-20160816;
        b=zY4BmxhTh+fgxegOJsiTqd/AiMO9l9ICQmmekr2tdW9Lb4aiao6JGMjsWPoH+AIbON
         1ZhQ1fY5ZbxTcft93SyKQxWo7plBnXwZDHP4JBfV21LZYCRAZEYKMvwITMCALu01KG7Y
         ecOWV4+ztykyZEkMZPwTxdJHfzfRqomxGFzWr2Jsc9XlA1+BKyCQhgwH2EwoMvp5jPNm
         RTnD6MukUxaDNHZDZTnaBHO8jiZP6TG9yzAwckOg182arvROmjSySSmFC8+OW24txQ2K
         bSCKDXupEatiP13aAiBcnHBtN3mhTBzjxv7D0X9w4qId6pwJGsjC5TgTKgb7gSWpqC4+
         q3zg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:msip_labels
         :content-language:accept-language:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:sender:dkim-signature;
        bh=OFzVWep23nRgqGGzXB4udiFnG0H0Xu5wG5iD86ZN/yY=;
        b=d6F9nFmzNZoWltNCM3JhIou1bhGLb61pRzBQmODt5WRPKMJ9bgKSLIOEWQXsK5BhTd
         GoWKtSKWpsVzwqTRifkzia+v1wVnTNggMkza1w0GSGN9Twx3BvuU2faLD0Oxdg/4rgbI
         3IjM3kRjcYAa4YdDWPoSTy3s1+i8CdiNiBgv+SP+d/eRDp9T6FGqMeXzpSmIH4M1HiWa
         L7suykyYzefUJPZMVnwi2xaZ9LY4c1zTjHSmCQLkof2RvSRXrZIUwDEah8yBy0PTDpJO
         8tDN7Jv5qMCN3Q9oI6Eq+FdmaMNxQgRF338YlpItaNvFuJac4JLfslC4ZLbVs+97xJX5
         rRLw==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@ed.ac.uk header.s=selector1 header.b=c3kXlqcR;
       arc=pass (i=1 spf=pass spfdomain=ed.ac.uk dkim=pass dkdomain=ed.ac.uk dmarc=pass fromdomain=ed.ac.uk);
       spf=pass (google.com: domain of karim.manaouil@ed.ac.uk designates 129.215.17.202 as permitted sender) smtp.mailfrom=Karim.Manaouil@ed.ac.uk;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ed.ac.uk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:msip_labels:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :cc:to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=OFzVWep23nRgqGGzXB4udiFnG0H0Xu5wG5iD86ZN/yY=;
        b=pg9qPmu57SYo62ZlKe0DRm/7CMQsaFr/iy5GlNZ7E92oiYBOSbJLcgyItOeUXWGkkA
         T9oLueQ5R519qPY21wFvT0HzLkjkWWQjWAVgYErmuHtU4LgxcLHlKhmvXbJdw0omLqto
         bSoDytlnsMC26ZIdeosDUYXnRrveuuDg7XpVhB9dYorq69+omoho0pz7Apfn2N1TR51C
         mrMINrFvajoX7/VSxe7dLE663cUKtT+qZHfh4g1TUtL55TImjgM5Lnb9ueawh56+/lTD
         weXiGUMZArgw6acDlKbF+hlvVS4mqzvcB6t2jIqzYToN0eqrYiJlWX7O7AntYA9eBpUQ
         O2yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :msip_labels:content-language:accept-language:message-id:date
         :thread-index:thread-topic:subject:cc:to:from:x-gm-message-state
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=OFzVWep23nRgqGGzXB4udiFnG0H0Xu5wG5iD86ZN/yY=;
        b=gU6dDXbgGZrry0X+SWoT29rLK8xCDLsrMXBSJ5dsNdWH7OMFX/Y8ayCO+vLKbc2KK1
         EkPg4c4B/TxlBW19T/cAxUIQnXyahLd8w/BIoMAMXl8bHN146taF9zHH6T6DD+3La33E
         Gn6Vo2kYVpk9K67cBkfLIuYA3ANp9P7Csd+AJ/pEOXkMcs+hdAXMZly7EoV5T88GZpD8
         TRSEU82A3liL5+ym63a1UAuqA7lOJgHeEj7dQ5VIhmx/6rRwGvcrGNYiGlWQQR+C/I1k
         z7sz3UFwYOHCQ4uffUdf4cewIFupRiDRcSWR67z+mKtj8aAY6p9A/WsA2QPfy4wL3mo2
         CaXA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANoB5plDBrWwPw/f7rc7sqh2zrByVzYOMZXu4wkNFJRKUs0qPp6pPUVI
	gI/LjU/whNKnz1RPLe4LyA8=
X-Google-Smtp-Source: AA0mqf7/sFUze36MJ932n9+HcDaLBC5c36zTFP8MfVQsnok3Jo/CoK0dFJg83AH/HyryXJYgrVJB4A==
X-Received: by 2002:ac2:488e:0:b0:4b4:cf32:e105 with SMTP id x14-20020ac2488e000000b004b4cf32e105mr26328933lfc.110.1670243459430;
        Mon, 05 Dec 2022 04:30:59 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9b84:0:b0:26b:ff81:b7cb with SMTP id z4-20020a2e9b84000000b0026bff81b7cbls898105lji.6.-pod-prod-gmail;
 Mon, 05 Dec 2022 04:30:57 -0800 (PST)
X-Received: by 2002:a05:651c:198f:b0:277:6a5:109b with SMTP id bx15-20020a05651c198f00b0027706a5109bmr22070439ljb.42.1670243457740;
        Mon, 05 Dec 2022 04:30:57 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1670243457; cv=pass;
        d=google.com; s=arc-20160816;
        b=EFbje7pjBseCh88eP1mae20QN5jasc9lqup8KvZWL6moYlqvV4X1uLtKRTUza+iKZ7
         hSL7ABm7T9YN2tRvOT5Jf2VUMJFO4h7TAMX7EBArB1/vM5ZdtoO42EYq2CHPGAdm4PL+
         ZuFSwR7p+Mn66My8S+ldFe2LmZ/XHA+lIRcHWsfYBv6POqnU+3UgcwBQ4iHox9+Se2wU
         BHGGI/o7rcT299f2FzMhpJHNf6KROzwkYToo3B9mfeAF3nybonTTleFu2pCEWDjBP3E6
         BvuB5D8tB9aWgrBFfIP9xF+gY1YKVK7Zvz7JXVDfITR4aRP1fQ6phQja3hJvW5EAmUEp
         g5zQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:msip_labels:content-language:accept-language
         :message-id:date:thread-index:thread-topic:subject:cc:to:from
         :dkim-signature;
        bh=Aw2ceMXSRWe7uY1d8c0wXfS+h0aeA0r2FVMtifqIo40=;
        b=jXTQ0jZhTMfUwA70tGgUqsN1AAsnLKuTT9nPh1dc7aBaW/6fOU77upyIgkrc4PPhAb
         PTV2RILlLkUJxidO6AgTaLkWfkqHag0YfpgHtGVWXkr+bv8KrhXSkf9gJE8Qi9TDGiv6
         7T3VMvz5OpWtt+FIH1pQLtvqI26iEMY+MAJkE3Cvtkr4Zty+Q21nBjG5fVtkSkLVsCQl
         DLhHD+Fyp3ReIDmpAtLGOcrWay7l7PQGX7/mr4fk26Oq0hqma04A8Qodx/YmzKPj2J7b
         UzToyBxDbAm88vfZQmIJi6ip14uKfjxIOIdPQ1pYxnteqq3jZQUXQEPrtvcHo2jkdcDq
         NB4w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ed.ac.uk header.s=selector1 header.b=c3kXlqcR;
       arc=pass (i=1 spf=pass spfdomain=ed.ac.uk dkim=pass dkdomain=ed.ac.uk dmarc=pass fromdomain=ed.ac.uk);
       spf=pass (google.com: domain of karim.manaouil@ed.ac.uk designates 129.215.17.202 as permitted sender) smtp.mailfrom=Karim.Manaouil@ed.ac.uk;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ed.ac.uk
Received: from seine.is.ed.ac.uk (seine.is.ed.ac.uk. [129.215.17.202])
        by gmr-mx.google.com with ESMTPS id h21-20020a2ea495000000b002797e79499csi627017lji.8.2022.12.05.04.30.57
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Dec 2022 04:30:57 -0800 (PST)
Received-SPF: pass (google.com: domain of karim.manaouil@ed.ac.uk designates 129.215.17.202 as permitted sender) client-ip=129.215.17.202;
Received: from exseed.ed.ac.uk (hbdat3.is.ed.ac.uk [129.215.235.38])
	by seine.is.ed.ac.uk (8.14.7/8.14.7) with ESMTP id 2B5CUlOS014900
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 5 Dec 2022 12:30:56 GMT
Received: from hbdat3.is.ed.ac.uk (129.215.235.38) by hbdat3.is.ed.ac.uk
 (129.215.235.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Mon, 5 Dec
 2022 12:30:52 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (104.47.18.108)
 by hbdat3.is.ed.ac.uk (129.215.235.38) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 5 Dec 2022 12:30:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gi95ge5gL7PZq4NuIC/OBb5MYiYH+OmbOJs79tWSpMu1P6TD2uDRO2ABpyURo3gXU7Uh6tOzjtC16F9k6n98Umf3/a1CSukEySryTSiOqxY5ypDVZvTp5V7/p42gy3Ef3V5WDi5+Ofikw/Bwf6vm0dJ7CKSZcmXisFhbDlcmYTXNC3TOvGA4G0cBB1V7+VcliKpuuSy7z31jxw8PFU8WIAwqXJkxaKDwh9lc02XcIS0c7w0PBL7lBPYh8/+NfmPBVmBfUtX3Ow/OQWILEnZeKDow0qzZbsvm1eMNSuvF+efcF3jriIHlwM6Tz8tDIg6+bSVGVDyEFmhKyxn3ZtIs9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Aw2ceMXSRWe7uY1d8c0wXfS+h0aeA0r2FVMtifqIo40=;
 b=ezEuxc+F+HdVIDdrSe4pijG3w609D8CSiBLaYMajsleiVmEs86yf67bfDM031H9vcw5hQBAJSFGJByH4NAFwQqwGU5ZEsO4Bf7/wYbjm9gAZUExGYYj0FANSL3fN3o6QLQtZP/vKvqseGRAmcgNT768nb1o5KjyRYB6ozrPbpb7hG+W93Iu5hqCwAvdgWUgmM2O2btWixFKm2GIbRUGWQagL/MI7voCOQaQtzVwFXXF54XfnVp4nE0BmVFiUCOqqJKL3t69+LcwJ070ZIvEF94p2GnhW3ibqHw4ZxO3DB0mdzshKcjTxBMLSfbbRAQFOn7wG+aPUTZXWLoeECLnTNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ed.ac.uk; dmarc=pass action=none header.from=ed.ac.uk;
 dkim=pass header.d=ed.ac.uk; arc=none
Received: from AM0PR05MB6018.eurprd05.prod.outlook.com (2603:10a6:208:12b::26)
 by PA4PR05MB9426.eurprd05.prod.outlook.com (2603:10a6:102:27d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.11; Mon, 5 Dec
 2022 12:30:37 +0000
Received: from AM0PR05MB6018.eurprd05.prod.outlook.com
 ([fe80::960e:4fc1:3ee:db81]) by AM0PR05MB6018.eurprd05.prod.outlook.com
 ([fe80::960e:4fc1:3ee:db81%4]) with mapi id 15.20.5880.014; Mon, 5 Dec 2022
 12:30:37 +0000
From: Karim Manaouil <Karim.Manaouil@ed.ac.uk>
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
CC: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>,
        "Henning Schild" <henning.schild@siemens.com>
Subject: Jailhouse: unhandled APIC access when booting a Linux guest
Thread-Topic: Jailhouse: unhandled APIC access when booting a Linux guest
Thread-Index: AQHZCKLmHqaCkuXHN02aIr7wQ3HbOQ==
Date: Mon, 5 Dec 2022 12:30:37 +0000
Message-ID: <AM0PR05MB601814D935B73250E59EA696A9189@AM0PR05MB6018.eurprd05.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR05MB6018:EE_|PA4PR05MB9426:EE_
x-ms-office365-filtering-correlation-id: 7e04524c-2470-4e8e-a21b-08dad6bc83ae
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0vlQfleWUGma/cvQcK9vmi+Fg8z3m8Sml7mmnlsvMgoT/2TOCQloK8mP30iC5hnv2JR6d/irRdKPcjJXOHVBMxhdAxPHPMgaE02N3vBMYCEOQNyKL2ArvS+5sbL5/da4O+u4XiZ97Db45C7f5suO3HMvv5vgCTpShnV3wyMNhs9dYDopNl0jWa9t6bbJrV0tiQ2XtMvhtmUTxvX+m9fJvdDVIgvU6cLxyxma4nZuP7IZyM5CFxv3pBGTS+ZBENXHgo40NGF5PoIL87eMyoypYdAdm6XC5g9bHXeM5WLehVIq2PeP539gRptTez6vXHuUKOLFcsyWKYSaap9NAIKB4g1qSSRt3SWUKxsNPCF3uHg/27fH5UI++DyNOAtGby97e+JeoBbCptnxeM+LRXTDoAeltwIvz49NI7R+gAK1JLSPkaTDW1an3IDj1iZRkPRxifkYBvRXT4WxNl6dR3XywtAakkubtcQ+K1zhp7vcV3se9YUk5dmGH+HGhKYoG2iGuxykedOqfhdG8Mv1Ze+CkDTuutSZnHNg0w0AGBnaCilAv3Y8TCqOY+Z0FLUz8jgQKsM2CrRSP8zmgSjpq0YmSxuQXch30QTtZC8OLaxhRvg3mLDfcGlpCe9Z7aBMeGf/ARbVpJIo/tVSbwPfgmmNszuD6qf6G36fT+M7FwQxMgei60ifXM8LA+Bvzm+NjsATGiVMciPLnXD8A4WBXrUtgw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR05MB6018.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(366004)(346002)(39860400002)(136003)(396003)(451199015)(41320700001)(786003)(71200400001)(316002)(83380400001)(186003)(6916009)(26005)(54906003)(9686003)(6506007)(7696005)(66574015)(86362001)(2906002)(55016003)(33656002)(66556008)(122000001)(8676002)(66476007)(64756008)(38100700002)(4326008)(66946007)(76116006)(66446008)(19627405001)(91956017)(478600001)(38070700005)(52536014)(5660300002)(8936002)(41300700001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?JBfUKxBjB10DJERUPtBuyFWyEgg7RaKmt4Fx1GClXQ28HersQFzpaYkZ1J?=
 =?iso-8859-1?Q?nXVnQMeaviyCUL6NjpTYeV9AkIZzTmD+KyTBn7A2kS2ZxfJ7HnddlubNuI?=
 =?iso-8859-1?Q?gj8jd0/RaJ87qBzat8XxvGVVAava+j2mqh5coWApCaRqU8qqqJ/Zb6Kiq/?=
 =?iso-8859-1?Q?rlV5lQB+0ywR7MxgjkNqOj9TJHwq1pQaa36WjDpl2CF/fFyg60DjErVe3P?=
 =?iso-8859-1?Q?j9mdrloKQNCz9O7MnSMyGlcLUREpbTGJ3HurISDMgf8f+w9Ds80PvqXnMb?=
 =?iso-8859-1?Q?BbmR6gK4yzQlWXZZ/cicAtUPNuk01w3ZnfMYjSa2NRXqS6PlMGhcENixUV?=
 =?iso-8859-1?Q?n+OVPP6Bu/xPq4Z/d4J4HOS4eBC78dj/oyVcca18BXNSYa7cmhuwUy/eIU?=
 =?iso-8859-1?Q?vr+fGeVPTfTJ0Bteloow+PmXqC1Ytr6HYx+MBvkZgqAxKU3efTBnZahzFq?=
 =?iso-8859-1?Q?aJeWGevJJTGxJYi5XjeojJ/lO/2N31CvuSww83U3vO7E08oG3wgS3QzbS0?=
 =?iso-8859-1?Q?MDiQ4jTm4F0eHohI8rVj9IqahcTTd9qZxIUg8Op3WlDQACU9at1fXNsPI+?=
 =?iso-8859-1?Q?bd9W30A1mZ7BTCgZfb0/ym2f49OrOYcSPaVswSwN0lWQXZL8wCDFvO50UC?=
 =?iso-8859-1?Q?MP7cHFzBUoRGQHK86te3xWc10lGWjXtqwXjPVzFs2TT8fQbfiOrRMr2mLl?=
 =?iso-8859-1?Q?Gr7/YMZQZXiSyUi20QgSxysl/ubGwqTjsXnFZPrjQCCfKFRxZwjY/vGc/U?=
 =?iso-8859-1?Q?QlQWiFl8hHqchwd9+sRKJJLttp0yBbIG7FfPIeIOnG0uQ6ago+jnoL/Hbv?=
 =?iso-8859-1?Q?VFwWKYfd4PdNTGWfLdiu94VhqA5CQS0W0iRE+zHspc9crqtwrcyQ0R9aT8?=
 =?iso-8859-1?Q?h/R472ImRlXB0T3uOw8xtGt/HmaNqM335nzkfwD2nBIqn1MzofE1dP5mCh?=
 =?iso-8859-1?Q?P1XEECDD1HNcNTgT5zmiHhZ64N6h4LiKEntXL7UR+Gvx98EkrXq2ohrcLY?=
 =?iso-8859-1?Q?IlwXR05wMDnCpoev871l37Ym1fNXoKAOWV0q8IUeKk4J03hTx+IkDndKuZ?=
 =?iso-8859-1?Q?hOypArNfj5SCs3hyJral2G/oHLV3nYWdcTEDaDTbN03dL8T428lR0YBoWZ?=
 =?iso-8859-1?Q?OCc5T7Bje58MoseYWyqF3pfhoKEs0m+vjCckX13PZxaAejP5GwvF1cjug5?=
 =?iso-8859-1?Q?yu5OE4M4bzE5pAvMljST7SEAkCiiHWbwOmnJiCtCJSfjglH5LSFDnifWv+?=
 =?iso-8859-1?Q?TjCCchBn3rUT/vqPgdxvtKNiFDWNHiu39N9pwdLJWvzeg4t2AXjqHFdt3N?=
 =?iso-8859-1?Q?VKc5TjyqtZbAcnB3zdA/HXm0fFEiFyHRfo/9WRy6qanjNkMrygslt1LsC2?=
 =?iso-8859-1?Q?mree6t9TZ87o0K95nwEO1lA8sn0ecoERtYuqyjS4yXiYJkB09AwgAscwlS?=
 =?iso-8859-1?Q?VkshLxBPqBuucCiSaI+LBhqdrWptrJ+8rKPvp3cCHYG5gFosNJTTWMxEq2?=
 =?iso-8859-1?Q?3r6aa0hnBHlTcXD4EVDZgk66AVHuKPOKUWJhWZIVa+ZUwzEE45YVI4/tpS?=
 =?iso-8859-1?Q?l+ms+pZQM6DW1VDj1U8RYCTxxMxmgTPsiQ3UWda18kxnmwLr+w+BTOpZaY?=
 =?iso-8859-1?Q?DOriRHmZKe6KM=3D?=
Content-Type: multipart/alternative;
	boundary="_000_AM0PR05MB601814D935B73250E59EA696A9189AM0PR05MB6018eurp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR05MB6018.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e04524c-2470-4e8e-a21b-08dad6bc83ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2022 12:30:37.7646
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2e9f06b0-1669-4589-8789-10a06934dc61
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zgXBCs9ghnOTjf8yRG8wbbfFahjWiLxy6BRH4DHD6ofEZW23Qkk+MOtArq9UtH4iXojDR/PONYEZssS4vkMAPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR05MB9426
X-OriginatorOrg: ed.ac.uk
X-Edinburgh-Scanned: at seine.is.ed.ac.uk
X-Original-Sender: karim.manaouil@ed.ac.uk
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ed.ac.uk header.s=selector1 header.b=c3kXlqcR;       arc=pass (i=1
 spf=pass spfdomain=ed.ac.uk dkim=pass dkdomain=ed.ac.uk dmarc=pass
 fromdomain=ed.ac.uk);       spf=pass (google.com: domain of
 karim.manaouil@ed.ac.uk designates 129.215.17.202 as permitted sender)
 smtp.mailfrom=Karim.Manaouil@ed.ac.uk;       dmarc=pass (p=NONE sp=NONE
 dis=NONE) header.from=ed.ac.uk
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

--_000_AM0PR05MB601814D935B73250E59EA696A9189AM0PR05MB6018eurp_
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ralf,

I am trying to boot a Linux guest (based on configs/x86/linux-x86-demo.c).
I tried to debug and solve this issue for a while but no success so far.

The cell is created, and the guest starts booting, but then fails when
initialising the APIC. A write to an APIC register is intercepted by
Jailhouse and it decides that the guest is trying to set an invalid LVT
delivery mode. I checked the x86 documentation, it seems that it
should not be invalid, but I am not knowledgeable enough.

Here is, pasted below, the log output from Jailhouse and the booting guest =
kernel.

PS: I am following the steps in Documentation/non-root-linux.txt and
       using the patched kernel in queues/jailhouse branch.

Cheers
Karim

---
Jailhouse:

Cell "linux-x86-demo" can be loaded
Started cell "linux-x86-demo"
CPU 2 received SIPI, vector 100
CPU 3 received SIPI, vector 100
FATAL: Setting invalid LVT delivery mode (reg 35, value 00000700)
FATAL: Unhandled APIC access, offset 848, is_write: 1
RIP: 0xffffffffaf84fb92 RSP: 0xffffffffb1003e80 FLAGS: 246
RAX: 0xffffffffaf84fb90 RBX: 0x0000000000000180 RCX: 0x0000000000000000
RDX: 0x0000000000000000 RSI: 0x0000000000000700 RDI: 0x0000000000000350
CS: 10 BASE: 0x0000000000000000 AR-BYTES: 29b EFER.LMA 1
CR0: 0x0000000080050033 CR3: 0x000000003ae0c000 CR4: 0x00000000000406b0
EFER: 0x0000000000001d01
Parking CPU 2 (Cell: "linux-x86-demo")
Cell "linux-x86-demo" can be loaded
Closing cell "linux-x86-demo"
Page pool usage after cell destruction: mem 2972/32211, remap 65703/131072
CPU 2 received SIPI, vector 96
CPU 3 received SIPI, vector 96

Linux demo guest (last few lines from kernel boot log on the serial console=
):

init, 1176K bss, 73676K reserved, 0K cma-reserved)
[    2.960440] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D2, N=
odes=3D1
[    3.040332] Dynamic Preempt: voluntary
[    3.083151] rcu: Preemptible hierarchical RCU implementation.
[    3.151749] rcu:     RCU event tracing is enabled.
[    3.205830] rcu:     RCU restricting CPUs from NR_CPUS=3D64 to nr_cpu_id=
s=3D2.
[    3.284872]  Trampoline variant of Tasks RCU enabled.
[    3.345191] rcu: RCU calculated value of scheduler-enlistment delay is 1=
00 jiffies.
[    3.436710] rcu: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_ids=
=3D2
[    3.518471] NR_IRQS: 4352, nr_irqs: 424, preallocated irqs: 0
[    3.585483] rcu: srcu_init: Setting srcu_struct sizes based on contentio=
n.
[    3.667665] Console: colour dummy device 80x25
[    3.720639] Enabling UART0 (port 0x3f8)
[    3.766423] printk: console [ttyS0] enabled
[    3.766423] printk: console [ttyS0] enabled
[    3.866333] printk: bootconsole [earlyser0] disabled
[    3.866333] printk: bootconsole [earlyser0] disabled
[    3.985019] APIC: Switch to symmetric I/O mode setup
[    4.046377] Switched APIC routing to physical flat.


The University of Edinburgh is a charitable body, registered in Scotland, w=
ith registration number SC005336. Is e buidheann carthannais a th' ann an O=
ilthigh Dh=C3=B9n =C3=88ideann, cl=C3=A0raichte an Alba, =C3=A0ireamh cl=C3=
=A0raidh SC005336.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/AM0PR05MB601814D935B73250E59EA696A9189%40AM0PR05MB6018.eurprd=
05.prod.outlook.com.

--_000_AM0PR05MB601814D935B73250E59EA696A9189AM0PR05MB6018eurp_
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">H=
i Ralf,</span><br>
<br>
</div>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">I=
 am trying to boot a Linux guest (based on configs/x86/linux-x86-demo.c).</=
span></div>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">I=
 tried to debug and solve this issue for a while but no success so far.</sp=
an><br>
</div>
<div><br>
</div>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">T=
he cell is created, and the guest starts booting, but then fails when
</span><br>
</div>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">i=
nitialising the APIC. A write to</span>
<span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
an APIC register is intercepted by</span></div>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">J=
ailhouse and it decides that the guest is trying to set an invalid LVT
</span><br>
</div>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">d=
elivery mode. I checked the x86 documentation, it seems that it
</span><br>
</div>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">s=
hould not be invalid, but I am not knowledgeable enough.</span></div>
<div class=3D"elementToProof"><br>
</div>
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Arial, H=
elvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); background-colo=
r: rgb(255, 255, 255);">Here is, pasted below, the log output from Jailhous=
e and the booting guest kernel.</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof ContentPasted3">
PS: I am following the steps in Documentation/non-root-linux.txt and</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof ContentPasted3">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; using the patched kernel in queues/jai=
lhouse branch.<br>
</div>
<div class=3D"_Entity _EType_OWALinkPreview _EId_OWALinkPreview _EReadonly_=
1"></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<br>
Cheers<br>
Karim<br>
<br>
---<br>
</div>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">J=
ailhouse:</span></div>
<div><br>
</div>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">C=
ell &quot;linux-x86-demo&quot; can be loaded &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
</span>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">S=
tarted cell &quot;linux-x86-demo&quot; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
</span></div>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">C=
PU 2 received SIPI, vector 100</span></div>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">C=
PU 3 received SIPI, vector 100</span></div>
</div>
<div>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">F=
ATAL: Setting invalid LVT delivery mode (reg 35, value 00000700) &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp;</span></div>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">F=
ATAL: Unhandled APIC access, offset 848, is_write: 1</span></div>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">R=
IP: 0xffffffffaf84fb92 RSP: 0xffffffffb1003e80 FLAGS: 246</span></div>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">R=
AX: 0xffffffffaf84fb90 RBX: 0x0000000000000180 RCX: 0x0000000000000000</spa=
n></div>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">R=
DX: 0x0000000000000000 RSI: 0x0000000000000700 RDI: 0x0000000000000350</spa=
n></div>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">C=
S: 10 BASE: 0x0000000000000000 AR-BYTES: 29b EFER.LMA 1</span></div>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">C=
R0: 0x0000000080050033 CR3: 0x000000003ae0c000 CR4: 0x00000000000406b0</spa=
n></div>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">E=
FER: 0x0000000000001d01</span></div>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">P=
arking CPU 2 (Cell: &quot;linux-x86-demo&quot;)</span></div>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">C=
ell &quot;linux-x86-demo&quot; can be loaded</span></div>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">C=
losing cell &quot;linux-x86-demo&quot;</span></div>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">P=
age pool usage after cell destruction: mem 2972/32211, remap 65703/131072</=
span></div>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">C=
PU 2 received SIPI, vector 96</span></div>
<span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">CPU 3 =
received SIPI, vector 96</span><br>
</div>
<div><br>
</div>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">L=
inux demo guest (last few lines from kernel boot log on the serial console)=
:</span><br>
<br>
</div>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">i=
nit, 1176K bss, 73676K reserved, 0K cma-reserved)</span>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">[=
 &nbsp; &nbsp;2.960440] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CP=
Us=3D2, Nodes=3D1 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
</span></div>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">[=
 &nbsp; &nbsp;3.040332] Dynamic Preempt: voluntary &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
</span></div>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">[=
 &nbsp; &nbsp;3.083151] rcu: Preemptible hierarchical RCU implementation. &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span></div=
>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">[=
 &nbsp; &nbsp;3.151749] rcu: &nbsp; &nbsp; RCU event tracing is enabled. &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;
</span></div>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">[=
 &nbsp; &nbsp;3.205830] rcu: &nbsp; &nbsp; RCU restricting CPUs from NR_CPU=
S=3D64 to nr_cpu_ids=3D2. &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
</span></div>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">[=
 &nbsp; &nbsp;3.284872] &nbsp;Trampoline variant of Tasks RCU enabled. &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;</span></div>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">[=
 &nbsp; &nbsp;3.345191] rcu: RCU calculated value of scheduler-enlistment d=
elay is 100 jiffies. &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp;</span></div>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">[=
 &nbsp; &nbsp;3.436710] rcu: Adjusting geometry for rcu_fanout_leaf=3D16, n=
r_cpu_ids=3D2 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
</span></div>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">[=
 &nbsp; &nbsp;3.518471] NR_IRQS: 4352, nr_irqs: 424, preallocated irqs: 0 &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span></div=
>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">[=
 &nbsp; &nbsp;3.585483] rcu: srcu_init: Setting srcu_struct sizes based on =
contention. &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;
</span></div>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">[=
 &nbsp; &nbsp;3.667665] Console: colour dummy device 80x25 &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;
</span></div>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">[=
 &nbsp; &nbsp;3.720639] Enabling UART0 (port 0x3f8) &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span></div>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">[=
 &nbsp; &nbsp;3.766423] printk: console [ttyS0] enabled &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span></div>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">[=
 &nbsp; &nbsp;3.766423] printk: console [ttyS0] enabled &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span></div>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">[=
 &nbsp; &nbsp;3.866333] printk: bootconsole [earlyser0] disabled &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;
</span></div>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">[=
 &nbsp; &nbsp;3.866333] printk: bootconsole [earlyser0] disabled &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;
</span></div>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">[=
 &nbsp; &nbsp;3.985019] APIC: Switch to symmetric I/O mode setup &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;
</span></div>
<span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">[ &nbs=
p; &nbsp;4.046377] Switched APIC routing to physical flat.
</span><br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helveti=
ca, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); background-color: rgb=
(255, 255, 255);">
<span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);"><br>
</span></div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helveti=
ca, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); background-color: rgb=
(255, 255, 255);">
<span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);"><br>
</span></div>
The University of Edinburgh is a charitable body, registered in Scotland, w=
ith registration number SC005336. Is e buidheann carthannais a th&#8217; an=
n an Oilthigh Dh=C3=B9n =C3=88ideann, cl=C3=A0raichte an Alba, =C3=A0ireamh=
 cl=C3=A0raidh SC005336.
</body>
</html>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/AM0PR05MB601814D935B73250E59EA696A9189%40AM0PR05MB=
6018.eurprd05.prod.outlook.com?utm_medium=3Demail&utm_source=3Dfooter">http=
s://groups.google.com/d/msgid/jailhouse-dev/AM0PR05MB601814D935B73250E59EA6=
96A9189%40AM0PR05MB6018.eurprd05.prod.outlook.com</a>.<br />

--_000_AM0PR05MB601814D935B73250E59EA696A9189AM0PR05MB6018eurp_--
