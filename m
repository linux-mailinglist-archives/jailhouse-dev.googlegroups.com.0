Return-Path: <jailhouse-dev+bncBC44VTVY2UERBBUNUODAMGQECUKLAMA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x239.google.com (mail-lj1-x239.google.com [IPv6:2a00:1450:4864:20::239])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9E63A83E8
	for <lists+jailhouse-dev@lfdr.de>; Tue, 15 Jun 2021 17:25:59 +0200 (CEST)
Received: by mail-lj1-x239.google.com with SMTP id h6-20020a2e85c60000b029014fcff4ccdcsf6430980ljj.11
        for <lists+jailhouse-dev@lfdr.de>; Tue, 15 Jun 2021 08:25:59 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1623770759; cv=pass;
        d=google.com; s=arc-20160816;
        b=fs+N4Q3UWjzsuGaJ9WV7E0x/PZVn0ZlBlfKGE+VkiP3zCS2mhXxsi2o33rjFzp9wtu
         NESlvNjZ16z0C+ayv+mRf2/PFRa/hUSw93RszzDER/L+kicaoSaQ9L8g8REVhY7t7tRq
         YapzL4cuurM2zz67KtC+VWQg4a+mqpsamY052G2l0Zyv8N+NOr5m8CKw4FNLqz58HI58
         1NHvZOLUGneWx2aiClxIihhrtIvHJEcrUU51ylQZ99uXK/HVeFgFmhoBzmrYp7IrooAE
         y4egglQdwbFy0WzW+SWOcNymxriNsHVrMHgz/MyFBLPFn4zN09YmCo2Hn9xHVhXIkjYR
         cufg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=pT94NWn8wScVksVOyZMsufvERTjbLUZA8ILP/Cf8YtM=;
        b=uLFfE0ZEBmFMyyXLSxlT8P2IB37X+zum9MOBZxr3XCL4fTlh4g0WKS3CcXuVBvd/eR
         2DEjzn1qZ4l+9ilACqCABm4STjMeSQ4UMonT9T9IRAk6Pd9uLCl3ygwnji4CcDkJvv4l
         NIQCiIU/VWdj/e9f9UNpm11pbbuFxcLFNGhhWFRgNk5i9d2POnSTt76tHszoJiP7WrFy
         RPv8loHlo7uYjUGkF8vySQEEpNS+1adCpdECfoIkWWNL2Ye50YaSI9Ab47wdZrql6VrL
         Ga8tAFutFNfNEa8tV3MvUENKhuR/QTCw3nOGGs7i0mQJnKbSrX4TN6lPktwtyH2KoO4H
         1ElQ==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com header.b=UqAz41wT;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of florian.bezdeka@siemens.com designates 40.107.8.48 as permitted sender) smtp.mailfrom=florian.bezdeka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=pT94NWn8wScVksVOyZMsufvERTjbLUZA8ILP/Cf8YtM=;
        b=X+ifrEgmii4Is2v7mEKRcPK1Kg0DcSSgNuvLS94HBdUN6zALJhIoRzQApB+I372Txs
         SF1JnziVB2ayk7RY+aGr3PRGFgaY5JD4LPchO5kPUotjtICuLfS3W4THN34rww2Etxly
         SUPU7TKJqYiyHUBvGAgSQPye26XgFKUkuAk2Zrck5WX9dOkDqOfxDyokLqJGX/ZlscGV
         7ehUEPgRFer3osRLBUHXerJu2F65yrVaqc4GaLyJsCHqstrd02Jo0RgNeshHw3eeO5d5
         R4qaiSsaujzesKJe3439DsVUsD61DL7oqreG3rxy5C8CBBiLYGskQJULqL2ZQ87QneoF
         KulQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=pT94NWn8wScVksVOyZMsufvERTjbLUZA8ILP/Cf8YtM=;
        b=sSUA3/AOgYxO5nzdshrxmCg2lGR1wk3+9nduVyrpI3kO8f4mT8sKfY8TIuKvi6lcx/
         y49+sC3pdoo4Mpu4RRRMM37/j0TS2TT1xW6P7QGw5fCV1kjqztF4/CbYJDKwq4G4o0nE
         tnZw5xM+xmi5pBx94RN6lUD7WgZFRzSKpRMFkJcksQnq0aV3ZpIhG/ggqlj6I7HJ0ci7
         2HyPuM5gnTVpaMGMJpkWAP6jL+kukMDu1O/TeboeWed8dDHpDI3E7ahNl7gxQ2I+1760
         X4tt3UaFeo7V2Zn+0mwbzf/juuWunDi2KFoNFxgbxSD3sgbAvoM9hiJCmwwkfCweq27D
         9nEw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5335D+zc7eCpNZu1my190bwJyhPf5h+Tlt82cJFCOAnVJfdFZapK
	SfrwlG5utcV6o7uoUcjj/Nc=
