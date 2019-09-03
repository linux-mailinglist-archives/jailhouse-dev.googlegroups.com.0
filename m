Return-Path: <jailhouse-dev+bncBAABBOWIXHVQKGQERDHZNRA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33c.google.com (mail-wm1-x33c.google.com [IPv6:2a00:1450:4864:20::33c])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD57A692A
	for <lists+jailhouse-dev@lfdr.de>; Tue,  3 Sep 2019 15:01:46 +0200 (CEST)
Received: by mail-wm1-x33c.google.com with SMTP id v4sf4294813wmh.9
        for <lists+jailhouse-dev@lfdr.de>; Tue, 03 Sep 2019 06:01:46 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1567515706; cv=pass;
        d=google.com; s=arc-20160816;
        b=WlVRjUpOWmIbKi3kiJcgjpcVScq/hk4NkHQWL975bc8CbEGhJjdv//tXNG3H/F4eNd
         eW5fhz/Uxn4qWD/QRJJpcoN6D1MePZxaMQc3McLpw5a1NkTruIHWL7kRCezQNXYbcSuc
         Hm1SAr13tZw6B+XXULxOhCBf2D0kLIsx1QYO70QXrAef5NVz+aqZ9g4pMoUKLWooP9Vm
         fs+4ZO1y4cC0rM+I7BiqMo4XtZKGNw5RBHAtKBAE3IwF13CFT2NLSwoD7DAPzRxkXMsn
         05mZGcPwVvzmHgzNiD1cTl66pHGRDRwlvMZX57tmTv1Me1CyF4NPM39L9Uj/m57ETZ/g
         YRcg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-id
         :content-language:accept-language:in-reply-to:references:message-id
         :date:thread-index:thread-topic:subject:cc:to:from:sender
         :dkim-signature;
        bh=f7wtNDfpFR8d+gNAOW5BUZHDz2MoIDLLuDgu1V24TW0=;
        b=TyI2tsmrxI7Xbi34cBPv5ohfssWeTplHmCqsHlmqOZDR47mGS2ogBfGQr6pqCPRE87
         EJPVUluyJgaRJIRDG9V1XcZYNknY2hImRCnmrfMpmvAMKiL/Ge3gARy4U9OjxvmBXWOX
         02VkSB7aTpj7gJYg5Y0qYEwwEwsviWme1tmS4TV0gbxTNHX1nUXFLTgoizHmmBIp+mHb
         zaiY8mLeoEQm12RsFh+jQloKQsG5c3q8XUg4iotbi6ZZ/7miWP1m7pWCpXiDnFdS+ctG
         9cvEyWbh2/lIxJZevLM2+/3GPGi3Rm4cV0ZNEwD9gwUOVkUWKCAobY68LmK5cDs4ceFI
         OcbQ==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@NETORG5447408.onmicrosoft.com header.s=selector1-NETORG5447408-onmicrosoft-com header.b=O8Li+AUh;
       arc=pass (i=1 spf=pass spfdomain=flightsystems.net dkim=pass dkdomain=flightsystems.net dmarc=pass fromdomain=flightsystems.net);
       spf=pass (google.com: domain of steven.seeger@flightsystems.net designates 40.107.80.130 as permitted sender) smtp.mailfrom=steven.seeger@flightsystems.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language:content-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=f7wtNDfpFR8d+gNAOW5BUZHDz2MoIDLLuDgu1V24TW0=;
        b=oXiJHL+MDAiJISbLYj4Cv2DYS/nixFr9PUtEFt3iazEolFg14frMDIx7WzBHuQHbUp
         KyDvBsbC3K4qrHyI70p9kXNkkQqW/Lzt8Hruz6YfRDDCEwUGqreDL2W8NmtuUM+5KLR3
         xIMJQ1pGv3k0XfJpKcTfdijc7W2MT3z3k+T2fBiNOjL/EpVM1UBG6bK55lTnkNx3aEXv
         E1VHSENzzgUGVQ9+GVHor04/eWV9EkU8KC7sYQzX8GZcg5AHMvcJQkKMfiDJjPF/BSNX
         bB5/Kxutm4bWTjGqL3AsNYFng2618Vk/APmgupm+CGdxnj3HgfRclNNcKPL8irS3NPlt
         ajiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:thread-topic
         :thread-index:date:message-id:references:in-reply-to:accept-language
         :content-language:content-id:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=f7wtNDfpFR8d+gNAOW5BUZHDz2MoIDLLuDgu1V24TW0=;
        b=tgOBvb4049FH5yClhciZpYysBnYpd/d9Hm2C6AaQksE+vnXugBh2ksP9jn+66v/LFt
         WF5NqjvVf0UiubCYVEShjoj1c3743yHFbHg8fkUnfA0uyWGFoh4VT+3Qr+2wJZS2U6xy
         +GlbN1R7BJkH+GVXuci49A06Op9ybXvP2p0qJic0gj0hf/naIoTX9rf8umEExKJHobbq
         fCNkgQ1kFBejoq4iN4SuAVZH6SiIJXMiCzBHNbHrvBaE8q4sYTXoy82DSaO4ZbJWPOvF
         f1ZJa/RI+++MdBt5s7w3aLIyguLysYE70KfAWd10glwuphU7+hYqud/jx4C4XtHlfFRv
         deRg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAX/Vdp0bGm2lTU+xCuj/Q7jYmHlbiptO5HkxCwJ/WpFp1r8QzNT
	OSYP+stkQTiUyWlqJnsYpmM=