X-Google-Smtp-Source: ABdhPJy/Z6Mtq8S2W441+aW3tQYLqNXY993wQVQ1VuWLlAbPXNmYQZaOqOXR5+EliCek+mErvOiunA==
X-Received: by 2002:a05:6512:2349:: with SMTP id p9mr11630523lfu.143.1623770758918;
        Tue, 15 Jun 2021 08:25:58 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:3a86:: with SMTP id q6ls805859lfu.3.gmail; Tue, 15
 Jun 2021 08:25:57 -0700 (PDT)
X-Received: by 2002:a19:783:: with SMTP id 125mr12952317lfh.296.1623770757832;
        Tue, 15 Jun 2021 08:25:57 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1623770757; cv=pass;
        d=google.com; s=arc-20160816;
        b=NPpU1c7Imuhdc54XNgvpiu+Om/KwT5xozTDbQbDg0ao75FsFJbaShhf+1DXo8ztcOr
         kT/WFzPAQKFi4i6s7Joo/Xtt0kBa6ZDIIxelSkwkPJQlu7rctwV3LmXDkplzc+Ht2FnA
         uXNju2/uF5SBG5kHbhQI52P4jFkqA9bvlur/GQJ8rLJxLyUAUuf4UiX5aAUMZF27lmRQ
         QsUK0v6Rue3JrD4e0Dhtg172czCmv7JKiHNK9t6zXFzXXlURz/8rGC4OQBNaJN1F0Tvp
         1jI4DJnhY+V/SMBCEAgPXvSSpFF1pgDYo2uiV3PS5k7dQpiEzmCnwgQjO6zZrEhMyGpo
         y5fw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=R7EhvsmpwlYJsI5xbOtlkG8ThPP1shv8OcM2tgGLfk8=;
        b=Gkjw5/3v3LRMOp5Cerykwi9ci+VG62koBYxeyprdKwOEiGugcTK0eAp6x+kdTd0wTD
         oZuEpbHxdjt7sH/9qOKBtopYF52t7qQKuMwH2qbFkYMyio48lP+3HL724wckLZys+SDE
         ussDY2SxMi5eFljVSCQbep+0Uyiooo/ms6G38nHvpox+CfdKjtqgCT7i2q7jNBQ3i0dy
         ZPYK/hBhxf4KYH60F2Sgig9PornKvFoCCwjyHFV2SGkLfUBP2hq4TRASYTs9zmHssfVA
         sebgYGLy7qpIcjv9UfftKPYLDHSFQCBLICCcIJRzcTQDtp/L11QGofGSC8wLTzZvyTBB
         4nUQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com header.b=UqAz41wT;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of florian.bezdeka@siemens.com designates 40.107.8.48 as permitted sender) smtp.mailfrom=florian.bezdeka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80048.outbound.protection.outlook.com. [40.107.8.48])
        by gmr-mx.google.com with ESMTPS id h22si147839lja.5.2021.06.15.08.25.57
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Jun 2021 08:25:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of florian.bezdeka@siemens.com designates 40.107.8.48 as permitted sender) client-ip=40.107.8.48;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aN6OwefFhhMs4XRukg/pT5LCesi6Gz2H/u57pqN03fnRwbp4C/DZsKszerhipxFPSgiPrkB/a5Xi4lBGYgCLsWCqGCG+8S53T5HZJARKelsZ2thZgxudlfUZpEImCknqhgLdFjTkBJuEpTyAF9vdmpRV/wFLlVlcnEnCmrke5fCuI1I89EpjoLmyG4X/E3ItEIASRurp3MtCoCvcKRRTpwzvpQqNC5luyjd6gB6VOBrVzj17RqHHUFAwDmxfZWuey7oPb5jNCsuvNotHlBLNgs8igs95+OF/1kMh/CJt3i4dP6g63Z0gephTSGRY6myeU+zaHruVK5LSkgp9zzCnKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R7EhvsmpwlYJsI5xbOtlkG8ThPP1shv8OcM2tgGLfk8=;
 b=AnwSr/EhUSJB9GjRZJW9MRCPZ2XQrIAEw/3Qrs/AMfOrgp07agW9lXo8Hv7HYBHvVe3BF5kekL7w6YZ2NirmSFGEOg+HRNXkUq2du1lXxZFEpHnjvWMnBbMoRWsPrNfTWyUltbKzJc2P6Y74K9Qh9Zzc1Anf30p33NuY+H2PL057+gObRJ4p7Mofw6/MyGi3BJnvQBxWCqq/RIKUcCF0HXPJSwjaWA8m6GMR6Xrx+73V9gp36RfTDoHaeNUot/gVIW1kdW4nxqCzqbrYKJh+eVNjOzOvORLAtwl7mBKaJV+GSDDCNS4wPslFoR+N7Sh+QipMh5uBKhlczRI3LuQ25g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