X-Google-Smtp-Source: APXvYqx6/6grDa/sGFSZIOAbMAQKzX3hkswn0HjcJuyWPVA+b3XQuc6Sh7CIJSoSZY/MOPV6UrYf2A==
X-Received: by 2002:adf:f0c7:: with SMTP id x7mr9858755wro.2.1567515706350;
        Tue, 03 Sep 2019 06:01:46 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:e50e:: with SMTP id j14ls1859113wrm.8.gmail; Tue, 03 Sep
 2019 06:01:46 -0700 (PDT)
X-Received: by 2002:adf:ef44:: with SMTP id c4mr21692845wrp.216.1567515705982;
        Tue, 03 Sep 2019 06:01:45 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1567515705; cv=pass;
        d=google.com; s=arc-20160816;
        b=WhUHoZa1xOiRrHPNzn8qfTClssmWzFIHmZC5sPIh3GJAxA943IolBAprRrxrFDVuPR
         +0HP3jXgu5wtLxm0gVY+j7BIEdGAgDwMyWC/NJmG4mvsG8OACnoIcBIKvcpz6IH7st+p
         DXcNE0WikUyOCAmFw7SOIGv94RZKEms5Pom9xlv5s2zucqBWLNCd1+GdeU7W/qlnzk/t
         Hb6X7MPZd0eYzAuZK1Xaa/MGd/gW38i5Hl5lNwqL3zVBxvbPRdm9Wd/DPhMeqDIqxuGh
         KBQG6eJBJltURC7WN/Mco0HQ/nDAXIzRaXat1E//fQmY+aOO++3GlseQYNAydTI4dFJD
         2oZw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-id:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:dkim-signature;
        bh=gCX4exIwQm6qonGPHakYLlNo1cBWWO9TPiL/ncfq9xE=;
        b=vQbCyQrDIgT5s4T+CvtXbRTJhmirz+MnjiPyqnuw5mRXEQJotxJRxuhw15nbCLT0ge
         8WaxYH420JmovP5H5NefxjI98lpZ5u4nHddb39zCCOYxOZarFOSnJWB8b9WjMTM4uAQJ
         Eg6A+gEPpjue/R7px77CB+ahrPDknnY0xIiLav1XO3+276X6640a81YQ+suBaHuoczy/
         kSMfkSy6Aq91nqhSlo0l5mCEvsb1Bpld1NpP8qvDnFpc4pxc202A2BywG3d0/o9mHFjA
         mxRnwvtoFCn8kK4h3rGjmfM56u1NV9wSxoqZEDQ7IY7Bsn4AMEPMNattV9lwpwegXTfR
         RcaQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@NETORG5447408.onmicrosoft.com header.s=selector1-NETORG5447408-onmicrosoft-com header.b=O8Li+AUh;
       arc=pass (i=1 spf=pass spfdomain=flightsystems.net dkim=pass dkdomain=flightsystems.net dmarc=pass fromdomain=flightsystems.net);
       spf=pass (google.com: domain of steven.seeger@flightsystems.net designates 40.107.80.130 as permitted sender) smtp.mailfrom=steven.seeger@flightsystems.net
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (mail-eopbgr800130.outbound.protection.outlook.com. [40.107.80.130])
        by gmr-mx.google.com with ESMTPS id a14si427137wru.1.2019.09.03.06.01.45
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 03 Sep 2019 06:01:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of steven.seeger@flightsystems.net designates 40.107.80.130 as permitted sender) client-ip=40.107.80.130;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fepcjZySdjXuQJ+Q0C8L9xaextADxnzZiIAEHc+L0V1F0JDni8vcjk9PghwMGSPL8gOrgLsQjg7Ywjw7eOkKp6r8hjhMQGcCe433TM2ZFLUXILkwtAZdUHJEy4st9uajNAz+98AWbQ9GRIB84xpV+ckm/cH8MeAYZKJmLkvH+ps2hbU/q+gVBMslGkaiqyejjePyQx6ugSOjIEX0mmfuojtqWqT/fPtoL/8HGcNCzkjZZ8JFxJfU1Sj/shEkM9Fh9d/CrXNFEyFb9qPRtGgEYegXnq70ZHN3aBuF6tvc47MiU0EVWnr5xaOeYILxs7mPDrCUMhv7bFm45MIxcS6/hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gCX4exIwQm6qonGPHakYLlNo1cBWWO9TPiL/ncfq9xE=;
 b=Hqa7T+064FWTzL7ToLFxSJ0rv3gvFEoUiDy47fEpK+DycF4d2ClwQWz5gBgGe2vWxutEQ4xuavM8QcpLlYIgiggd8eD6Um7tF1eQVRLEM7u97TCAVGEO42SQa3dxSIXCAGU1XDuLoXn3CkARnddNpM9+Wz2z5jG3Ly6mkYUsOCReFpbD5Ktl8wRrsqXUgkpV3knD0zjAPujwP8PjF4Nh4eiwwhk2fL/6ADPEs5S5JPavf4dz0aVcGKGKjjRyzpDiZGJc67zubOSn9sUY02hOXDte8JkB087B+wFcslB245Z/kA9yISJU5BNcZA8UnXy6ghvFdZTllBSQ8CqNe5I7ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=flightsystems.net; dmarc=pass action=none
 header.from=flightsystems.net; dkim=pass header.d=flightsystems.net; arc=none
Received: from DM5PR05MB3626.namprd05.prod.outlook.com (10.174.243.13) by
 DM5PR05MB3081.namprd05.prod.outlook.com (10.173.221.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.13; Tue, 3 Sep 2019 13:01:43 +0000
Received: from DM5PR05MB3626.namprd05.prod.outlook.com
 ([fe80::d92f:c724:288d:c84b]) by DM5PR05MB3626.namprd05.prod.outlook.com
 ([fe80::d92f:c724:288d:c84b%3]) with mapi id 15.20.2241.006; Tue, 3 Sep 2019
 13:01:43 +0000
From: steven.seeger flightsystems.net <steven.seeger@flightsystems.net>
To: Jan Kiszka <jan.kiszka@siemens.com>
CC: Jailhouse <jailhouse-dev@googlegroups.com>
Subject: Re: [PATCH v2] ci: Update build environment to Ubuntu 18.04
Thread-Topic: [PATCH v2] ci: Update build environment to Ubuntu 18.04
Thread-Index: AQHVYWXBijpdj1dt4kaEQiNfw03PUqcYCRQAgAHjoAA=
Date: Tue, 3 Sep 2019 13:01:43 +0000
Message-ID: <52277842.1e8b158zFm@omoikane>
References: <f2377f95-78fc-4c83-0eb0-204babeb51e6@siemens.com>
 <08337573-b545-aff2-315b-174504c4caf2@siemens.com>
 <38ca40f7-fcde-ceaa-1c91-f4b809a9e0a6@siemens.com>
In-Reply-To: <38ca40f7-fcde-ceaa-1c91-f4b809a9e0a6@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BN8PR04CA0017.namprd04.prod.outlook.com
 (2603:10b6:408:70::30) To DM5PR05MB3626.namprd05.prod.outlook.com
 (2603:10b6:4:46::13)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [204.197.155.4]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ee3bcf8b-cbb5-43e9-0247-08d7306edea1
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7027125)(7029214)(7031125)(7023125)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:DM5PR05MB3081;
x-ms-traffictypediagnostic: DM5PR05MB3081:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <DM5PR05MB308107811E900D7A14F7FB24F7B90@DM5PR05MB3081.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 01494FA7F7
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(7916004)(346002)(366004)(396003)(34096005)(376002)(39830400003)(136003)(199004)(189003)(6916009)(14454004)(229853002)(4744005)(99286004)(8676002)(52116002)(3846002)(64756008)(6246003)(486006)(6306002)(9686003)(586005)(498600001)(6512007)(6486002)(26005)(966005)(4326008)(33716001)(25786009)(476003)(11346002)(71200400001)(15650500001)(8936002)(5660300002)(446003)(2906002)(186003)(38610400001)(7736002)(66066001)(6436002)(305945005)(81156014)(81166006)(76176011)(71190400001)(66946007)(386003)(53546011)(256004)(102836004)(6506007)(66556008)(66476007)(86362001)(53936002)(6116002)(66446008);DIR:OUT;SFP:1102;SCL:1;SRVR:DM5PR05MB3081;H:DM5PR05MB3626.namprd05.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: flightsystems.net does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 6pBW+Uc9I8oeScX73qSzjA/4EVhE8zFO+HDtpbY2h2nrm589o15hpcLkbWYnqG9VAuRF5cqeUy72b9SIdtANoXdUSMZZFLyhpmrF3RZye6yyTX3SlxbdjTuQRiZKqD4d2Qulw4vJ2XBeh5c6L9315YCOF4N9MqwZgMBGkaw6/fXf1rW/xGKJ0fXA/G3mU1Das/6bXsRRhUe2E/a9LHhhzdIXjOezjNCJ8rgrsDi3xT1oxuU6cmp9nnrRJorxTqUoMy47Pw4M7x8FqwvIXJuzvIn5svEXn7UNsKN4sLqcdfKRcyHBaHWjndoFZs8Wd1bIqEymdI5ctKZ3p2KG0fDytwlF6idC5MXiUyJAclUwnJhebUwra5il4TEanNF1UYqVIJUQsCdZG4OCKXozgeBkUhGyWYX7gPIhkfUuoHyXw9Y=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="UTF-8"
Content-ID: <6DF025503C5BB7428B5916004836E94A@namprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: flightsystems.net
X-MS-Exchange-CrossTenant-Network-Message-Id: ee3bcf8b-cbb5-43e9-0247-08d7306edea1
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2019 13:01:43.7773
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: cc3d8032-d019-412f-a0a3-ce7bb88962c5
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FodlAeWl+PVIEqSsT57GYpU3y9hxXVmHtGB99mHxu4LdwfCMhR3viVI1Lpt8+SwLCO7Pm7UHYa+QbjASUyih2HIFV0ZuhNhSnsoJGCjS9ag=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR05MB3081
X-Original-Sender: steven.seeger@flightsystems.net
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@NETORG5447408.onmicrosoft.com header.s=selector1-NETORG5447408-onmicrosoft-com
 header.b=O8Li+AUh;       arc=pass (i=1 spf=pass spfdomain=flightsystems.net
 dkim=pass dkdomain=flightsystems.net dmarc=pass fromdomain=flightsystems.net);
       spf=pass (google.com: domain of steven.seeger@flightsystems.net
 designates 40.107.80.130 as permitted sender) smtp.mailfrom=steven.seeger@flightsystems.net
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

On Monday, September 2, 2019 4:10:52 AM EDT Jan Kiszka wrote:
> On 02.09.19 10:09, Jan Kiszka wrote:
> > Steven, any chance we get ppc to a newer gcc? Are the issues
> > 
> > https://travis-ci.com/xenomai-ci/xenomai/jobs/229976797#L786
> > https://travis-ci.com/xenomai-ci/xenomai/jobs/229922504#L3071
> > 
> > fixed in newer 4.14 releases?

Strange. I build with gcc 7.3.0. I was going to try and get to some ppc stuff 
this week. I need to do some updates on the vendor board I have with 4.19 and 
then I will test with xenomai. Hopefully I can get to that later this week.

I have seen the error with missing symbol _restgpr_31_x but it's been so long 
I forget what the resolution was.

Steven



-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/52277842.1e8b158zFm%40omoikane.