Received: from AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:49::10)
 by AM0PR10MB3699.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:15f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.22; Tue, 15 Jun
 2021 15:25:56 +0000
Received: from AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::bda0:21a9:36c7:c9f6]) by AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::bda0:21a9:36c7:c9f6%7]) with mapi id 15.20.4219.024; Tue, 15 Jun 2021
 15:25:56 +0000
From: Florian Bezdeka <florian.bezdeka@siemens.com>
To: jailhouse-dev@googlegroups.com
Cc: Jan Kiszka <jan.kiszka@siemens.com>,
	Florian Bezdeka <florian.bezdeka@siemens.com>
Subject: [PATCH v3 2/4] tools: Update shebang from python to python3
Date: Tue, 15 Jun 2021 17:25:48 +0200
Message-Id: <20210615152550.356561-3-florian.bezdeka@siemens.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210615152550.356561-1-florian.bezdeka@siemens.com>
References: <20210615152550.356561-1-florian.bezdeka@siemens.com>
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [2a02:810d:82c0:38fc:30d6:ec3a:bc18:37f5]
X-ClientProxiedBy: VI1PR07CA0148.eurprd07.prod.outlook.com
 (2603:10a6:802:16::35) To AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:49::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (2a02:810d:82c0:38fc:30d6:ec3a:bc18:37f5) by VI1PR07CA0148.eurprd07.prod.outlook.com (2603:10a6:802:16::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.9 via Frontend Transport; Tue, 15 Jun 2021 15:25:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 88c58e11-d45a-470c-2a97-08d93011df1b
X-MS-TrafficTypeDiagnostic: AM0PR10MB3699:
X-LD-Processed: 38ae3bcd-9579-4fd4-adda-b42e1495d55a,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR10MB3699DC9DAB2EA86DA5396426F6309@AM0PR10MB3699.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 73qmW0aqejD7HH8rQY1Zc4kRFM53CcspWH1GAtlQbBH3dO2/yhCUUr9zv6rQ8xlUXE2YcdshWX9iDm/AdCnRmEHeVDejXe319oFoDjF7K83FRosEf7xkmSHK42k5Lpyc8jntDG3LMYcdl77UjInIT9B5dAtphbY/xZHeNHXsK5f2q30O9K0MiXJsgAeTb5vguSTTKGZeDtD6G1eCQ6jQ3vBo9r+/G1BKjaENJx/eu0QIIQYRTb3jXk3pZZ9ptaXm86zVpVhg+G5i5U6pxDbH7cakd0+mS+97iw9FbeXroHriUQukXJj0k38fjUqgAYqyw++DeGmy/6Jlv/OG9akmzU8BkKpAbgpzbuewQivJU3QuJ/peDnxV7Yg91tXf4vwa9/USBigEJZ9aaO+8wlbeEbFM4s0c+zWLHtkVLHxZkVnN6GePuv0qPuQvWD3mTythLBpaX9veXbXUdr5XJN8Htbtk6gJsPxHUzfKlhdo2M28i2/qtbCcoTLvCpFRlXEd9xpNXFfOiYpo077Ku+rGP5JkZ3z39X59NFXZkyzun8GUXApWz9Zze4ZORSo1EMd21YdmTpdtSHni3o+t5/faZ2xUB8jXGIwSVf8OWJ4F98lYb/QY5NU6yw3Y56XQoMhgDsPKQ3S4rBRi6lIlmzQhcxLSbuH3+Hi6YTCt3/P0nmT8/kjWebVLlq85u3mxjFCRgDIMPcMuPSIvkOKZeA12cFfxsFPQnN7S2MpsxvtwZfcE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(346002)(136003)(376002)(39860400002)(6486002)(6496006)(83380400001)(54906003)(107886003)(6666004)(966005)(186003)(5660300002)(8676002)(316002)(44832011)(16526019)(36756003)(66946007)(66556008)(66476007)(2616005)(4326008)(38100700002)(2906002)(478600001)(8936002)(6916009)(86362001)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kClYh3hJbahUni0yex/9YmMZ5yTDhuzRCUH4eE56XI7VGx3f3HfulyaYi+d4?=
 =?us-ascii?Q?YealEEvSwb6hoZ36MO9yg84vpLL44L70Ipc74jOt1yZKQ8jd/JmU9rFrbd0w?=
 =?us-ascii?Q?C8q6VP1a1OV/mthdg5f3scDRCUNxpNyaZFsPwXtgCDspCMPyKxNgULdg+3hI?=
 =?us-ascii?Q?sgTMLb7lRFkLvcO/VEjV+skwnPx6gZSbJ+la/1DL8fVKmA+nJIHWSP2Icln2?=
 =?us-ascii?Q?jYIT9AM0rn3OHC/itxso983viC0WjUUQ+n0ulma5aljuiIw2rkPnTGPm/5Yr?=
 =?us-ascii?Q?g+s6jyc/OicCZBCexW/hOtOsJDnlIxeGIpRJIxZSzVpfq0wnr94XMEgo3QcN?=
 =?us-ascii?Q?TFQ13p5hUG2e53zuB2oZk+QVc8s4PTgIK9G0Wn4XsHbCt8VlRo5Vr2SB4Knc?=
 =?us-ascii?Q?ch/ddtpuMS5lmawCW8MbwqcjrMTZ6orEVXNBXbqMCMmlPx6ukp9wtGB9lAFt?=
 =?us-ascii?Q?iQf+8BSszTePbtsZpSXOxnDZgYJa/kOLn5tc9b8Jk/ZdKn8zS+SuZb7BlaRN?=
 =?us-ascii?Q?2XqlFzjNKQdcO3itr5EufTO7Hfqx9+tPcF02k8bnJZeP1q9C47Fh41FSJtAY?=
 =?us-ascii?Q?CXhAG0zu0KbynyTz54/DNpi0i01wCR5qTWADG7fC8pKE/8xlcKz8whJjvwJt?=
 =?us-ascii?Q?1EA7SpaK8bt4XxcfhIsyQbrqNkOQ+n+YYuWDXEHbqLQoF/ShWaxnyQ2G9Cl3?=
 =?us-ascii?Q?a3cCUrqPjdFoBIlSCIB7/Hq6oX0BuAmmD2WRG8gWkJj+5ThOHWXUzW+2GqeC?=
 =?us-ascii?Q?WVqhYMuWm6K6MpcPccI3aW4tHSILg7/WeA4NaQU1XC4kCKH56OM95uM/RK1t?=
 =?us-ascii?Q?3jSeM+Qe9hlHYWQMih+jCKCiqcy9hpmiUjuicQl9vLo3XSFfcnGC71CvUha/?=
 =?us-ascii?Q?4QTrDWh0GHVh8/B5zOWmlYMHcp4ufgiv4NFV1WkJ9AtfjBQTCeZhoxHZ9FCN?=
 =?us-ascii?Q?4XzmbhotOXAKud5Hg5oNUg+PK2s2nEmx0Bh4ZfGKcj3SSOEFiSBLksw3aRZs?=
 =?us-ascii?Q?jgLHSSKR81H+XaYoc1T6iKQ8xv9XfsQppDHTT0AycDHw8R8MwSuu6QFxdI6M?=
 =?us-ascii?Q?gPidchcvQAiJiKuhoFNMIG4ljstRcFe7anlfQB6EhZjCUci4EuCCFlm0FrQ8?=
 =?us-ascii?Q?p3bv6mWqqMsyHJ1mAJB+2xMVs+8LHdsJD0UczkklKgPgFJopu2oUMrDp34c9?=
 =?us-ascii?Q?MxoYsSc12ikadzDskmoLkCBqeHDHz0QWIq1mO0tlDQaGrFCq3lPjDNfhlgcA?=
 =?us-ascii?Q?q1V0tfPdDki7lwnT1139F+ccWiKy0F5Hb3S1fDgox2ZN6oU+1qK0t2d7iKaT?=
 =?us-ascii?Q?GG1jpM6yO+kX8i7o32mxUrYJdOwFCKkvUS3fv1yFygsd6kk/d6xmRwDO5BbE?=
 =?us-ascii?Q?55QjNdkE6BNfBJ6z+XBxU0puHksl?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88c58e11-d45a-470c-2a97-08d93011df1b
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2021 15:25:56.6432
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jqxq16LQ5wI9OQ0pjlq6xld+vbybB6YGQn56gbUFDJn3iAoOAk+T5e6CRRWhdC34/YwuOFIvRQ9tR8p9XHrT0QUExEu7kWEQwVc02r2ERbM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3699
X-Original-Sender: florian.bezdeka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com
 header.b=UqAz41wT;       arc=pass (i=1 spf=pass spfdomain=siemens.com
 dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of florian.bezdeka@siemens.com designates
 40.107.8.48 as permitted sender) smtp.mailfrom=florian.bezdeka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

On Debian 11 systems /usr/bin/python will no longer exist due to the
deprecation of Python 2. According to [1] the unversioned python
packages must not be used as build dependencies, dependencies,
recommendations or suggestions. So moving to the versioned python3 seems
the only remaining option.

[1] https://www.debian.org/doc/packaging-manuals/python-policy/#unversioned-python-commands

Signed-off-by: Florian Bezdeka <florian.bezdeka@siemens.com>
---
 scripts/arm64-parsedump.py     | 2 +-
 tools/jailhouse-cell-linux     | 2 +-
 tools/jailhouse-cell-stats     | 2 +-
 tools/jailhouse-config-check   | 2 +-
 tools/jailhouse-config-create  | 2 +-
 tools/jailhouse-hardware-check | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/scripts/arm64-parsedump.py b/scripts/arm64-parsedump.py
index 9519eb5e..c695706f 100755
--- a/scripts/arm64-parsedump.py
+++ b/scripts/arm64-parsedump.py
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python3
 
 # Jailhouse, a Linux-based partitioning hypervisor
 #
diff --git a/tools/jailhouse-cell-linux b/tools/jailhouse-cell-linux
index 4178d4e0..6d1743f3 100755
--- a/tools/jailhouse-cell-linux
+++ b/tools/jailhouse-cell-linux
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python3
 
 # Jailhouse, a Linux-based partitioning hypervisor
 #
diff --git a/tools/jailhouse-cell-stats b/tools/jailhouse-cell-stats
index 2f7e9661..4c5289fb 100755
--- a/tools/jailhouse-cell-stats
+++ b/tools/jailhouse-cell-stats
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python3
 
 # Jailhouse, a Linux-based partitioning hypervisor
 #
diff --git a/tools/jailhouse-config-check b/tools/jailhouse-config-check
index 5294967e..62db24c3 100755
--- a/tools/jailhouse-config-check
+++ b/tools/jailhouse-config-check
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python3
 #
 # Jailhouse, a Linux-based partitioning hypervisor
 #
diff --git a/tools/jailhouse-config-create b/tools/jailhouse-config-create
index 3005c2e7..2095f4e2 100755
--- a/tools/jailhouse-config-create
+++ b/tools/jailhouse-config-create
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python3
 #
 # Jailhouse, a Linux-based partitioning hypervisor
 #
diff --git a/tools/jailhouse-hardware-check b/tools/jailhouse-hardware-check
index f9b2cf58..7a41b48e 100755
--- a/tools/jailhouse-hardware-check
+++ b/tools/jailhouse-hardware-check
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python3
 
 # Jailhouse, a Linux-based partitioning hypervisor
 #
-- 
2.31.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20210615152550.356561-3-florian.bezdeka%40siemens.com.
