Return-Path: <jailhouse-dev+bncBAABB27M5GNQMGQEYEMSLRA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13a.google.com (mail-lf1-x13a.google.com [IPv6:2a00:1450:4864:20::13a])
	by mail.lfdr.de (Postfix) with ESMTPS id 74EE66315B6
	for <lists+jailhouse-dev@lfdr.de>; Sun, 20 Nov 2022 19:48:13 +0100 (CET)
Received: by mail-lf1-x13a.google.com with SMTP id m25-20020a195219000000b004b40c1d5566sf3522752lfb.4
        for <lists+jailhouse-dev@lfdr.de>; Sun, 20 Nov 2022 10:48:13 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1668970093; cv=pass;
        d=google.com; s=arc-20160816;
        b=Dw6ioQJwWA0gqBwdMvHosILiHDCisp4XvbLyIliAkOwG2goq9pnRqEtInrb182uaJE
         WtjZe9WLLUJZ6v+lmKpQmdO/QFOPib7waQIli4Fce/WYF8fxfPaaOURRH56bdtFVq9gc
         qEHGzvT/zimuiQqW5dkfZNMrJHXxJp1lCFoPwyuez+x77uI2BdSS8ymWCJULNJ3HTjtj
         IYlrHfCwrl2frS2y2gw37QM0GpjNF0b6orkLFOdSeEgRO2RO+Q1lzHDkJgDw/IGTQj38
         ocvH0A2BQxgQ58jIe0O4mmJ1kUpJwbPjJ25iRUNACSh5Gg/oVRPqzj5NSTkUc/hkLbsx
         s4nw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:msip_labels
         :content-language:accept-language:in-reply-to:references:message-id
         :date:thread-index:thread-topic:subject:cc:to:from:sender
         :dkim-signature;
        bh=w4jMO19OQnzQVUaQ0M623zZ3ivdeQnVHzGanq7sLfPo=;
        b=ZVvT7YZc0Lduui2v/LNHQYT5nke5rsZNnnbDbTSyducHSifqwnpeoSU1DIASH6PM2w
         bsWKa3J2fQKW7LPeJZQFUeKblokL1QlsxUoWlQyKLpOsjUYg65tKk4I9hK60MCvHc6RN
         YlVc3tl3RfAa+bYXDK8TQ6vY0RUF8ZHkzi8B3si7jHKRWjKa8Vj8u6jJOaBJYyfgC9vV
         Dq4Zpu+UKkQyrd+m0/iAqJ4wM5009bdnhGT8RQWnRs1HTGKEFgB5pElyP2oosayB0QEQ
         ruIJV5a82v3sAXmRX22MbnTA+lx9QMfylZ5b38FONNpw+u6eJ3WlPvFy4xDZoDhaIsCn
         6Vww==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@ed.ac.uk header.s=selector1 header.b=siS4ta+O;
       arc=pass (i=1 spf=pass spfdomain=ed.ac.uk dkim=pass dkdomain=ed.ac.uk dmarc=pass fromdomain=ed.ac.uk);
       spf=pass (google.com: domain of karim.manaouil@ed.ac.uk designates 129.215.17.202 as permitted sender) smtp.mailfrom=Karim.Manaouil@ed.ac.uk;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ed.ac.uk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:msip_labels:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w4jMO19OQnzQVUaQ0M623zZ3ivdeQnVHzGanq7sLfPo=;
        b=HYbco5TA92inXvIXxZwrLly/gdW9x/+GLLavX1CFLMwwTZa8P3OB2CpdSc8s80dV+x
         ILzaXUHt2WZloFt2QX9tM5wLInpCdAyPCLXqRomuiGBY3AGzr+yt4uCNMzqPZfULSIbs
         Z2GbnDGV8Y9o+j5mCqfrfJ3jPKSbXRCTUQ9piiGamOL2NvVay1p/j6OdAvgL8D6APibi
         Uaqji486p9vvB/MpL90QKVPUIkCDvHduAQM2IQ3yob64kmvalO6YUccs0XKeWBsql1Js
         0cKJaZvuoMrKFfJeNBizKtDQ6FlZNfH2MIUZoQeuW2ms69vxdgaOyZsreIpZLgrzP/sO
         8iVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :msip_labels:content-language:accept-language:in-reply-to:references
         :message-id:date:thread-index:thread-topic:subject:cc:to:from
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w4jMO19OQnzQVUaQ0M623zZ3ivdeQnVHzGanq7sLfPo=;
        b=J+pmyeYwdg9ZeN5/UfazCv7Qcm+4Fg+f2nNi7IygnY4Jy8FN5mf1XiANK6tkKEoRJb
         ZcbtlkMFHffsISCtqwJNfBoSDPJL7XfVchr68NpYekkim1qXFcvR3T7/uH1JUZIVvGw3
         fKO5s3LEvU68EeZMVA0pcIetOewh8KMSzNM3UBR8YsDvd2ZLpf0fv+nSlGnyO+zNpC/B
         xYw7EReBDdHrxSvlwKjtUy/Js1l2J8xgeQ1b+10Vs2r0TBmvyLH0X1ZQDx/rBxZKR1Xu
         9/cM3Q6NgYOLTsYzQEKz/Em1n8Qehmg5TjkmY2WhiG+Rl+pS41OFvV7AgPB34oA+7nq7
         1R5Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANoB5pkglx/+a/kfsCE0wZRUJXSXUMw39fYbkOxwX0ek+nNOxThC6ncQ
	8ic/QEErA666KnWwuUBMdC4=
X-Google-Smtp-Source: AA0mqf7/Z+9yQexo7uEz7l9XBuIeWdAjDykd6g46V1Vj8BAgQCzdVRh4WosVXPu2SQC1T8zmqwrGNw==
X-Received: by 2002:ac2:42cc:0:b0:4a2:d2df:9a7f with SMTP id n12-20020ac242cc000000b004a2d2df9a7fmr5308519lfl.158.1668970092626;
        Sun, 20 Nov 2022 10:48:12 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:214f:b0:4a2:3951:eac8 with SMTP id
 s15-20020a056512214f00b004a23951eac8ls3182708lfr.0.-pod-prod-gmail; Sun, 20
 Nov 2022 10:48:11 -0800 (PST)
X-Received: by 2002:ac2:446b:0:b0:4a2:b56c:388e with SMTP id y11-20020ac2446b000000b004a2b56c388emr4754860lfl.145.1668970090930;
        Sun, 20 Nov 2022 10:48:10 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1668970090; cv=pass;
        d=google.com; s=arc-20160816;
        b=DHU6Rc+s/OIf6xO8ofZTmuJh6FEp0GLwsWg8ixJpYjGl29f0AxwlbU/wgnSk/GgsZN
         999SCfMWt03fY8BO5DzRgGnjcS+yvPUcPAJXHBHIHF7F1cds4wL1SV//V6LRZOJStmVC
         QwaTNmmRyDbP9gbtmBSQlGig/CDdtoO9UwSYAr9VRFtPWdlu9EEFx1peWgwLN/XxhdI5
         cl3Sy4jD6vR1P67PapxtumfLCbPe8m6H7qlh1pKCApEoC6VuRCRgtqQ0WRawfySj7fGt
         8DF0iThPP0onJTFLoG/Pci0BWwxH3QiAnKyWDg91yPjG6oLayO+lC3WatzILE5XgcJVf
         34Cg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:msip_labels:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:cc:to:from:dkim-signature;
        bh=mvAbDZ+5nQro9lC9pSFREYT9tt8vUucyg9Khs+g4474=;
        b=iHmIk5tfZMcFwWBVPAWOmF+5mG4lEc080dDgdWb63wEf7s+wgkl6Dcy91j31lFwG2Z
         9M6vx0UHGkLVWY6HW2J9ZJh4e6kNfneWdXk9+6BNRaPNtVWmy/qi2ChehixeXmbRu0yw
         WOlAmsgCVYcp4OLutho+PrJCbXBosAOcyTIKvMOLJXcDtKzT+NzCBNGziy+wPTBKu+15
         9CRWS7lWXOCGmKnh9OMnOiXHCXYUxF0awhj7qw7Fa/ShTcWdzfiJ0PttJQP9JJdDlNdT
         xdh0eNYGZGjpAmcafrWF2v/F0gWtTlhVhCAPKJgig5Kl3rljQweP5piB4nv599JYB/Oy
         GqhA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ed.ac.uk header.s=selector1 header.b=siS4ta+O;
       arc=pass (i=1 spf=pass spfdomain=ed.ac.uk dkim=pass dkdomain=ed.ac.uk dmarc=pass fromdomain=ed.ac.uk);
       spf=pass (google.com: domain of karim.manaouil@ed.ac.uk designates 129.215.17.202 as permitted sender) smtp.mailfrom=Karim.Manaouil@ed.ac.uk;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ed.ac.uk
Received: from seine.is.ed.ac.uk (seine.is.ed.ac.uk. [129.215.17.202])
        by gmr-mx.google.com with ESMTPS id n16-20020a05651203f000b004a222ff195esi299673lfq.11.2022.11.20.10.48.10
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 20 Nov 2022 10:48:10 -0800 (PST)
Received-SPF: pass (google.com: domain of karim.manaouil@ed.ac.uk designates 129.215.17.202 as permitted sender) client-ip=129.215.17.202;
Received: from exseed.ed.ac.uk (hbdkb3.is.ed.ac.uk [129.215.235.37])
	by seine.is.ed.ac.uk (8.14.7/8.14.7) with ESMTP id 2AKIlwDm010608
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Sun, 20 Nov 2022 18:48:05 GMT
Received: from hbdat3.is.ed.ac.uk (129.215.235.38) by hbdkb3.is.ed.ac.uk
 (129.215.235.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Sun, 20 Nov
 2022 18:48:02 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (104.47.18.108)
 by hbdat3.is.ed.ac.uk (129.215.235.38) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Sun, 20 Nov 2022 18:48:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DDfht3kssyppUrVfzzLfElujotGEkW92Y06AJwWUNHVD7zik4HCV2OS5pe7/pr9/6W9i/xkoqV7p7dbeKcTbBH+e1WPKN/aCbatZd1PCqUaJvm2xBeCCTcEXEGjDd/4QaPALD1NiArzPf2GpTd1AetsMddAqg4iNlcif6Z6hl3DcWnqFO9pkQclTTCJMSN7Ei9Kn/3qPK94XvpqifC24MR2Y/xzm68zUBpoIBk525KWvNqw3h0LSi4n6GK8dwV6e+WgPE7S4CwmPeYIM6dHIdKvyk6A5LzjvmbRx2ruervhL293eDsiqi7ymsNx0DBGD3KjBVH830AuC5kDl7D9G9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mvAbDZ+5nQro9lC9pSFREYT9tt8vUucyg9Khs+g4474=;
 b=MzMIYF0jt8Cvynjpjw84TI8kPFbkJWA1+YHiWj+FuQlmIVFfhxN2G+NTQOC287PArTIah5FNpqP9cG1d2OESjcFIxNCXIIjFehCUzGNV6+jIJCnP0xRngF8ySn8agP8OhF+T7Ne/ipNF2TtZxy98SiOfOSj4TosHKoYUiwmb/TOeA+2HJD3prmzLHy+Y5wI6xVfDnA6hYt1s9gxiOUfvADJja5o1C+s+aZfAfxbnp76mRf472rQqIE835Y54dHqXMrHVsrvCIpyPXNwakgEvaReHPESfLdkkglUq3sAGRzPbYJGHhtJDKzKnv3aJ3Q1yuMH+QS/ejXo72fjf607x/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ed.ac.uk; dmarc=pass action=none header.from=ed.ac.uk;
 dkim=pass header.d=ed.ac.uk; arc=none
Received: from AM0PR05MB6018.eurprd05.prod.outlook.com (2603:10a6:208:12b::26)
 by AS1PR05MB9204.eurprd05.prod.outlook.com (2603:10a6:20b:4d4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9; Sun, 20 Nov
 2022 18:47:47 +0000
Received: from AM0PR05MB6018.eurprd05.prod.outlook.com
 ([fe80::960e:4fc1:3ee:db81]) by AM0PR05MB6018.eurprd05.prod.outlook.com
 ([fe80::960e:4fc1:3ee:db81%4]) with mapi id 15.20.5834.009; Sun, 20 Nov 2022
 18:47:11 +0000
From: Karim Manaouil <Karim.Manaouil@ed.ac.uk>
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
CC: "jan.kiszka@siemens.com" <jan.kiszka@siemens.com>,
        Henning Schild
	<henning.schild@siemens.com>,
        "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>
Subject: Re: [EXT] Re: Jailhouse: enter_hypervisor returns -ENOMEM
Thread-Topic: [EXT] Re: Jailhouse: enter_hypervisor returns -ENOMEM
Thread-Index: AQHY9rkzsgTc3CVeRkSVzYW63qokCK47kFSAgAHcNMCAALsugIAFv5ZMgAD/TgCAAB/EjoAAIhWAgAMF/6I=
Date: Sun, 20 Nov 2022 18:47:11 +0000
Message-ID: <AM0PR05MB60188F8CE4254465566F345BA90B9@AM0PR05MB6018.eurprd05.prod.outlook.com>
References: <AM0PR05MB6018F1663ABE61DA3C697CA4A9039@AM0PR05MB6018.eurprd05.prod.outlook.com>
 <63d52496-ac3e-8dfd-112f-8e723d0af98a@oth-regensburg.de>
 <AM0PR05MB601899CAC211F4C81A9757DFA9029@AM0PR05MB6018.eurprd05.prod.outlook.com>
 <20221114102213.2d3223a1@md1za8fc.ad001.siemens.net>
 <AM0PR05MB601854C5133C67EE917952B8A9099@AM0PR05MB6018.eurprd05.prod.outlook.com>
 <79cf1f00-9c20-404e-150b-42142c804d3e@oth-regensburg.de>
 <DB8PR05MB602623B1DA27CE3A1662FD72A9099@DB8PR05MB6026.eurprd05.prod.outlook.com>
 <08d3ca0e-9f82-cc84-f70a-0b0c8000326a@oth-regensburg.de>
In-Reply-To: <08d3ca0e-9f82-cc84-f70a-0b0c8000326a@oth-regensburg.de>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR05MB6018:EE_|AS1PR05MB9204:EE_
x-ms-office365-filtering-correlation-id: 6c75d7ca-fb24-4ffe-3878-08dacb27a251
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xYZTjCdgo6TmOtZLlbb7Yt76Qp4b3oB42MHHwYwRyQF5C3/hAKMUz3SWRu/dPDOkhdnHspmK/4lWFcN5SrwyzOxFZd6CzqqCZoUMoJZ/3My2Zz9cHreCsgO5mgAXEIoEEPHy9SMD4CnakUx8FNvfcGqpzHkqciPqxGj40URsDjTA/4K685qVTMfivRae4wAxzjbcc2f6rLWKGUki/yrnoq+M+4Naw+tsDXFyvYvhNU014YZJuWcGKD326TWeHRHV9EJQKRlkXuYmaWP9sTXwDVEGdD+I8Bq4S67OiIaLuM751CT4q7uIzEq0ctKP0ur36mqY94eEgohKkNAitGB5dyMXH2E/07G27Sa6LA9BMA42h3xxWtDiFNq3FEY2oRkEFNZh8ndV9bnCnfClOcdUsprvJUtUk82orvXNQVEYmvJaAqjNRdPnjoYBIbT0fQgTXTnkSvi0qTbjxEuisqbdofC+DA8l9UtY/kMdkAoEEAw0tFqeKxS5+18Evqg0a20ycq6/E3RHGh/j0FJN+RiiLjt+r5RjMUAGTEV7JnQjNQ4fbpyg7Y8IBvMTMBmnu7eRXRgrTSS8T3WYfbr1ZDe5Pv7amzuJXY7TMSv1UyV3FbMs8CtDBjilQUSVZFTK9k4mcw36j1k6A7mBj4J+l2e85+dRwj2+mWVx1vtPZMbU0LZKSB2Avwv/I9lL2NqFlrW2g5jgT7H4JCySMIAiY1GLUCdfcYonYvg6vAX1sjpNQlav5adZ0BopClLzPrvx3NCNEHR+OTgJ4pHLrx8IzpCmiZCSgg5zgjPMkd+APGzLYvU=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR05MB6018.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(396003)(39860400002)(136003)(346002)(366004)(451199015)(19627405001)(66899015)(2906002)(55016003)(18265965005)(33656002)(91956017)(66556008)(66476007)(64756008)(76116006)(66946007)(41300700001)(66446008)(86362001)(41320700001)(26005)(99936003)(122000001)(38100700002)(6916009)(53546011)(6506007)(7696005)(54906003)(166002)(8676002)(83380400001)(30864003)(38070700005)(71200400001)(186003)(8936002)(52536014)(66574015)(4326008)(786003)(5660300002)(966005)(316002)(9686003)(45080400002)(478600001)(579004)(559001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?J/EjWl0IaswKjox57kyThv6SxaxMQCr4koQBNhea7Zg3F7BVK5ti7/Mp?=
 =?Windows-1252?Q?GbcKSPMN2iHOESK36kiXsaJ9fr8vN3/6XpQg02Tu0eXW8Ys4SddXSR4k?=
 =?Windows-1252?Q?rHLm90h/v2N0avZEkPbZrkT+4wRpMtCOnQiofl5O33L07xrWX7Fx/cW+?=
 =?Windows-1252?Q?osaPSuNzTVh2lYQpa7DqkgRotbcebO3fwalZKAqq8MczZ70qkoB+9y2o?=
 =?Windows-1252?Q?oWXBwih5dE/rR+OfXaIccZ9XKjqMmJ6E+tWsd9yevw4YfTSp/0HewemR?=
 =?Windows-1252?Q?rgSFO91od7nn49NPWyDIt9CP9Tg7eG8/s10vlD9mUqHE6AVHvvb8Vxcp?=
 =?Windows-1252?Q?nT4G94UImNLd2QZIPpdSdM6kI1XrfbtQZin0fNbqPvIOAlo5gPA8EeR8?=
 =?Windows-1252?Q?nwFVUaAjLReTRLyqPR5iNBxygw5U3r18GW41o6CDOEvz8HLv1vTvuxpQ?=
 =?Windows-1252?Q?UzG1oyl+DG7jQ68G01tc1RzE/cZp/KDo9Q1LeiHoOJF3JNerk3xd0mKq?=
 =?Windows-1252?Q?tkqLNE43n+1YLfTt97U+qqIGSWALgp7Z9lYES2cv2ElbHfS6jv9Lb90i?=
 =?Windows-1252?Q?GpoSQ4wmS2bXgFANzrkDGCi1fd6TMetCMriT5cgoJOaLUeExLuyswz3g?=
 =?Windows-1252?Q?rOVMK/du2yjh97bhyUWVDZT/FuabpjUZCbv/D2gTO/iBb3HkenUv6LT4?=
 =?Windows-1252?Q?jeC04TYNr5QeO0/RG7P+1VuWdpMqV33T3wo7CfbsKg1dC9J8XB573VGH?=
 =?Windows-1252?Q?K+gikXetZJkEMybZtcuav+TWk4RPRBHsaAsqX73AbdCLVymBcZbaJXla?=
 =?Windows-1252?Q?BaMlHdvO0GDnyZq4xlDTpxGPMV4xCCOkkMt9Czrq2+sXe6HUIVYTkcw7?=
 =?Windows-1252?Q?5aBHyVWHSHusIwYedDPQfGx1tucV5hGDgZMeLCqnfx4inIpAkvJ/vKWC?=
 =?Windows-1252?Q?RzbMX4a2H6w/BzNW8nAz54xpm4jeDGeuxmVQ7ccGoLvCSk0jVPbW3rT4?=
 =?Windows-1252?Q?+wKzYM7+Tu3KUiRKxKJ3VWamynwia+U7JzgjWxwXpfgeSOy3XXh30Pxy?=
 =?Windows-1252?Q?xcCsS4CwsrlahkVUEr31zW1xBY3EqYiCUA9EkFxLpY6sSpXFENmDtxlT?=
 =?Windows-1252?Q?NQpv7G4fm2rucmd2G9WuVGiJR4vdGVxEXgDxMBb34DuJk+47CkFAvKtn?=
 =?Windows-1252?Q?PvCIEoCYWOcbr3mp5BhcsYkr0STgDYi2v4OgflGrM3QWAu6yIKno2o0e?=
 =?Windows-1252?Q?2h516FudSjiRpBaMU8+KaUNi1Z93qC6AyUrgdvIm6ueycCPD2J1qEqcF?=
 =?Windows-1252?Q?pwa7a0Dqo84eNVVq1nsd43Dqcdtaw3DJkn1Ex/ImjkUqHAHjj0UK9aOU?=
 =?Windows-1252?Q?rVVBB7QTRckCTpGghDU1rk12KYcE4xwwZFWaWy48dmOScg8okzso+Y/9?=
 =?Windows-1252?Q?s6jeJXnQ5FtPWXyfevS+ZgmXgegjZY6rn7jq8PpL6kqrcErAOVrfahlP?=
 =?Windows-1252?Q?vcO2UxFvDSb4X/yQvUaL1FVGn1k+6esvvtpT6v5AbdsqxK0NOOKkZXLv?=
 =?Windows-1252?Q?wXjTK/8DjEe+UWP4Kbg3qdKpiKQepL7zuE9Iy8VTFFLjlSD/vrjP3h/S?=
 =?Windows-1252?Q?Ort4eABEweBMlPl8jaH3CNUINxFHwawstTjaPuqjCXRZJPLLzPedOlDj?=
 =?Windows-1252?Q?RlYfQsFGSwg=3D?=
Content-Type: multipart/mixed;
	boundary="_004_AM0PR05MB60188F8CE4254465566F345BA90B9AM0PR05MB6018eurp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR05MB6018.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c75d7ca-fb24-4ffe-3878-08dacb27a251
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2022 18:47:11.3585
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2e9f06b0-1669-4589-8789-10a06934dc61
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3SJdDAfdjvoBlMNLU1UcVFkBHDFND0CKXQ92s6TshNMt2tvKcBLm9u62UQxrzC+n1YEaecmF2k1AXKNCdPruYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR05MB9204
X-OriginatorOrg: ed.ac.uk
X-Edinburgh-Scanned: at seine.is.ed.ac.uk
X-Original-Sender: karim.manaouil@ed.ac.uk
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ed.ac.uk header.s=selector1 header.b=siS4ta+O;       arc=pass (i=1
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

--_004_AM0PR05MB60188F8CE4254465566F345BA90B9AM0PR05MB6018eurp_
Content-Type: multipart/alternative;
	boundary="_000_AM0PR05MB60188F8CE4254465566F345BA90B9AM0PR05MB6018eurp_"

--_000_AM0PR05MB60188F8CE4254465566F345BA90B9AM0PR05MB6018eurp_
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ralf,

Thanks a lot for the help!

The missing entries are for AMD IOMMU (they appear
in /proc/iommu tree, but for some reason the jailhouse
config script is not adding them to sysconfig.c).

I also had to add amd_iommu=3Dfalse to the kernel cmdline.
Now the jailhouse is correctly created with no issues, and
the Linux on the root cell works perfectly.

I wanted to try creating another cell using the demo provided
by configs/x86/apic-demo.c (since it's very simple), but it always
generates a PIO read error.

The PIO address is for UART (0x2f9). This address exists in a
PIO_RANGE in apic-demo.c and it also exists on the root cell's
sysconfig.c, so it should work, but here we are.

Here is the log that I get after running:
jailhouse cell create configs/x86/apic-demo.cell
it shows both hypervisor and Linux output. I also
attached apic-demo.c for reference.

Page pool usage after late setup: mem 1934/7635, remap 65703/131072
Activating hypervisor
[  698.582280] jailhouse: enter_hypvisor called on every cpu
[  698.587918] jailhouse: console unmapped
[  698.591942] jailhouse: firmware released
[  698.595998] jailhouse: root cell registered
[  698.600313] jailhouse: pci virtual root device added
[  698.604973] hpet_rtc_timer_reinit: 5 callbacks suppressed
[  698.604977] hpet: Lost 5719 RTC interrupts
[  698.605434] The Jailhouse is opening.
[  733.204370] jailhouse: pci setup done
[  733.283290] IRQ fixup: irq 789 move in progress, old vector 39
[  733.289163] IRQ 789: no longer affine to CPU3
[  733.294892] smpboot: CPU 3 is now offline
Created cell "apic-demo"
Page pool usage after cell creation: mem 1949/7635, remap 65703/131072
AFATAL: Invalid PIO read, port: 2f9 size: 1
RIP: 0xffffffff999b2683 RSP: 0xffffa0f68d627c98 FLAGS: 6
RAX: 0xffffffff999b2670 RBX: 0x0000000000000247 RCX: 0x0000000000000000
RDX: 0x00000000000002f9 RSI: 0x0000000000000001 RDI: 0xffffffff9b3da9f8
CS: 10 BASE: 0x0000000000000000 AR-BYTES: 29b EFER.LMA 1
CR0: 0x0000000080050033 CR3: 0x0000003082bea000 CR4: 0x00000000003506a0
EFER: 0x0000000000001d01
Parking CPU 29 (Cell: "RootCell")
FATAL: Invalid PIO read, port: 2fa size: 1
RIP: 0xffffffff999b2683 RSP: 0xffffa0f68d450f08 FLAGS: 6
RAX: 0xffffffff999b2670 RBX: 0xffffffff9b3da9f8 RCX: 0x0000000000000000
RDX: 0x00000000000002fa RSI: 0x0000000000000002 RDI: 0xffffffff9b3da9f8
CS: 10 BASE: 0x0000000000000000 AR-BYTES: 29b EFER.LMA 1
CR0: 0x0000000080050033 CR3: 0x0000002085c36000 CR4: 0x00000000003506a0
EFER: 0x0000000000001d01
Parking CPU 64 (Cell: "RootCell")


Cheers
Karim
________________________________
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Sent: 18 November 2022 20:18
To: Karim Manaouil <Karim.Manaouil@ed.ac.uk>
Cc: jan.kiszka@siemens.com <jan.kiszka@siemens.com>; Henning Schild <hennin=
g.schild@siemens.com>; jailhouse-dev@googlegroups.com <jailhouse-dev@google=
groups.com>
Subject: Re: [EXT] Re: Jailhouse: enter_hypervisor returns -ENOMEM

This email was sent to you by someone outside the University.
You should only click on links or attachments if you are certain that the e=
mail is genuine and the content is safe.

Hi Karim,

On 18/11/2022 19:27, Karim Manaouil wrote:
> Hi Ralf,
>
> Thanks! I appreciate your help!
>
> I disabled MCE to get rid of the unhandled MSR read error. It works.
>
> I also fixed the PCIe 04:00.0 invalid write to reg 0xb4 by manually addin=
g

Okay, take care that if you manually add an entry that you need to
adjust the array size and their references.

> a capability entry to sysconfig.c giving it write permissions (btw, the
> entry
> for that register was not generated by the config tool).

Not everything is covered by the generator, some parts require manual
inspection.

>
> Now, I am still getting the invalid MMIO/RAM read and write (see log belo=
w).
> I first get the read error immediately after the page pool message
> is printed. Then after a little while, the write error follows up.

Now we need to inspect /proc/iomem. You need to check what is behind
address 0x90482020, and add an appropriate memory region entry to your
config.

   Ralf

>
> Always same case, immediate read error followed by a write error.
> it happens every time (but the addresses change).
>
> Here is below the last log from jailhouse copy pasted.
> I also attached the output of lspci -vvv as well as sysconfig.c.
>
> Cheers
> Karim
>
> Page pool usage after late setup: mem 1927/7635, remap 65703/131072
> FATAL: Invalid MMIO/RAM read, addr: 0x0000000090482020 size: 4
> RIP: 0xffffffff915d1735 RSP: 0xffffa9b08e97be18 FLAGS: 296
> RAX: 0xffffa9b080780000 RBX: 0xffff934f4262a7c0 RCX: 0x0000000000000000
> RDX: 0xffff934f47e32f10 RSI: 0xffff934f4004e800 RDI: 0x0000000000000021
> CS: 10 BASE: 0x0000000000000000 AR-BYTES: 29b EFER.LMA 1
> CR0: 0x0000000080050033 CR3: 0x00000020c2682000 CR4: 0x00000000003506a0
> EFER: 0x0000000000001d01
> Parking CPU 7 (Cell: "RootCell")
> Ignoring NMI IPI to CPU 88
> Ignoring NMI IPI to CPU 88
> FATAL: Invalid MMIO/RAM write, addr: 0x0000000093a82008 size: 4
> RIP: 0xffffffff915ccce7 RSP: 0xffffa9b08db54da0 FLAGS: 2
> RAX: 0xffffa9b080380000 RBX: 0x0000000000000001 RCX: 0x0000000000001a70
> RDX: 0xffff9376c0004000 RSI: 0x3000004500000000 RDI: 0x7ffffffffffff003
> CS: 10 BASE: 0x0000000000000000 AR-BYTES: 29b EFER.LMA 1
> CR0: 0x0000000080050033 CR3: 0x00000001267d0000 CR4: 0x00000000003506a0
> EFER: 0x0000000000001d01
> Parking CPU 81 (Cell: "RootCell")
> Ignoring NMI IPI to CPU 88
> Ignoring NMI IPI to CPU 88
> Ignoring NMI IPI to CPU 88
>
>
> ------------------------------------------------------------------------
> *From:* Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> *Sent:* 18 November 2022 16:23
> *To:* Karim Manaouil <Karim.Manaouil@ed.ac.uk>; Henning Schild
> <henning.schild@siemens.com>
> *Cc:* jan.kiszka@siemens.com <jan.kiszka@siemens.com>;
> jailhouse-dev@googlegroups.com <jailhouse-dev@googlegroups.com>
> *Subject:* Re: [EXT] Re: Jailhouse: enter_hypervisor returns -ENOMEM
> This email was sent to you by someone outside the University.
> You should only click on links or attachments if you are certain that
> the email is genuine and the content is safe.
>
> Hi,
>
> On 18/11/2022 02:19, Karim Manaouil wrote:
>> Hi Henning,
>>
>> I spent some more time debugging the issue.
>> I am getting a "FATAL: Invalid MMIO/RAM write".
>> Probably it's happening right after the first cpu that
>> calls arch_cpu_activate_mm() in hypervisor/setup.c:entry().
>>
>> Not sure why, but maybe you have some pointers.
>>
>> Here is the jailhouse output copy-pasted below.
>>
>> Cheers
>>
>> Initializing Jailhouse hypervisor v0.12 (314-gc7a1b697-dirty) on CPU 6
>> Code location: 0xfffffffff0000050
>> Using xAPIC
>> Page pool usage after early setup: mem 813/7635, remap 1/131072
>> Initializing processors:
>
> Ok, having read your log, you have (at the moment) at least two issues:
>
> First:
>
>   > FATAL: Invalid PCI config write, device 04:00.0, reg: 0xb4, size: 2
>
> For the moment, go to your config and allow write access to that
> capability. I could maybe help you with this if you share your config.
> Please also attach lspci -vvv.
>
> I can send you the config diff, and in the long run, you need to
> understand what the changes mean.
>
> Second:
>
>   > FATAL: Unhandled MSR read: c0002001
>
> That's MSR_AMD64_SMCA_MC0_STATUS. For the moment, disable Machine Check
> Events (MCE) in your kernel config or add appropriate parameters to your
> kernel to disable them.
>
> Disable CONFIG_X86_MCE_{INTEL,AMD} in .config, or try adding mce=3Doff to
> your kernel parameters.
>
> HTH,
>
>     Ralf
>
>>   CPU 6... (APIC ID 48) OK
>>   CPU 64... (APIC ID 1) OK
>>   CPU 0... (APIC ID 0) OK
>>   CPU 16... (APIC ID 2) OK
>>   CPU 112... (APIC ID 7) OK
>>   CPU 104... (APIC ID 13) OK
>>   CPU 40... (APIC ID 12) OK
>>   CPU 72... (APIC ID 9) OK
>>   CPU 8... (APIC ID 8) OK
>>   CPU 56... (APIC ID 14) OK
>>   CPU 120... (APIC ID 15) OK
>>   CPU 110... (APIC ID 61) OK
>>   CPU 46... (APIC ID 60) OK
>>   CPU 14... (APIC ID 56) OK
>>   CPU 78... (APIC ID 57) OK
>>   CPU 94... (APIC ID 59) OK
>>   CPU 30... (APIC ID 58) OK
>>   CPU 126... (APIC ID 63) OK
>>   CPU 62... (APIC ID 62) OK
>>   CPU 2... (APIC ID 16) OK
>>   CPU 66... (APIC ID 17) OK
>>   CPU 18... (APIC ID 18) OK
>>   CPU 82... (APIC ID 19) OK
>>   CPU 114... (APIC ID 23) OK
>>   CPU 50... (APIC ID 22) OK
>>   CPU 98... (APIC ID 21) OK
>>   CPU 34... (APIC ID 20) OK
>>   CPU 12... (APIC ID 40) OK
>>   CPU 76... (APIC ID 41) OK
>>   CPU 60... (APIC ID 46) OK
>>   CPU 124... (APIC ID 47) OK
>>   CPU 44... (APIC ID 44) OK
>>   CPU 108... (APIC ID 45) OK
>>   CPU 92... (APIC ID 43) OK
>>   CPU 28... (APIC ID 42) OK
>>   CPU 26... (APIC ID 26) OK
>>   CPU 90... (APIC ID 27) OK
>>   CPU 74... (APIC ID 25) OK
>>   CPU 10... (APIC ID 24) OK
>>   CPU 106... (APIC ID 29) OK
>>   CPU 42... (APIC ID 28) OK
>>   CPU 58... (APIC ID 30) OK
>>   CPU 122... (APIC ID 31) OK
>>   CPU 20... (APIC ID 34) OK
>>   CPU 84... (APIC ID 35) OK
>>   CPU 36... (APIC ID 36) OK
>>   CPU 100... (APIC ID 37) OK
>>   CPU 116... (APIC ID 39) OK
>>   CPU 52... (APIC ID 38) OK
>>   CPU 4... (APIC ID 32) OK
>>   CPU 68... (APIC ID 33) OK
>>   CPU 96... (APIC ID 5) OK
>>   CPU 32... (APIC ID 4) OK
>>   CPU 88... (APIC ID 11) OK
>>   CPU 55... (APIC ID 118) OK
>>   CPU 119... (APIC ID 119) OK
>>   CPU 87... (APIC ID 115) OK
>>   CPU 23... (APIC ID 114) OK
>>   CPU 71... (APIC ID 113) OK
>>   CPU 7... (APIC ID 112) OK
>>   CPU 39... (APIC ID 116) OK
>>   CPU 103... (APIC ID 117) OK
>>   CPU 47... (APIC ID 124) OK
>>   CPU 111... (APIC ID 125) OK
>>   CPU 15... (APIC ID 120) OK
>>   CPU 79... (APIC ID 121) OK
>>   CPU 31... (APIC ID 122) OK
>>   CPU 95... (APIC ID 123) OK
>>   CPU 127... (APIC ID 127) OK
>>   CPU 63... (APIC ID 126) OK
>>   CPU 86... (APIC ID 51) OK
>>   CPU 22... (APIC ID 50) OK
>>   CPU 38... (APIC ID 52) OK
>>   CPU 102... (APIC ID 53) OK
>>   CPU 118... (APIC ID 55) OK
>>   CPU 54... (APIC ID 54) OK
>>   CPU 70... (APIC ID 49) OK
>>   CPU 109... (APIC ID 109) OK
>>   CPU 45... (APIC ID 108) OK
>>   CPU 93... (APIC ID 107) OK
>>   CPU 29... (APIC ID 106) OK
>>   CPU 13... (APIC ID 104) OK
>>   CPU 77... (APIC ID 105) OK
>>   CPU 61... (APIC ID 110) OK
>>   CPU 125... (APIC ID 111) OK
>>   CPU 5... (APIC ID 96) OK
>>   CPU 101... (APIC ID 101) OK
>>   CPU 37... (APIC ID 100) OK
>>   CPU 85... (APIC ID 99) OK
>>   CPU 21... (APIC ID 98) OK
>>   CPU 117... (APIC ID 103) OK
>>   CPU 53... (APIC ID 102) OK
>>   CPU 69... (APIC ID 97) OK
>>   CPU 49... (APIC ID 70) OK
>>   CPU 1... (APIC ID 64) OK
>>   CPU 65... (APIC ID 65) OK
>>   CPU 81... (APIC ID 67) OK
>>   CPU 17... (APIC ID 66) OK
>>   CPU 97... (APIC ID 69) OK
>>   CPU 33... (APIC ID 68) OK
>>   CPU 113... (APIC ID 71) OK
>>   CPU 25... (APIC ID 74) OK
>>   CPU 89... (APIC ID 75) OK
>>   CPU 41... (APIC ID 76) OK
>>   CPU 105... (APIC ID 77) OK
>>   CPU 9... (APIC ID 72) OK
>>   CPU 73... (APIC ID 73) OK
>>   CPU 121... (APIC ID 79) OK
>>   CPU 57... (APIC ID 78) OK
>>   CPU 3... (APIC ID 80) OK
>>   CPU 67... (APIC ID 81) OK
>>   CPU 35... (APIC ID 84) OK
>>   CPU 99... (APIC ID 85) OK
>>   CPU 115... (APIC ID 87) OK
>>   CPU 51... (APIC ID 86) OK
>>   CPU 19... (APIC ID 82) OK
>>   CPU 83... (APIC ID 83) OK
>>   CPU 107... (APIC ID 93) OK
>>   CPU 43... (APIC ID 92) OK
>>   CPU 11... (APIC ID 88) OK
>>   CPU 75... (APIC ID 89) OK
>>   CPU 123... (APIC ID 95) OK
>>   CPU 59... (APIC ID 94) OK
>>   CPU 27... (APIC ID 90) OK
>>   CPU 24... (APIC ID 10) OK
>>   CPU 80... (APIC ID 3) OK
>>   CPU 48... (APIC ID 6) OK
>>   CPU 91... (APIC ID 91) OK
>> Initializing unit: AMD IOMMU
>> AMD IOMMU @0xa1700000/0x80000
>> Initializing unit: IOAPIC
>> Initializing unit: PCI
>> Adding PCI device 00:00.0 to cell "RootCell"
>> Adding PCI device 00:01.0 to cell "RootCell"
>> Adding PCI device 00:01.1 to cell "RootCell"
>> Adding PCI device 00:01.3 to cell "RootCell"
>> Adding PCI device 00:01.4 to cell "RootCell"
>> Adding PCI device 00:02.0 to cell "RootCell"
>> Adding PCI device 00:03.0 to cell "RootCell"
>> Adding PCI device 00:04.0 to cell "RootCell"
>> Adding PCI device 00:07.0 to cell "RootCell"
>> Adding PCI device 00:07.1 to cell "RootCell"
>> Adding PCI device 00:08.0 to cell "RootCell"
>> Adding PCI device 00:08.1 to cell "RootCell"
>> Adding PCI device 00:14.0 to cell "RootCell"
>> Adding PCI device 00:14.3 to cell "RootCell"
>> Adding PCI device 00:18.0 to cell "RootCell"
>> Adding PCI device 00:18.1 to cell "RootCell"
>> Adding PCI device 00:18.2 to cell "RootCell"
>> Adding PCI device 00:18.3 to cell "RootCell"
>> Adding PCI device 00:18.4 to cell "RootCell"
>> Adding PCI device 00:18.5 to cell "RootCell"
>> Adding PCI device 00:18.6 to cell "RootCell"
>> Adding PCI device 00:18.7 to cell "RootCell"
>> Adding PCI device 00:19.0 to cell "RootCell"
>> Adding PCI device 00:19.1 to cell "RootCell"
>> Adding PCI device 00:19.2 to cell "RootCell"
>> Adding PCI device 00:19.3 to cell "RootCell"
>> Adding PCI device 00:19.4 to cell "RootCell"
>> Adding PCI device 00:19.5 to cell "RootCell"
>> Adding PCI device 00:19.6 to cell "RootCell"
>> Adding PCI device 00:19.7 to cell "RootCell"
>> Adding PCI device 00:1a.0 to cell "RootCell"
>> Adding PCI device 00:1a.1 to cell "RootCell"
>> Adding PCI device 00:1a.2 to cell "RootCell"
>> Adding PCI device 00:1a.3 to cell "RootCell"
>> Adding PCI device 00:1a.4 to cell "RootCell"
>> Adding PCI device 00:1a.5 to cell "RootCell"
>> Adding PCI device 00:1a.6 to cell "RootCell"
>> Adding PCI device 00:1a.7 to cell "RootCell"
>> Adding PCI device 00:1b.0 to cell "RootCell"
>> Adding PCI device 00:1b.1 to cell "RootCell"
>> Adding PCI device 00:1b.2 to cell "RootCell"
>> Adding PCI device 00:1b.3 to cell "RootCell"
>> Adding PCI device 00:1b.4 to cell "RootCell"
>> Adding PCI device 00:1b.5 to cell "RootCell"
>> Adding PCI device 00:1b.6 to cell "RootCell"
>> Adding PCI device 00:1b.7 to cell "RootCell"
>> Adding PCI device 00:1c.0 to cell "RootCell"
>> Adding PCI device 00:1c.1 to cell "RootCell"
>> Adding PCI device 00:1c.2 to cell "RootCell"
>> Adding PCI device 00:1c.3 to cell "RootCell"
>> Adding PCI device 00:1c.4 to cell "RootCell"
>> Adding PCI device 00:1c.5 to cell "RootCell"
>> Adding PCI device 00:1c.6 to cell "RootCell"
>> Adding PCI device 00:1c.7 to cell "RootCell"
>> Adding PCI device 00:1d.0 to cell "RootCell"
>> Adding PCI device 00:1d.1 to cell "RootCell"
>> Adding PCI device 00:1d.2 to cell "RootCell"
>> Adding PCI device 00:1d.3 to cell "RootCell"
>> Adding PCI device 00:1d.4 to cell "RootCell"
>> Adding PCI device 00:1d.5 to cell "RootCell"
>> Adding PCI device 00:1d.6 to cell "RootCell"
>> Adding PCI device 00:1d.7 to cell "RootCell"
>> Adding PCI device 00:1e.0 to cell "RootCell"
>> Adding PCI device 00:1e.1 to cell "RootCell"
>> Adding PCI device 00:1e.2 to cell "RootCell"
>> Adding PCI device 00:1e.3 to cell "RootCell"
>> Adding PCI device 00:1e.4 to cell "RootCell"
>> Adding PCI device 00:1e.5 to cell "RootCell"
>> Adding PCI device 00:1e.6 to cell "RootCell"
>> Adding PCI device 00:1e.7 to cell "RootCell"
>> Adding PCI device 00:1f.0 to cell "RootCell"
>> Adding PCI device 00:1f.1 to cell "RootCell"
>> Adding PCI device 00:1f.2 to cell "RootCell"
>> Adding PCI device 00:1f.3 to cell "RootCell"
>> Adding PCI device 00:1f.4 to cell "RootCell"
>> Adding PCI device 00:1f.5 to cell "RootCell"
>> Adding PCI device 00:1f.6 to cell "RootCell"
>> Adding PCI device 00:1f.7 to cell "RootCell"
>> Adding PCI device 01:00.0 to cell "RootCell"
>> Adding PCI device 01:00.1 to cell "RootCell"
>> Adding PCI device 02:00.0 to cell "RootCell"
>> Adding PCI device 03:00.0 to cell "RootCell"
>> Adding PCI device 04:00.0 to cell "RootCell"
>> Adding PCI device 04:00.1 to cell "RootCell"
>> Adding PCI device 05:00.0 to cell "RootCell"
>> Adding PCI device 05:00.2 to cell "RootCell"
>> Adding PCI device 05:00.3 to cell "RootCell"
>> Adding PCI device 06:00.0 to cell "RootCell"
>> Adding PCI device 06:00.1 to cell "RootCell"
>> Adding PCI device 06:00.2 to cell "RootCell"
>> Adding PCI device 20:00.0 to cell "RootCell"
>> Adding PCI device 20:00.2 to cell "RootCell"
>> Adding PCI device 20:01.0 to cell "RootCell"
>> Adding PCI device 20:01.1 to cell "RootCell"
>> Adding PCI device 20:02.0 to cell "RootCell"
>> Adding PCI device 20:03.0 to cell "RootCell"
>> Adding PCI device 20:04.0 to cell "RootCell"
>> Adding PCI device 20:07.0 to cell "RootCell"
>> Adding PCI device 20:07.1 to cell "RootCell"
>> Adding PCI device 20:08.0 to cell "RootCell"
>> Adding PCI device 20:08.1 to cell "RootCell"
>> Adding PCI device 21:00.0 to cell "RootCell"
>> Adding PCI device 21:00.1 to cell "RootCell"
>> Adding PCI device 22:08.0 to cell "RootCell"
>> Adding PCI device 23:00.0 to cell "RootCell"
>> Adding PCI device 24:00.0 to cell "RootCell"
>> Adding PCI device 24:00.2 to cell "RootCell"
>> Adding PCI device 24:00.3 to cell "RootCell"
>> Adding PCI device 25:00.0 to cell "RootCell"
>> Adding PCI device 25:00.1 to cell "RootCell"
>> Adding PCI device 40:00.0 to cell "RootCell"
>> Adding PCI device 40:00.2 to cell "RootCell"
>> Adding PCI device 40:01.0 to cell "RootCell"
>> Adding PCI device 40:02.0 to cell "RootCell"
>> Adding PCI device 40:03.0 to cell "RootCell"
>> Adding PCI device 40:03.1 to cell "RootCell"
>> Adding PCI device 40:04.0 to cell "RootCell"
>> Adding PCI device 40:07.0 to cell "RootCell"
>> Adding PCI device 40:07.1 to cell "RootCell"
>> Adding PCI device 40:08.0 to cell "RootCell"
>> Adding PCI device 40:08.1 to cell "RootCell"
>> Adding PCI device 41:00.0 to cell "RootCell"
>> Adding PCI device 41:00.1 to cell "RootCell"
>> Adding PCI device 42:00.0 to cell "RootCell"
>> Adding PCI device 42:00.2 to cell "RootCell"
>> Adding PCI device 43:00.0 to cell "RootCell"
>> Adding PCI device 43:00.1 to cell "RootCell"
>> Adding PCI device 60:00.0 to cell "RootCell"
>> Adding PCI device 60:00.2 to cell "RootCell"
>> Adding PCI device 60:01.0 to cell "RootCell"
>> Adding PCI device 60:02.0 to cell "RootCell"
>> Adding PCI device 60:03.0 to cell "RootCell"
>> Adding PCI device 60:03.1 to cell "RootCell"
>> Adding PCI device 60:04.0 to cell "RootCell"
>> Adding PCI device 60:07.0 to cell "RootCell"
>> Adding PCI device 60:07.1 to cell "RootCell"
>> Adding PCI device 60:08.0 to cell "RootCell"
>> Adding PCI device 60:08.1 to cell "RootCell"
>> Adding PCI device 61:00.0 to cell "RootCell"
>> Adding PCI device 62:00.0 to cell "RootCell"
>> Adding PCI device 62:00.2 to cell "RootCell"
>> Adding PCI device 63:00.0 to cell "RootCell"
>> Adding PCI device 63:00.1 to cell "RootCell"
>> Adding PCI device 80:00.0 to cell "RootCell"
>> Adding PCI device 80:00.2 to cell "RootCell"
>> Adding PCI device 80:01.0 to cell "RootCell"
>> Adding PCI device 80:02.0 to cell "RootCell"
>> Adding PCI device 80:03.0 to cell "RootCell"
>> Adding PCI device 80:04.0 to cell "RootCell"
>> Adding PCI device 80:07.0 to cell "RootCell"
>> Adding PCI device 80:07.1 to cell "RootCell"
>> Adding PCI device 80:08.0 to cell "RootCell"
>> Adding PCI device 80:08.1 to cell "RootCell"
>> Adding PCI device 81:00.0 to cell "RootCell"
>> Adding PCI device 81:00.2 to cell "RootCell"
>> Adding PCI device 82:00.0 to cell "RootCell"
>> Adding PCI device 82:00.1 to cell "RootCell"
>> Adding PCI device a0:00.0 to cell "RootCell"
>> Adding PCI device a0:00.2 to cell "RootCell"
>> Adding PCI device a0:01.0 to cell "RootCell"
>> Adding PCI device a0:02.0 to cell "RootCell"
>> Adding PCI device a0:03.0 to cell "RootCell"
>> Adding PCI device a0:04.0 to cell "RootCell"
>> Adding PCI device a0:07.0 to cell "RootCell"
>> Adding PCI device a0:07.1 to cell "RootCell"
>> Adding PCI device a0:08.0 to cell "RootCell"
>> Adding PCI device a0:08.1 to cell "RootCell"
>> Adding PCI device a1:00.0 to cell "RootCell"
>> Adding PCI device a1:00.2 to cell "RootCell"
>> Adding PCI device a2:00.0 to cell "RootCell"
>> Adding PCI device a2:00.1 to cell "RootCell"
>> Adding PCI device c0:00.0 to cell "RootCell"
>> Adding PCI device c0:00.2 to cell "RootCell"
>> Adding PCI device c0:01.0 to cell "RootCell"
>> Adding PCI device c0:02.0 to cell "RootCell"
>> Adding PCI device c0:03.0 to cell "RootCell"
>> Adding PCI device c0:03.1 to cell "RootCell"
>> Adding PCI device c0:03.2 to cell "RootCell"
>> Adding PCI device c0:03.3 to cell "RootCell"
>> Adding PCI device c0:03.4 to cell "RootCell"
>> Adding PCI device c0:04.0 to cell "RootCell"
>> Adding PCI device c0:07.0 to cell "RootCell"
>> Adding PCI device c0:07.1 to cell "RootCell"
>> Adding PCI device c0:08.0 to cell "RootCell"
>> Adding PCI device c0:08.1 to cell "RootCell"
>> Adding PCI device c1:00.0 to cell "RootCell"
>> Adding PCI device c2:00.0 to cell "RootCell"
>> Adding PCI device c3:00.0 to cell "RootCell"
>> Adding PCI device c4:00.0 to cell "RootCell"
>> Adding PCI device c5:00.0 to cell "RootCell"
>> Adding PCI device c5:00.2 to cell "RootCell"
>> Adding PCI device c6:00.0 to cell "RootCell"
>> Adding PCI device c6:00.1 to cell "RootCell"
>> Adding PCI device e0:00.0 to cell "RootCell"
>> Adding PCI device e0:00.2 to cell "RootCell"
>> Adding PCI device e0:01.0 to cell "RootCell"
>> Adding PCI device e0:02.0 to cell "RootCell"
>> Adding PCI device e0:03.0 to cell "RootCell"
>> Adding PCI device e0:04.0 to cell "RootCell"
>> Adding PCI device e0:07.0 to cell "RootCell"
>> Adding PCI device e0:07.1 to cell "RootCell"
>> Adding PCI device e0:08.0 to cell "RootCell"
>> Adding PCI device e0:08.1 to cell "RootCell"
>> Adding PCI device e1:00.0 to cell "RootCell"
>> Adding PCI device e1:00.2 to cell "RootCell"
>> Adding PCI device e2:00.0 to cell "RootCell"
>> Adding PCI device e2:00.1 to cell "RootCell"
>> Page pool usage after late setup: mem 1927/7635, remap 65703/131072
>> FATAL: Invalid MMIO/RAM write, addr: 0x00000000a1702008 size: 4
>> RIP: 0xffffffffa79d7777 RSP: 0xffffa2f7cda78de0 FLAGS: 6
>> RAX: 0xffffa2f7c0080000 RBX: 0x0000000000000001 RCX: 0x0000000000000030
>> RDX: 0xffff90d18000a000 RSI: 0x3000001700000000 RDI: 0x7ffffffffffff003
>> CS: 10 BASE: 0x0000000000000000 AR-BYTES: 29b EFER.LMA 1
>> CR0: 0x0000000080050033 CR3: 0x000000014487c000 CR4: 0x00000000003506e0
>> EFER: 0x0000000000001d01
>> Parking CPU 76 (Cell: "RootCell")
>> Ignoring NMI IPI to CPU 1
>> Ignoring NMI IPI to CPU 2
>> Ignoring NMI IPI to CPU 3
>> Ignoring NMI IPI to CPU 4
>> Ignoring NMI IPI to CPU 5
>> Ignoring NMI IPI to CPU 6
>> Ignoring NMI IPI to CPU 7
>> Ignoring NMI IPI to CPU 76
>> Ignoring NMI IPI to CPU 1
>> Ignoring NMI IPI to CPU 2
>> Ignoring NMI IPI to CPU 3
>> Ignoring NMI IPI to CPU 4
>> Ignoring NMI IPI to CPU 5
>> Ignoring NMI IPI to CPU 6
>> Ignoring NMI IPI to CPU 7
>> Ignoring NMI IPI to CPU 76
>> Ignoring NMI IPI to CPU 1
>> Ignoring NMI IPI to CPU 2
>> Ignoring NMI IPI to CPU 3
>> Ignoring NMI IPI to CPU 4
>> Ignoring NMI IPI to CPU 5
>> FATAL: Invalid PCI config write, device 04:00.0, reg: 0xb4, size: 2
>> RIP: 0xffffffffa7c52b3d RSP: 0xffffa2f7ce99bd98 FLAGS: 46
>> RAX: 0x000000000000242e RBX: 0x0000000000000000 RCX: 0x00000000000000b4
>> RDX: 0x0000000000000cfc RSI: 0x0000000000000216 RDI: 0xffffffffa9401790
>> CS: 10 BASE: 0x0000000000000000 AR-BYTES: 29b EFER.LMA 1
>> CR0: 0x0000000080050033 CR3: 0x0000003b99810000 CR4: 0x00000000003506e0
>> EFER: 0x0000000000001d01
>> Parking CPU 24 (Cell: "RootCell")
>> Ignoring NMI IPI to CPU 6
>> Ignoring NMI IPI to CPU 7
>> FATAL: Unhandled MSR read: c0002001
>> RIP: 0xffffffffa7c951cd RSP: 0xffffa2f7cd918e08 FLAGS: 246
>> RAX: 0x00000000c0002000 RBX: 0xffff90e15fc11020 RCX: 0x00000000c0002001
>> RDX: 0x0000000000000000 RSI: 0xffffa2f7cd918df0 RDI: 0x00000000c0002001
>> CS: 10 BASE: 0x0000000000000000 AR-BYTES: 29b EFER.LMA 1
>> CR0: 0x0000000080050033 CR3: 0x00000018a6a46000 CR4: 0x00000000003506e0
>> EFER: 0x0000000000001d01
>> Parking CPU 68 (Cell: "RootCell")
>> FATAL: Unhandled MSR read: c0002001
>> RIP: 0xffffffffa7c951cd RSP: 0xffffa2f7cd4f8e08 FLAGS: 246
>> RAX: 0x00000000c0002000 RBX: 0xffff90e15fb51020 RCX: 0x00000000c0002001
>> RDX: 0x0000000000000000 RSI: 0xffffa2f7cd4f8df0 RDI: 0x00000000c0002001
>> CS: 10 BASE: 0x0000000000000000 AR-BYTES: 29b EFER.LMA 1
>> CR0: 0x0000000080050033 CR3: 0x0000002081eaa000 CR4: 0x00000000003506e0
>> EFER: 0x0000000000001d01
>> Parking CPU 44 (Cell: "RootCell")
>>
>> ------------------------------------------------------------------------
>> *From:* Henning Schild <henning.schild@siemens.com>
>> *Sent:* 14 November 2022 09:22
>> *To:* Karim Manaouil <Karim.Manaouil@ed.ac.uk>
>> *Cc:* Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>;
>> jan.kiszka@siemens.com <jan.kiszka@siemens.com>;
>> jailhouse-dev@googlegroups.com <jailhouse-dev@googlegroups.com>
>> *Subject:* Re: Jailhouse: enter_hypervisor returns -ENOMEM
>> This email was sent to you by someone outside the University.
>> You should only click on links or attachments if you are certain that
>> the email is genuine and the content is safe.
>>
>> Am Sun, 13 Nov 2022 22:24:45 +0000
>> schrieb Karim Manaouil <Karim.Manaouil@ed.ac.uk>:
>>
>>> Hi Ralf,
>>>
>>> Thanks for the reply!
>>>
>>> >Did you use jailhouse-config-create?
>>>
>>> I am using `jailhouse config create` to generate the sysconfig.c file.
>>>
>>> >You can use the --mem-hv option to
>>> increate the memory. Try, for example, 32MiB and see if it works.
>>>
>>> I tried with 32MiB. It worked. I am not getting -ENOMEM anymore.
>>> The driver prints "The Jailhouse is opening" on dmesg. However, right
>>> after that the CPUs get stuck, and I get rcu_sched detected stalls.
>>> The system is completely irresponsive.
>>>
>>> I attached a text file containing the full output from dmesg. Here is
>>> the initial part:
>>
>> I guess the output of the hypervisor might also be valuable here.
>> According to its spec that machine should have a serial port, and with
>> that default config from the generate script you should see logs coming
>> out of there. With the usual 115200 8n1
>>
>> Henning
>>
>>> [  434.792008] The Jailhouse is opening.
>>> [  455.787315] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
>>> [  455.793303] rcu:     1-...0: (839 GPs behind)
>>> idle=3Dc2a/1/0x4000000000000000 softirq=3D681/681 fqs=3D1827 [  455.802=
292]
>>> rcu:     2-...0: (144 GPs behind) idle=3D812/1/0x4000000000000000
>>> softirq=3D905/905 fqs=3D1827 [  455.811276] rcu:     3-...0: (144 GPs
>>> behind) idle=3Deaa/1/0x4000000000000000 softirq=3D719/719 fqs=3D1827 [
>>> 455.820266] rcu:     4-...0: (1 GPs behind)
>>> idle=3Dc2e/1/0x4000000000000000 softirq=3D1324/1324 fqs=3D1827 [
>>> 455.829252] rcu:     5-...0: (144 GPs behind)
>>> idle=3D41a/1/0x4000000000000000 softirq=3D556/556 fqs=3D1827 [  455.838=
238]
>>> rcu:     6-...0: (144 GPs behind) idle=3D912/1/0x4000000000000000
>>> softirq=3D777/777 fqs=3D1827 [  455.847218] rcu:     7-...0: (144 GPs
>>> behind) idle=3D5e6/1/0x4000000000000000 softirq=3D2409/2410 fqs=3D1827 =
[
>>> 455.856404]  (detected by 87, t=3D5253 jiffies, g=3D48537, q=3D364) [
>>> 455.862170] Sending NMI from CPU 87 to CPUs 1: [  465.776884] Sending
>>> NMI from CPU 87 to CPUs 2: [  467.182686] watchdog: BUG: soft lockup
>>> - CPU#0 stuck for 23s! [kworker/0:1:7] [  467.189857] Modules linked
>>> in: jailhouse(O) nf_conntrack_netlink xfrm_user xt_addrtype
>>> br_netfilter xt_CHECKSUM xt_MASQUERADE xt_conntrack ipt_REJECT
>>> nf_reject_ipv4 xt_tcpudp nft_compat nft_chain_nat nf_natp [
>>> 467.189928]  binfmt_misc configfs efivarfs ip_tables x_tables autofs4
>>> ext4 crc16 mbcache jbd2 raid10 raid456 libcrc32c crc32c_generic
>>> async_raid6_recov async_memcpy async_pq async_xor xor async_tx
>>> raid6_pq ] [  467.320567] CPU: 0 PID: 7 Comm: kworker/0:1 Tainted: G
>>>          O      5.10.0 #3 [  467.328767] Hardware name: Dell Inc.
>>> PowerEdge R7425/08V001, BIOS 1.15.0 09/11/2020 [  467.337154]
>>> Workqueue: events drm_fb_helper_dirty_work [drm_kms_helper] [
>>> 467.344501] RIP: 0010:smp_call_function_many_cond+0x289/0x2d0 [
>>> 467.350979] Code: e8 1c 8a 39 00 3b 05 0a c1 74 01 89 c7 0f 83 0b fe
>>> ff ff 48 63 c7 49 8b 16 48 03 14 c5 00 d9 99 9c 8b 42 08 a8 01 74 09
>>> f3 90 <8b> 42 08 a8 01 75 f7 eb c9 48 c7 c2 20 cf 07 9d 4c 89 fe 44 7
>>> [  467.371232] RSP: 0018:ffffa7d78015fcd8 EFLAGS: 00000202 [
>>> 467.377220] RAX: 0000000000000011 RBX: 0000000000031280 RCX:
>>> 0000000000000001 [  467.385123] RDX: ffff964f1fa31280 RSI:
>>> 0000000000000000 RDI: 0000000000000001 [  467.393024] RBP:
>>> 0000000000000000 R08: 0000000000000000 R09: 0000000000000001 [
>>> 467.400928] R10: 0000000000000002 R11: 0000000000000002 R12:
>>> 0000000000000000 [  467.408836] R13: 000000000000007f R14:
>>> ffff962f1f42c9c0 R15: 0000000000000080 [  467.416737] FS:
>>> 0000000000000000(0000) GS:ffff962f1f400000(0000)
>>> knlGS:0000000000000000 [  467.425604] CS:  0010 DS: 0000 ES: 0000
>>> CR0: 0000000080050033 [  467.432127] CR2: 0000000000000000 CR3:
>>> 00000010987ea000 CR4: 00000000003506f0 [  467.440045] Call Trace: [
>>> 467.443289]  ? tlbflush_read_file+0x70/0x70 [  467.448266]  ?
>>> tlbflush_read_file+0x70/0x70 [  467.453242]  on_each_cpu+0x2b/0x60 [
>>> 467.457437]  __purge_vmap_area_lazy+0x5d/0x680 [  467.462679]  ?
>>> _cond_resched+0x16/0x40 [  467.467224]  ?
>>> unmap_kernel_range_noflush+0x2fa/0x380 [  467.473072]
>>> free_vmap_area_noflush+0xe7/0x100 [  467.478315]
>>> remove_vm_area+0x96/0xa0 [  467.482770]  __vunmap+0x8d/0x290 [
>>> 467.486792]  drm_gem_shmem_vunmap+0x8b/0xa0 [drm] [  467.492299]
>>> drm_client_buffer_vunmap+0x16/0x20 [drm] [  467.498144]
>>> drm_fb_helper_dirty_work+0x187/0x1b0 [drm_kms_helper] [  467.505118]
>>> process_one_work+0x1b6/0x350 [  467.509912]  worker_thread+0x53/0x3e0
>>> [  467.514361]  ? process_one_work+0x350/0x350 [  467.519338]
>>> kthread+0x11b/0x140 [  467.523342]  ? __kthread_bind_mask+0x60/0x60 [
>>>  467.528389]  ret_from_fork+0x22/0x30
>>>
>>> Cheers
>>> Karim
>>> ________________________________
>>> From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>>> Sent: 12 November 2022 17:47
>>> To: Karim Manaouil <Karim.Manaouil@ed.ac.uk>; jan.kiszka@siemens.com
>>> <jan.kiszka@siemens.com> Cc: jailhouse-dev@googlegroups.com
>>> <jailhouse-dev@googlegroups.com> Subject: Re: Jailhouse:
>>> enter_hypervisor returns -ENOMEM
>>>
>>> This email was sent to you by someone outside the University.
>>> You should only click on links or attachments if you are certain that
>>> the email is genuine and the content is safe.
>>>
>>> On 12/11/2022 18:15, Karim Manaouil wrote:
>>> > Hi Jan,
>>> >
>>> > I am trying to deploy Jailhouse on an AMD EPYC with 128 CPUs (8 NUMA
>>> > nodes), running Linux kernel v5.10 (same version used by jailhouse
>>> > CI with same patches applied).
>>> >
>>> > `jailhouse hardware check` return that everything is ok and that
>>> > "Check passed!".
>>> >
>>> > Memory was reserved via `memmap=3D0x5200000$0x3a000000`
>>> >
>>> > However, enter_hypervisor() [1] fails when entry() is called on
>>> > every cpu and return -ENOMEM as error_code.
>>>
>>> Try to reserve more memory. Maybe the default size of 6MiB for HV
>>> memory is insufficient for 128 CPUs.
>>>
>>> Did you use jailhouse-config-create? You can use the --mem-hv option
>>> to increate the memory. Try, for example, 32MiB and see if it works.
>>>
>>>    Ralf
>>>
>>> >
>>> > Do you possibly know where could the issue come from?
>>> >
>>> > Best
>>> > Karim
>>> >
>>> > [1]
>>> > https://github.com/siemens/jailhouse/blob/c7a1b6971ac15e4be8a0918b9be=
f6e2cbd99f9fc/driver/main.c#L251 <https://github.com/siemens/jailhouse/blob=
/c7a1b6971ac15e4be8a0918b9bef6e2cbd99f9fc/driver/main.c#L251> <https://gith=
ub.com/siemens/jailhouse/blob/c7a1b6971ac15e4be8a0918b9bef6e2cbd99f9fc/driv=
er/main.c#L251 <https://github.com/siemens/jailhouse/blob/c7a1b6971ac15e4be=
8a0918b9bef6e2cbd99f9fc/driver/main.c#L251>>
>>> > <https://github.com/siemens/jailhouse/blob/c7a1b6971ac15e4be8a0918b9b=
ef6e2cbd99f9fc/driver/main.c#L251 <https://github.com/siemens/jailhouse/blo=
b/c7a1b6971ac15e4be8a0918b9bef6e2cbd99f9fc/driver/main.c#L251 <https://gith=
ub.com/siemens/jailhouse/blob/c7a1b6971ac15e4be8a0918b9bef6e2cbd99f9fc/driv=
er/main.c#L251>>>
>>> >
>>> > The University of Edinburgh is a charitable body, registered in
>>> > Scotland, with registration number SC005336. Is e buidheann
>>> > carthannais a th=E2=80=99 ann an Oilthigh Dh=C3=B9n =C3=88ideann, cl=
=C3=A0raichte an Alba,
>>> > =C3=A0ireamh cl=C3=A0raidh SC005336.
>>> >
>>> > --
>>> > You received this message because you are subscribed to the Google
>>> > Groups "Jailhouse" group.
>>> > To unsubscribe from this group and stop receiving emails from it,
>>> > send an email to jailhouse-dev+unsubscribe@googlegroups.com
>>> > <mailto:jailhouse-dev+unsubscribe@googlegroups.com
>> <mailto:jailhouse-dev+unsubscribe@googlegroups.com
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>>>.
>>> > To view this discussion on the web visit
>>> > https://groups.google.com/d/msgid/jailhouse-dev/AM0PR05MB6018F1663ABE=
61DA3C697CA4A9039%40AM0PR05MB6018.eurprd05.prod.outlook.com <https://groups=
.google.com/d/msgid/jailhouse-dev/AM0PR05MB6018F1663ABE61DA3C697CA4A9039%40=
AM0PR05MB6018.eurprd05.prod.outlook.com> <https://groups.google.com/d/msgid=
/jailhouse-dev/AM0PR05MB6018F1663ABE61DA3C697CA4A9039%40AM0PR05MB6018.eurpr=
d05.prod.outlook.com <https://groups.google.com/d/msgid/jailhouse-dev/AM0PR=
05MB6018F1663ABE61DA3C697CA4A9039%40AM0PR05MB6018.eurprd05.prod.outlook.com=
>>
>>> > <https://groups.google.com/d/msgid/jailhouse-dev/AM0PR05MB6018F1663AB=
E61DA3C697CA4A9039%40AM0PR05MB6018.eurprd05.prod.outlook.com?utm_medium=3De=
mail&utm_source=3Dfooter <https://groups.google.com/d/msgid/jailhouse-dev/A=
M0PR05MB6018F1663ABE61DA3C697CA4A9039%40AM0PR05MB6018.eurprd05.prod.outlook=
.com?utm_medium=3Demail&utm_source=3Dfooter <https://groups.google.com/d/ms=
gid/jailhouse-dev/AM0PR05MB6018F1663ABE61DA3C697CA4A9039%40AM0PR05MB6018.eu=
rprd05.prod.outlook.com?utm_medium=3Demail&utm_source=3Dfooter>>>.
>>> >
>>>
>>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/AM0PR05MB60188F8CE4254465566F345BA90B9%40AM0PR05MB6018.eurprd=
05.prod.outlook.com.

--_000_AM0PR05MB60188F8CE4254465566F345BA90B9AM0PR05MB6018eurp_
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
Hi Ralf,<br>
<br>
Thanks a lot for the help!</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
The missing entries are for AMD IOMMU (they appear&nbsp;</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
in /proc/iommu tree, but for some reason the jailhouse</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
config script is not adding them to sysconfig.c).</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
I also had to add amd_iommu=3Dfalse to the kernel cmdline.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
Now the jailhouse is correctly created with no issues, and&nbsp;</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
the Linux on the&nbsp;<span style=3D"color: rgb(0, 0, 0); font-family: Cali=
bri, Arial, Helvetica, sans-serif; font-size: 12pt;">root cell works&nbsp;<=
/span><span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helv=
etica, sans-serif; font-size: 12pt;">perfectly.</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica,=
 sans-serif; font-size: 12pt;"><br>
</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica,=
 sans-serif; font-size: 12pt;">I wanted to try creating another cell using =
the demo provided&nbsp;</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica,=
 sans-serif; font-size: 12pt;">by&nbsp;</span><span style=3D"color: rgb(0, =
0, 0); font-family: Calibri, Arial, Helvetica, sans-serif; font-size: 12pt;=
">configs/x86/apic-demo.c (since it's very
 simple), but it always&nbsp;</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica,=
 sans-serif; font-size: 12pt;">generates a PIO&nbsp;</span><span style=3D"c=
olor: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt;">read error.</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica,=
 sans-serif; font-size: 12pt;"><br>
</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica,=
 sans-serif; font-size: 12pt;">The PIO address is for UART (0x2f9). This ad=
dress exists in a&nbsp;</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica,=
 sans-serif; font-size: 12pt;">PIO_RANGE&nbsp;</span><span style=3D"color: =
rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt;">in apic-demo.c and it also exists
 on the root cell's&nbsp;</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica,=
 sans-serif; font-size: 12pt;">sysconfig.c, so it should&nbsp;</span><span =
style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica, sans-=
serif; font-size: 12pt;">work, but here we
 are.</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica,=
 sans-serif; font-size: 12pt;"><br>
</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica,=
 sans-serif; font-size: 12pt;">Here is the log that I get after running:&nb=
sp;</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica,=
 sans-serif; font-size: 12pt;"><span style=3D"background-color:rgb(255, 255=
, 255);display:inline !important" class=3D"ContentPasted1">jailhouse cell c=
reate configs/x86/apic-demo.cell</span></span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica,=
 sans-serif; font-size: 12pt;">it shows both hypervisor and&nbsp;</span><sp=
an style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica, sa=
ns-serif; font-size: 12pt;">Linux output.
 I also</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica,=
 sans-serif; font-size: 12pt;">attached apic-demo.c for reference.&nbsp;</s=
pan></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica,=
 sans-serif; font-size: 12pt;" class=3D"ContentPasted0">Page pool usage aft=
er late setup: mem 1934/7635, remap 65703/131072
<div class=3D"ContentPasted0">Activating hypervisor</div>
<div class=3D"ContentPasted0">[ &nbsp;698.582280] jailhouse: enter_hypvisor=
 called on every cpu</div>
<div class=3D"ContentPasted0">[ &nbsp;698.587918] jailhouse: console unmapp=
ed</div>
<div class=3D"ContentPasted0">[ &nbsp;698.591942] jailhouse: firmware relea=
sed</div>
<div class=3D"ContentPasted0">[ &nbsp;698.595998] jailhouse: root cell regi=
stered</div>
<div class=3D"ContentPasted0">[ &nbsp;698.600313] jailhouse: pci virtual ro=
ot device added</div>
<div class=3D"ContentPasted0">[ &nbsp;698.604973] hpet_rtc_timer_reinit: 5 =
callbacks suppressed</div>
<div class=3D"ContentPasted0">[ &nbsp;698.604977] hpet: Lost 5719 RTC inter=
rupts</div>
<div class=3D"ContentPasted0">[ &nbsp;698.605434] The Jailhouse is opening.=
</div>
<div class=3D"ContentPasted0">[ &nbsp;733.204370] jailhouse: pci setup done=
</div>
<div class=3D"ContentPasted0">[ &nbsp;733.283290] IRQ fixup: irq 789 move i=
n progress, old vector 39</div>
<div class=3D"ContentPasted0">[ &nbsp;733.289163] IRQ 789: no longer affine=
 to CPU3</div>
<div class=3D"ContentPasted0">[ &nbsp;733.294892] smpboot: CPU 3 is now off=
line</div>
<div class=3D"ContentPasted0">Created cell &quot;apic-demo&quot;</div>
<div class=3D"ContentPasted0">Page pool usage after cell creation: mem 1949=
/7635, remap 65703/131072</div>
<div class=3D"ContentPasted0">AFATAL: Invalid PIO read, port: 2f9 size: 1</=
div>
<div class=3D"ContentPasted0">RIP: 0xffffffff999b2683 RSP: 0xffffa0f68d627c=
98 FLAGS: 6</div>
<div class=3D"ContentPasted0">RAX: 0xffffffff999b2670 RBX: 0x00000000000002=
47 RCX: 0x0000000000000000</div>
<div class=3D"ContentPasted0">RDX: 0x00000000000002f9 RSI: 0x00000000000000=
01 RDI: 0xffffffff9b3da9f8</div>
<div class=3D"ContentPasted0">CS: 10 BASE: 0x0000000000000000 AR-BYTES: 29b=
 EFER.LMA 1</div>
<div class=3D"ContentPasted0">CR0: 0x0000000080050033 CR3: 0x0000003082bea0=
00 CR4: 0x00000000003506a0</div>
<div class=3D"ContentPasted0">EFER: 0x0000000000001d01</div>
<div class=3D"ContentPasted0">Parking CPU 29 (Cell: &quot;RootCell&quot;)</=
div>
<div class=3D"ContentPasted0">FATAL: Invalid PIO read, port: 2fa size: 1</d=
iv>
<div class=3D"ContentPasted0">RIP: 0xffffffff999b2683 RSP: 0xffffa0f68d450f=
08 FLAGS: 6</div>
<div class=3D"ContentPasted0">RAX: 0xffffffff999b2670 RBX: 0xffffffff9b3da9=
f8 RCX: 0x0000000000000000</div>
<div class=3D"ContentPasted0">RDX: 0x00000000000002fa RSI: 0x00000000000000=
02 RDI: 0xffffffff9b3da9f8</div>
<div class=3D"ContentPasted0">CS: 10 BASE: 0x0000000000000000 AR-BYTES: 29b=
 EFER.LMA 1</div>
<div class=3D"ContentPasted0">CR0: 0x0000000080050033 CR3: 0x0000002085c360=
00 CR4: 0x00000000003506a0</div>
<div class=3D"ContentPasted0">EFER: 0x0000000000001d01</div>
Parking CPU 64 (Cell: &quot;RootCell&quot;)<br>
</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica,=
 sans-serif; font-size: 12pt;"><br>
</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica,=
 sans-serif; font-size: 12pt;"><br>
</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica,=
 sans-serif; font-size: 12pt;">Cheers</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica,=
 sans-serif; font-size: 12pt;">Karim</span></div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Ralf Ramsauer &lt;ral=
f.ramsauer@oth-regensburg.de&gt;<br>
<b>Sent:</b> 18 November 2022 20:18<br>
<b>To:</b> Karim Manaouil &lt;Karim.Manaouil@ed.ac.uk&gt;<br>
<b>Cc:</b> jan.kiszka@siemens.com &lt;jan.kiszka@siemens.com&gt;; Henning S=
child &lt;henning.schild@siemens.com&gt;; jailhouse-dev@googlegroups.com &l=
t;jailhouse-dev@googlegroups.com&gt;<br>
<b>Subject:</b> Re: [EXT] Re: Jailhouse: enter_hypervisor returns -ENOMEM</=
font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">This email was sent to you by someone outside the =
University.<br>
You should only click on links or attachments if you are certain that the e=
mail is genuine and the content is safe.<br>
<br>
Hi Karim,<br>
<br>
On 18/11/2022 19:27, Karim Manaouil wrote:<br>
&gt; Hi Ralf,<br>
&gt;<br>
&gt; Thanks! I appreciate your help!<br>
&gt;<br>
&gt; I disabled MCE to get rid of the unhandled MSR read error. It works.<b=
r>
&gt;<br>
&gt; I also fixed the PCIe 04:00.0 invalid write to reg 0xb4 by manually ad=
ding<br>
<br>
Okay, take care that if you manually add an entry that you need to<br>
adjust the array size and their references.<br>
<br>
&gt; a capability entry to sysconfig.c giving it write permissions (btw, th=
e<br>
&gt; entry<br>
&gt; for that register was not generated by the config tool).<br>
<br>
Not everything is covered by the generator, some parts require manual<br>
inspection.<br>
<br>
&gt;<br>
&gt; Now, I am still getting the invalid MMIO/RAM read and write (see log b=
elow).<br>
&gt; I first get the read error immediately after the page pool message<br>
&gt; is printed. Then after a little while, the write error follows up.<br>
<br>
Now we need to inspect /proc/iomem. You need to check what is behind<br>
address 0x90482020, and add an appropriate memory region entry to your<br>
config.<br>
<br>
&nbsp;&nbsp; Ralf<br>
<br>
&gt;<br>
&gt; Always same case, immediate read error followed by a write error.<br>
&gt; it happens every time (but the addresses change).<br>
&gt;<br>
&gt; Here is below the last log from jailhouse copy pasted.<br>
&gt; I also attached the output of lspci -vvv as well as sysconfig.c.<br>
&gt;<br>
&gt; Cheers<br>
&gt; Karim<br>
&gt;<br>
&gt; Page pool usage after late setup: mem 1927/7635, remap 65703/131072<br=
>
&gt; FATAL: Invalid MMIO/RAM read, addr: 0x0000000090482020 size: 4<br>
&gt; RIP: 0xffffffff915d1735 RSP: 0xffffa9b08e97be18 FLAGS: 296<br>
&gt; RAX: 0xffffa9b080780000 RBX: 0xffff934f4262a7c0 RCX: 0x000000000000000=
0<br>
&gt; RDX: 0xffff934f47e32f10 RSI: 0xffff934f4004e800 RDI: 0x000000000000002=
1<br>
&gt; CS: 10 BASE: 0x0000000000000000 AR-BYTES: 29b EFER.LMA 1<br>
&gt; CR0: 0x0000000080050033 CR3: 0x00000020c2682000 CR4: 0x00000000003506a=
0<br>
&gt; EFER: 0x0000000000001d01<br>
&gt; Parking CPU 7 (Cell: &quot;RootCell&quot;)<br>
&gt; Ignoring NMI IPI to CPU 88<br>
&gt; Ignoring NMI IPI to CPU 88<br>
&gt; FATAL: Invalid MMIO/RAM write, addr: 0x0000000093a82008 size: 4<br>
&gt; RIP: 0xffffffff915ccce7 RSP: 0xffffa9b08db54da0 FLAGS: 2<br>
&gt; RAX: 0xffffa9b080380000 RBX: 0x0000000000000001 RCX: 0x0000000000001a7=
0<br>
&gt; RDX: 0xffff9376c0004000 RSI: 0x3000004500000000 RDI: 0x7ffffffffffff00=
3<br>
&gt; CS: 10 BASE: 0x0000000000000000 AR-BYTES: 29b EFER.LMA 1<br>
&gt; CR0: 0x0000000080050033 CR3: 0x00000001267d0000 CR4: 0x00000000003506a=
0<br>
&gt; EFER: 0x0000000000001d01<br>
&gt; Parking CPU 81 (Cell: &quot;RootCell&quot;)<br>
&gt; Ignoring NMI IPI to CPU 88<br>
&gt; Ignoring NMI IPI to CPU 88<br>
&gt; Ignoring NMI IPI to CPU 88<br>
&gt;<br>
&gt;<br>
&gt; ----------------------------------------------------------------------=
--<br>
&gt; *From:* Ralf Ramsauer &lt;ralf.ramsauer@oth-regensburg.de&gt;<br>
&gt; *Sent:* 18 November 2022 16:23<br>
&gt; *To:* Karim Manaouil &lt;Karim.Manaouil@ed.ac.uk&gt;; Henning Schild<b=
r>
&gt; &lt;henning.schild@siemens.com&gt;<br>
&gt; *Cc:* jan.kiszka@siemens.com &lt;jan.kiszka@siemens.com&gt;;<br>
&gt; jailhouse-dev@googlegroups.com &lt;jailhouse-dev@googlegroups.com&gt;<=
br>
&gt; *Subject:* Re: [EXT] Re: Jailhouse: enter_hypervisor returns -ENOMEM<b=
r>
&gt; This email was sent to you by someone outside the University.<br>
&gt; You should only click on links or attachments if you are certain that<=
br>
&gt; the email is genuine and the content is safe.<br>
&gt;<br>
&gt; Hi,<br>
&gt;<br>
&gt; On 18/11/2022 02:19, Karim Manaouil wrote:<br>
&gt;&gt; Hi Henning,<br>
&gt;&gt;<br>
&gt;&gt; I spent some more time debugging the issue.<br>
&gt;&gt; I am getting a &quot;FATAL: Invalid MMIO/RAM write&quot;.<br>
&gt;&gt; Probably it's happening right after the first cpu that<br>
&gt;&gt; calls arch_cpu_activate_mm() in hypervisor/setup.c:entry().<br>
&gt;&gt;<br>
&gt;&gt; Not sure why, but maybe you have some pointers.<br>
&gt;&gt;<br>
&gt;&gt; Here is the jailhouse output copy-pasted below.<br>
&gt;&gt;<br>
&gt;&gt; Cheers<br>
&gt;&gt;<br>
&gt;&gt; Initializing Jailhouse hypervisor v0.12 (314-gc7a1b697-dirty) on C=
PU 6<br>
&gt;&gt; Code location: 0xfffffffff0000050<br>
&gt;&gt; Using xAPIC<br>
&gt;&gt; Page pool usage after early setup: mem 813/7635, remap 1/131072<br=
>
&gt;&gt; Initializing processors:<br>
&gt;<br>
&gt; Ok, having read your log, you have (at the moment) at least two issues=
:<br>
&gt;<br>
&gt; First:<br>
&gt;<br>
&gt;&nbsp;&nbsp; &gt; FATAL: Invalid PCI config write, device 04:00.0, reg:=
 0xb4, size: 2<br>
&gt;<br>
&gt; For the moment, go to your config and allow write access to that<br>
&gt; capability. I could maybe help you with this if you share your config.=
<br>
&gt; Please also attach lspci -vvv.<br>
&gt;<br>
&gt; I can send you the config diff, and in the long run, you need to<br>
&gt; understand what the changes mean.<br>
&gt;<br>
&gt; Second:<br>
&gt;<br>
&gt;&nbsp;&nbsp; &gt; FATAL: Unhandled MSR read: c0002001<br>
&gt;<br>
&gt; That's MSR_AMD64_SMCA_MC0_STATUS. For the moment, disable Machine Chec=
k<br>
&gt; Events (MCE) in your kernel config or add appropriate parameters to yo=
ur<br>
&gt; kernel to disable them.<br>
&gt;<br>
&gt; Disable CONFIG_X86_MCE_{INTEL,AMD} in .config, or try adding mce=3Doff=
 to<br>
&gt; your kernel parameters.<br>
&gt;<br>
&gt; HTH,<br>
&gt;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; Ralf<br>
&gt;<br>
&gt;&gt;&nbsp;&nbsp; CPU 6... (APIC ID 48) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 64... (APIC ID 1) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 0... (APIC ID 0) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 16... (APIC ID 2) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 112... (APIC ID 7) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 104... (APIC ID 13) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 40... (APIC ID 12) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 72... (APIC ID 9) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 8... (APIC ID 8) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 56... (APIC ID 14) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 120... (APIC ID 15) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 110... (APIC ID 61) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 46... (APIC ID 60) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 14... (APIC ID 56) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 78... (APIC ID 57) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 94... (APIC ID 59) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 30... (APIC ID 58) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 126... (APIC ID 63) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 62... (APIC ID 62) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 2... (APIC ID 16) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 66... (APIC ID 17) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 18... (APIC ID 18) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 82... (APIC ID 19) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 114... (APIC ID 23) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 50... (APIC ID 22) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 98... (APIC ID 21) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 34... (APIC ID 20) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 12... (APIC ID 40) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 76... (APIC ID 41) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 60... (APIC ID 46) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 124... (APIC ID 47) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 44... (APIC ID 44) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 108... (APIC ID 45) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 92... (APIC ID 43) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 28... (APIC ID 42) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 26... (APIC ID 26) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 90... (APIC ID 27) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 74... (APIC ID 25) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 10... (APIC ID 24) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 106... (APIC ID 29) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 42... (APIC ID 28) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 58... (APIC ID 30) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 122... (APIC ID 31) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 20... (APIC ID 34) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 84... (APIC ID 35) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 36... (APIC ID 36) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 100... (APIC ID 37) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 116... (APIC ID 39) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 52... (APIC ID 38) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 4... (APIC ID 32) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 68... (APIC ID 33) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 96... (APIC ID 5) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 32... (APIC ID 4) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 88... (APIC ID 11) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 55... (APIC ID 118) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 119... (APIC ID 119) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 87... (APIC ID 115) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 23... (APIC ID 114) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 71... (APIC ID 113) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 7... (APIC ID 112) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 39... (APIC ID 116) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 103... (APIC ID 117) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 47... (APIC ID 124) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 111... (APIC ID 125) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 15... (APIC ID 120) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 79... (APIC ID 121) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 31... (APIC ID 122) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 95... (APIC ID 123) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 127... (APIC ID 127) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 63... (APIC ID 126) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 86... (APIC ID 51) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 22... (APIC ID 50) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 38... (APIC ID 52) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 102... (APIC ID 53) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 118... (APIC ID 55) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 54... (APIC ID 54) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 70... (APIC ID 49) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 109... (APIC ID 109) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 45... (APIC ID 108) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 93... (APIC ID 107) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 29... (APIC ID 106) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 13... (APIC ID 104) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 77... (APIC ID 105) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 61... (APIC ID 110) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 125... (APIC ID 111) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 5... (APIC ID 96) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 101... (APIC ID 101) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 37... (APIC ID 100) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 85... (APIC ID 99) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 21... (APIC ID 98) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 117... (APIC ID 103) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 53... (APIC ID 102) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 69... (APIC ID 97) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 49... (APIC ID 70) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 1... (APIC ID 64) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 65... (APIC ID 65) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 81... (APIC ID 67) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 17... (APIC ID 66) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 97... (APIC ID 69) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 33... (APIC ID 68) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 113... (APIC ID 71) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 25... (APIC ID 74) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 89... (APIC ID 75) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 41... (APIC ID 76) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 105... (APIC ID 77) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 9... (APIC ID 72) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 73... (APIC ID 73) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 121... (APIC ID 79) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 57... (APIC ID 78) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 3... (APIC ID 80) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 67... (APIC ID 81) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 35... (APIC ID 84) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 99... (APIC ID 85) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 115... (APIC ID 87) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 51... (APIC ID 86) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 19... (APIC ID 82) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 83... (APIC ID 83) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 107... (APIC ID 93) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 43... (APIC ID 92) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 11... (APIC ID 88) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 75... (APIC ID 89) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 123... (APIC ID 95) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 59... (APIC ID 94) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 27... (APIC ID 90) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 24... (APIC ID 10) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 80... (APIC ID 3) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 48... (APIC ID 6) OK<br>
&gt;&gt;&nbsp;&nbsp; CPU 91... (APIC ID 91) OK<br>
&gt;&gt; Initializing unit: AMD IOMMU<br>
&gt;&gt; AMD IOMMU @0xa1700000/0x80000<br>
&gt;&gt; Initializing unit: IOAPIC<br>
&gt;&gt; Initializing unit: PCI<br>
&gt;&gt; Adding PCI device 00:00.0 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 00:01.0 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 00:01.1 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 00:01.3 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 00:01.4 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 00:02.0 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 00:03.0 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 00:04.0 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 00:07.0 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 00:07.1 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 00:08.0 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 00:08.1 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 00:14.0 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 00:14.3 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 00:18.0 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 00:18.1 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 00:18.2 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 00:18.3 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 00:18.4 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 00:18.5 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 00:18.6 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 00:18.7 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 00:19.0 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 00:19.1 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 00:19.2 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 00:19.3 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 00:19.4 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 00:19.5 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 00:19.6 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 00:19.7 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 00:1a.0 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 00:1a.1 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 00:1a.2 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 00:1a.3 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 00:1a.4 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 00:1a.5 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 00:1a.6 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 00:1a.7 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 00:1b.0 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 00:1b.1 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 00:1b.2 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 00:1b.3 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 00:1b.4 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 00:1b.5 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 00:1b.6 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 00:1b.7 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 00:1c.0 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 00:1c.1 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 00:1c.2 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 00:1c.3 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 00:1c.4 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 00:1c.5 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 00:1c.6 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 00:1c.7 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 00:1d.0 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 00:1d.1 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 00:1d.2 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 00:1d.3 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 00:1d.4 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 00:1d.5 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 00:1d.6 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 00:1d.7 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 00:1e.0 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 00:1e.1 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 00:1e.2 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 00:1e.3 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 00:1e.4 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 00:1e.5 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 00:1e.6 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 00:1e.7 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 00:1f.0 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 00:1f.1 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 00:1f.2 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 00:1f.3 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 00:1f.4 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 00:1f.5 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 00:1f.6 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 00:1f.7 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 01:00.0 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 01:00.1 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 02:00.0 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 03:00.0 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 04:00.0 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 04:00.1 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 05:00.0 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 05:00.2 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 05:00.3 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 06:00.0 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 06:00.1 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 06:00.2 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 20:00.0 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 20:00.2 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 20:01.0 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 20:01.1 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 20:02.0 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 20:03.0 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 20:04.0 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 20:07.0 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 20:07.1 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 20:08.0 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 20:08.1 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 21:00.0 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 21:00.1 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 22:08.0 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 23:00.0 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 24:00.0 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 24:00.2 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 24:00.3 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 25:00.0 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 25:00.1 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 40:00.0 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 40:00.2 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 40:01.0 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 40:02.0 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 40:03.0 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 40:03.1 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 40:04.0 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 40:07.0 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 40:07.1 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 40:08.0 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 40:08.1 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 41:00.0 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 41:00.1 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 42:00.0 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 42:00.2 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 43:00.0 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 43:00.1 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 60:00.0 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 60:00.2 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 60:01.0 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 60:02.0 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 60:03.0 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 60:03.1 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 60:04.0 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 60:07.0 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 60:07.1 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 60:08.0 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 60:08.1 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 61:00.0 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 62:00.0 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 62:00.2 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 63:00.0 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 63:00.1 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 80:00.0 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 80:00.2 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 80:01.0 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 80:02.0 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 80:03.0 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 80:04.0 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 80:07.0 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 80:07.1 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 80:08.0 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 80:08.1 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 81:00.0 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 81:00.2 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 82:00.0 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device 82:00.1 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device a0:00.0 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device a0:00.2 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device a0:01.0 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device a0:02.0 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device a0:03.0 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device a0:04.0 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device a0:07.0 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device a0:07.1 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device a0:08.0 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device a0:08.1 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device a1:00.0 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device a1:00.2 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device a2:00.0 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device a2:00.1 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device c0:00.0 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device c0:00.2 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device c0:01.0 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device c0:02.0 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device c0:03.0 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device c0:03.1 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device c0:03.2 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device c0:03.3 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device c0:03.4 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device c0:04.0 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device c0:07.0 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device c0:07.1 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device c0:08.0 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device c0:08.1 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device c1:00.0 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device c2:00.0 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device c3:00.0 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device c4:00.0 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device c5:00.0 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device c5:00.2 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device c6:00.0 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device c6:00.1 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device e0:00.0 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device e0:00.2 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device e0:01.0 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device e0:02.0 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device e0:03.0 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device e0:04.0 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device e0:07.0 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device e0:07.1 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device e0:08.0 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device e0:08.1 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device e1:00.0 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device e1:00.2 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device e2:00.0 to cell &quot;RootCell&quot;<br>
&gt;&gt; Adding PCI device e2:00.1 to cell &quot;RootCell&quot;<br>
&gt;&gt; Page pool usage after late setup: mem 1927/7635, remap 65703/13107=
2<br>
&gt;&gt; FATAL: Invalid MMIO/RAM write, addr: 0x00000000a1702008 size: 4<br=
>
&gt;&gt; RIP: 0xffffffffa79d7777 RSP: 0xffffa2f7cda78de0 FLAGS: 6<br>
&gt;&gt; RAX: 0xffffa2f7c0080000 RBX: 0x0000000000000001 RCX: 0x00000000000=
00030<br>
&gt;&gt; RDX: 0xffff90d18000a000 RSI: 0x3000001700000000 RDI: 0x7ffffffffff=
ff003<br>
&gt;&gt; CS: 10 BASE: 0x0000000000000000 AR-BYTES: 29b EFER.LMA 1<br>
&gt;&gt; CR0: 0x0000000080050033 CR3: 0x000000014487c000 CR4: 0x00000000003=
506e0<br>
&gt;&gt; EFER: 0x0000000000001d01<br>
&gt;&gt; Parking CPU 76 (Cell: &quot;RootCell&quot;)<br>
&gt;&gt; Ignoring NMI IPI to CPU 1<br>
&gt;&gt; Ignoring NMI IPI to CPU 2<br>
&gt;&gt; Ignoring NMI IPI to CPU 3<br>
&gt;&gt; Ignoring NMI IPI to CPU 4<br>
&gt;&gt; Ignoring NMI IPI to CPU 5<br>
&gt;&gt; Ignoring NMI IPI to CPU 6<br>
&gt;&gt; Ignoring NMI IPI to CPU 7<br>
&gt;&gt; Ignoring NMI IPI to CPU 76<br>
&gt;&gt; Ignoring NMI IPI to CPU 1<br>
&gt;&gt; Ignoring NMI IPI to CPU 2<br>
&gt;&gt; Ignoring NMI IPI to CPU 3<br>
&gt;&gt; Ignoring NMI IPI to CPU 4<br>
&gt;&gt; Ignoring NMI IPI to CPU 5<br>
&gt;&gt; Ignoring NMI IPI to CPU 6<br>
&gt;&gt; Ignoring NMI IPI to CPU 7<br>
&gt;&gt; Ignoring NMI IPI to CPU 76<br>
&gt;&gt; Ignoring NMI IPI to CPU 1<br>
&gt;&gt; Ignoring NMI IPI to CPU 2<br>
&gt;&gt; Ignoring NMI IPI to CPU 3<br>
&gt;&gt; Ignoring NMI IPI to CPU 4<br>
&gt;&gt; Ignoring NMI IPI to CPU 5<br>
&gt;&gt; FATAL: Invalid PCI config write, device 04:00.0, reg: 0xb4, size: =
2<br>
&gt;&gt; RIP: 0xffffffffa7c52b3d RSP: 0xffffa2f7ce99bd98 FLAGS: 46<br>
&gt;&gt; RAX: 0x000000000000242e RBX: 0x0000000000000000 RCX: 0x00000000000=
000b4<br>
&gt;&gt; RDX: 0x0000000000000cfc RSI: 0x0000000000000216 RDI: 0xffffffffa94=
01790<br>
&gt;&gt; CS: 10 BASE: 0x0000000000000000 AR-BYTES: 29b EFER.LMA 1<br>
&gt;&gt; CR0: 0x0000000080050033 CR3: 0x0000003b99810000 CR4: 0x00000000003=
506e0<br>
&gt;&gt; EFER: 0x0000000000001d01<br>
&gt;&gt; Parking CPU 24 (Cell: &quot;RootCell&quot;)<br>
&gt;&gt; Ignoring NMI IPI to CPU 6<br>
&gt;&gt; Ignoring NMI IPI to CPU 7<br>
&gt;&gt; FATAL: Unhandled MSR read: c0002001<br>
&gt;&gt; RIP: 0xffffffffa7c951cd RSP: 0xffffa2f7cd918e08 FLAGS: 246<br>
&gt;&gt; RAX: 0x00000000c0002000 RBX: 0xffff90e15fc11020 RCX: 0x00000000c00=
02001<br>
&gt;&gt; RDX: 0x0000000000000000 RSI: 0xffffa2f7cd918df0 RDI: 0x00000000c00=
02001<br>
&gt;&gt; CS: 10 BASE: 0x0000000000000000 AR-BYTES: 29b EFER.LMA 1<br>
&gt;&gt; CR0: 0x0000000080050033 CR3: 0x00000018a6a46000 CR4: 0x00000000003=
506e0<br>
&gt;&gt; EFER: 0x0000000000001d01<br>
&gt;&gt; Parking CPU 68 (Cell: &quot;RootCell&quot;)<br>
&gt;&gt; FATAL: Unhandled MSR read: c0002001<br>
&gt;&gt; RIP: 0xffffffffa7c951cd RSP: 0xffffa2f7cd4f8e08 FLAGS: 246<br>
&gt;&gt; RAX: 0x00000000c0002000 RBX: 0xffff90e15fb51020 RCX: 0x00000000c00=
02001<br>
&gt;&gt; RDX: 0x0000000000000000 RSI: 0xffffa2f7cd4f8df0 RDI: 0x00000000c00=
02001<br>
&gt;&gt; CS: 10 BASE: 0x0000000000000000 AR-BYTES: 29b EFER.LMA 1<br>
&gt;&gt; CR0: 0x0000000080050033 CR3: 0x0000002081eaa000 CR4: 0x00000000003=
506e0<br>
&gt;&gt; EFER: 0x0000000000001d01<br>
&gt;&gt; Parking CPU 44 (Cell: &quot;RootCell&quot;)<br>
&gt;&gt;<br>
&gt;&gt; ------------------------------------------------------------------=
------<br>
&gt;&gt; *From:* Henning Schild &lt;henning.schild@siemens.com&gt;<br>
&gt;&gt; *Sent:* 14 November 2022 09:22<br>
&gt;&gt; *To:* Karim Manaouil &lt;Karim.Manaouil@ed.ac.uk&gt;<br>
&gt;&gt; *Cc:* Ralf Ramsauer &lt;ralf.ramsauer@oth-regensburg.de&gt;;<br>
&gt;&gt; jan.kiszka@siemens.com &lt;jan.kiszka@siemens.com&gt;;<br>
&gt;&gt; jailhouse-dev@googlegroups.com &lt;jailhouse-dev@googlegroups.com&=
gt;<br>
&gt;&gt; *Subject:* Re: Jailhouse: enter_hypervisor returns -ENOMEM<br>
&gt;&gt; This email was sent to you by someone outside the University.<br>
&gt;&gt; You should only click on links or attachments if you are certain t=
hat<br>
&gt;&gt; the email is genuine and the content is safe.<br>
&gt;&gt;<br>
&gt;&gt; Am Sun, 13 Nov 2022 22:24:45 +0000<br>
&gt;&gt; schrieb Karim Manaouil &lt;Karim.Manaouil@ed.ac.uk&gt;:<br>
&gt;&gt;<br>
&gt;&gt;&gt; Hi Ralf,<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Thanks for the reply!<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; &gt;Did you use jailhouse-config-create?<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I am using `jailhouse config create` to generate the sysconfig=
.c file.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; &gt;You can use the --mem-hv option to<br>
&gt;&gt;&gt; increate the memory. Try, for example, 32MiB and see if it wor=
ks.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I tried with 32MiB. It worked. I am not getting -ENOMEM anymor=
e.<br>
&gt;&gt;&gt; The driver prints &quot;The Jailhouse is opening&quot; on dmes=
g. However, right<br>
&gt;&gt;&gt; after that the CPUs get stuck, and I get rcu_sched detected st=
alls.<br>
&gt;&gt;&gt; The system is completely irresponsive.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I attached a text file containing the full output from dmesg. =
Here is<br>
&gt;&gt;&gt; the initial part:<br>
&gt;&gt;<br>
&gt;&gt; I guess the output of the hypervisor might also be valuable here.<=
br>
&gt;&gt; According to its spec that machine should have a serial port, and =
with<br>
&gt;&gt; that default config from the generate script you should see logs c=
oming<br>
&gt;&gt; out of there. With the usual 115200 8n1<br>
&gt;&gt;<br>
&gt;&gt; Henning<br>
&gt;&gt;<br>
&gt;&gt;&gt; [&nbsp; 434.792008] The Jailhouse is opening.<br>
&gt;&gt;&gt; [&nbsp; 455.787315] rcu: INFO: rcu_sched detected stalls on CP=
Us/tasks:<br>
&gt;&gt;&gt; [&nbsp; 455.793303] rcu:&nbsp;&nbsp;&nbsp;&nbsp; 1-...0: (839 =
GPs behind)<br>
&gt;&gt;&gt; idle=3Dc2a/1/0x4000000000000000 softirq=3D681/681 fqs=3D1827 [=
&nbsp; 455.802292]<br>
&gt;&gt;&gt; rcu:&nbsp;&nbsp;&nbsp;&nbsp; 2-...0: (144 GPs behind) idle=3D8=
12/1/0x4000000000000000<br>
&gt;&gt;&gt; softirq=3D905/905 fqs=3D1827 [&nbsp; 455.811276] rcu:&nbsp;&nb=
sp;&nbsp;&nbsp; 3-...0: (144 GPs<br>
&gt;&gt;&gt; behind) idle=3Deaa/1/0x4000000000000000 softirq=3D719/719 fqs=
=3D1827 [<br>
&gt;&gt;&gt; 455.820266] rcu:&nbsp;&nbsp;&nbsp;&nbsp; 4-...0: (1 GPs behind=
)<br>
&gt;&gt;&gt; idle=3Dc2e/1/0x4000000000000000 softirq=3D1324/1324 fqs=3D1827=
 [<br>
&gt;&gt;&gt; 455.829252] rcu:&nbsp;&nbsp;&nbsp;&nbsp; 5-...0: (144 GPs behi=
nd)<br>
&gt;&gt;&gt; idle=3D41a/1/0x4000000000000000 softirq=3D556/556 fqs=3D1827 [=
&nbsp; 455.838238]<br>
&gt;&gt;&gt; rcu:&nbsp;&nbsp;&nbsp;&nbsp; 6-...0: (144 GPs behind) idle=3D9=
12/1/0x4000000000000000<br>
&gt;&gt;&gt; softirq=3D777/777 fqs=3D1827 [&nbsp; 455.847218] rcu:&nbsp;&nb=
sp;&nbsp;&nbsp; 7-...0: (144 GPs<br>
&gt;&gt;&gt; behind) idle=3D5e6/1/0x4000000000000000 softirq=3D2409/2410 fq=
s=3D1827 [<br>
&gt;&gt;&gt; 455.856404]&nbsp; (detected by 87, t=3D5253 jiffies, g=3D48537=
, q=3D364) [<br>
&gt;&gt;&gt; 455.862170] Sending NMI from CPU 87 to CPUs 1: [&nbsp; 465.776=
884] Sending<br>
&gt;&gt;&gt; NMI from CPU 87 to CPUs 2: [&nbsp; 467.182686] watchdog: BUG: =
soft lockup<br>
&gt;&gt;&gt; - CPU#0 stuck for 23s! [kworker/0:1:7] [&nbsp; 467.189857] Mod=
ules linked<br>
&gt;&gt;&gt; in: jailhouse(O) nf_conntrack_netlink xfrm_user xt_addrtype<br=
>
&gt;&gt;&gt; br_netfilter xt_CHECKSUM xt_MASQUERADE xt_conntrack ipt_REJECT=
<br>
&gt;&gt;&gt; nf_reject_ipv4 xt_tcpudp nft_compat nft_chain_nat nf_natp [<br=
>
&gt;&gt;&gt; 467.189928]&nbsp; binfmt_misc configfs efivarfs ip_tables x_ta=
bles autofs4<br>
&gt;&gt;&gt; ext4 crc16 mbcache jbd2 raid10 raid456 libcrc32c crc32c_generi=
c<br>
&gt;&gt;&gt; async_raid6_recov async_memcpy async_pq async_xor xor async_tx=
<br>
&gt;&gt;&gt; raid6_pq ] [&nbsp; 467.320567] CPU: 0 PID: 7 Comm: kworker/0:1=
 Tainted: G<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; O&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; 5.10.0 #3 [&nbsp; 467.328767] Hardware name: Dell I=
nc.<br>
&gt;&gt;&gt; PowerEdge R7425/08V001, BIOS 1.15.0 09/11/2020 [&nbsp; 467.337=
154]<br>
&gt;&gt;&gt; Workqueue: events drm_fb_helper_dirty_work [drm_kms_helper] [<=
br>
&gt;&gt;&gt; 467.344501] RIP: 0010:smp_call_function_many_cond+0x289/0x2d0 =
[<br>
&gt;&gt;&gt; 467.350979] Code: e8 1c 8a 39 00 3b 05 0a c1 74 01 89 c7 0f 83=
 0b fe<br>
&gt;&gt;&gt; ff ff 48 63 c7 49 8b 16 48 03 14 c5 00 d9 99 9c 8b 42 08 a8 01=
 74 09<br>
&gt;&gt;&gt; f3 90 &lt;8b&gt; 42 08 a8 01 75 f7 eb c9 48 c7 c2 20 cf 07 9d =
4c 89 fe 44 7<br>
&gt;&gt;&gt; [&nbsp; 467.371232] RSP: 0018:ffffa7d78015fcd8 EFLAGS: 0000020=
2 [<br>
&gt;&gt;&gt; 467.377220] RAX: 0000000000000011 RBX: 0000000000031280 RCX:<b=
r>
&gt;&gt;&gt; 0000000000000001 [&nbsp; 467.385123] RDX: ffff964f1fa31280 RSI=
:<br>
&gt;&gt;&gt; 0000000000000000 RDI: 0000000000000001 [&nbsp; 467.393024] RBP=
:<br>
&gt;&gt;&gt; 0000000000000000 R08: 0000000000000000 R09: 0000000000000001 [=
<br>
&gt;&gt;&gt; 467.400928] R10: 0000000000000002 R11: 0000000000000002 R12:<b=
r>
&gt;&gt;&gt; 0000000000000000 [&nbsp; 467.408836] R13: 000000000000007f R14=
:<br>
&gt;&gt;&gt; ffff962f1f42c9c0 R15: 0000000000000080 [&nbsp; 467.416737] FS:=
<br>
&gt;&gt;&gt; 0000000000000000(0000) GS:ffff962f1f400000(0000)<br>
&gt;&gt;&gt; knlGS:0000000000000000 [&nbsp; 467.425604] CS:&nbsp; 0010 DS: =
0000 ES: 0000<br>
&gt;&gt;&gt; CR0: 0000000080050033 [&nbsp; 467.432127] CR2: 000000000000000=
0 CR3:<br>
&gt;&gt;&gt; 00000010987ea000 CR4: 00000000003506f0 [&nbsp; 467.440045] Cal=
l Trace: [<br>
&gt;&gt;&gt; 467.443289]&nbsp; ? tlbflush_read_file+0x70/0x70 [&nbsp; 467.4=
48266]&nbsp; ?<br>
&gt;&gt;&gt; tlbflush_read_file+0x70/0x70 [&nbsp; 467.453242]&nbsp; on_each=
_cpu+0x2b/0x60 [<br>
&gt;&gt;&gt; 467.457437]&nbsp; __purge_vmap_area_lazy+0x5d/0x680 [&nbsp; 46=
7.462679]&nbsp; ?<br>
&gt;&gt;&gt; _cond_resched+0x16/0x40 [&nbsp; 467.467224]&nbsp; ?<br>
&gt;&gt;&gt; unmap_kernel_range_noflush+0x2fa/0x380 [&nbsp; 467.473072]<br>
&gt;&gt;&gt; free_vmap_area_noflush+0xe7/0x100 [&nbsp; 467.478315]<br>
&gt;&gt;&gt; remove_vm_area+0x96/0xa0 [&nbsp; 467.482770]&nbsp; __vunmap+0x=
8d/0x290 [<br>
&gt;&gt;&gt; 467.486792]&nbsp; drm_gem_shmem_vunmap+0x8b/0xa0 [drm] [&nbsp;=
 467.492299]<br>
&gt;&gt;&gt; drm_client_buffer_vunmap+0x16/0x20 [drm] [&nbsp; 467.498144]<b=
r>
&gt;&gt;&gt; drm_fb_helper_dirty_work+0x187/0x1b0 [drm_kms_helper] [&nbsp; =
467.505118]<br>
&gt;&gt;&gt; process_one_work+0x1b6/0x350 [&nbsp; 467.509912]&nbsp; worker_=
thread+0x53/0x3e0<br>
&gt;&gt;&gt; [&nbsp; 467.514361]&nbsp; ? process_one_work+0x350/0x350 [&nbs=
p; 467.519338]<br>
&gt;&gt;&gt; kthread+0x11b/0x140 [&nbsp; 467.523342]&nbsp; ? __kthread_bind=
_mask+0x60/0x60 [<br>
&gt;&gt;&gt;&nbsp; 467.528389]&nbsp; ret_from_fork+0x22/0x30<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Cheers<br>
&gt;&gt;&gt; Karim<br>
&gt;&gt;&gt; ________________________________<br>
&gt;&gt;&gt; From: Ralf Ramsauer &lt;ralf.ramsauer@oth-regensburg.de&gt;<br=
>
&gt;&gt;&gt; Sent: 12 November 2022 17:47<br>
&gt;&gt;&gt; To: Karim Manaouil &lt;Karim.Manaouil@ed.ac.uk&gt;; jan.kiszka=
@siemens.com<br>
&gt;&gt;&gt; &lt;jan.kiszka@siemens.com&gt; Cc: jailhouse-dev@googlegroups.=
com<br>
&gt;&gt;&gt; &lt;jailhouse-dev@googlegroups.com&gt; Subject: Re: Jailhouse:=
<br>
&gt;&gt;&gt; enter_hypervisor returns -ENOMEM<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; This email was sent to you by someone outside the University.<=
br>
&gt;&gt;&gt; You should only click on links or attachments if you are certa=
in that<br>
&gt;&gt;&gt; the email is genuine and the content is safe.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; On 12/11/2022 18:15, Karim Manaouil wrote:<br>
&gt;&gt;&gt; &gt; Hi Jan,<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; I am trying to deploy Jailhouse on an AMD EPYC with 128 C=
PUs (8 NUMA<br>
&gt;&gt;&gt; &gt; nodes), running Linux kernel v5.10 (same version used by =
jailhouse<br>
&gt;&gt;&gt; &gt; CI with same patches applied).<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; `jailhouse hardware check` return that everything is ok a=
nd that<br>
&gt;&gt;&gt; &gt; &quot;Check passed!&quot;.<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; Memory was reserved via `memmap=3D0x5200000$0x3a000000`<b=
r>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; However, enter_hypervisor() [1] fails when entry() is cal=
led on<br>
&gt;&gt;&gt; &gt; every cpu and return -ENOMEM as error_code.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Try to reserve more memory. Maybe the default size of 6MiB for=
 HV<br>
&gt;&gt;&gt; memory is insufficient for 128 CPUs.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Did you use jailhouse-config-create? You can use the --mem-hv =
option<br>
&gt;&gt;&gt; to increate the memory. Try, for example, 32MiB and see if it =
works.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; Ralf<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; Do you possibly know where could the issue come from?<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; Best<br>
&gt;&gt;&gt; &gt; Karim<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; [1]<br>
&gt;&gt;&gt; &gt; <a href=3D"https://github.com/siemens/jailhouse/blob/c7a1=
b6971ac15e4be8a0918b9bef6e2cbd99f9fc/driver/main.c#L251">
https://github.com/siemens/jailhouse/blob/c7a1b6971ac15e4be8a0918b9bef6e2cb=
d99f9fc/driver/main.c#L251</a> &lt;<a href=3D"https://github.com/siemens/ja=
ilhouse/blob/c7a1b6971ac15e4be8a0918b9bef6e2cbd99f9fc/driver/main.c#L251">h=
ttps://github.com/siemens/jailhouse/blob/c7a1b6971ac15e4be8a0918b9bef6e2cbd=
99f9fc/driver/main.c#L251</a>&gt;
 &lt;<a href=3D""></a>https://github.com/siemens/jailhouse/blob/c7a1b6971ac=
15e4be8a0918b9bef6e2cbd99f9fc/driver/main.c#L251 &lt;<a href=3D"https://git=
hub.com/siemens/jailhouse/blob/c7a1b6971ac15e4be8a0918b9bef6e2cbd99f9fc/dri=
ver/main.c#L251">https://github.com/siemens/jailhouse/blob/c7a1b6971ac15e4b=
e8a0918b9bef6e2cbd99f9fc/driver/main.c#L251</a>&gt;&gt;<br>
&gt;&gt;&gt; &gt; &lt;<a href=3D""></a>https://github.com/siemens/jailhouse=
/blob/c7a1b6971ac15e4be8a0918b9bef6e2cbd99f9fc/driver/main.c#L251 &lt;<a hr=
ef=3D""></a>https://github.com/siemens/jailhouse/blob/c7a1b6971ac15e4be8a09=
18b9bef6e2cbd99f9fc/driver/main.c#L251 &lt;<a href=3D"https://github.com/si=
emens/jailhouse/blob/c7a1b6971ac15e4be8a0918b9bef6e2cbd99f9fc/driver/main.c=
#L251">https://github.com/siemens/jailhouse/blob/c7a1b6971ac15e4be8a0918b9b=
ef6e2cbd99f9fc/driver/main.c#L251</a>&gt;&gt;&gt;<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; The University of Edinburgh is a charitable body, registe=
red in<br>
&gt;&gt;&gt; &gt; Scotland, with registration number SC005336. Is e buidhea=
nn<br>
&gt;&gt;&gt; &gt; carthannais a th=E2=80=99 ann an Oilthigh Dh=C3=B9n =C3=
=88ideann, cl=C3=A0raichte an Alba,<br>
&gt;&gt;&gt; &gt; =C3=A0ireamh cl=C3=A0raidh SC005336.<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; --<br>
&gt;&gt;&gt; &gt; You received this message because you are subscribed to t=
he Google<br>
&gt;&gt;&gt; &gt; Groups &quot;Jailhouse&quot; group.<br>
&gt;&gt;&gt; &gt; To unsubscribe from this group and stop receiving emails =
from it,<br>
&gt;&gt;&gt; &gt; send an email to jailhouse-dev+unsubscribe@googlegroups.c=
om<br>
&gt;&gt;&gt; &gt; &lt;<a href=3D""></a>mailto:jailhouse-dev+unsubscribe@goo=
glegroups.com<br>
&gt;&gt; &lt;<a href=3D""></a>mailto:jailhouse-dev+unsubscribe@googlegroups=
.com<br>
&gt; &lt;<a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">mail=
to:jailhouse-dev+unsubscribe@googlegroups.com</a>&gt;&gt;&gt;.<br>
&gt;&gt;&gt; &gt; To view this discussion on the web visit<br>
&gt;&gt;&gt; &gt; <a href=3D"https://groups.google.com/d/msgid/jailhouse-de=
v/AM0PR05MB6018F1663ABE61DA3C697CA4A9039%40AM0PR05MB6018.eurprd05.prod.outl=
ook.com">
https://groups.google.com/d/msgid/jailhouse-dev/AM0PR05MB6018F1663ABE61DA3C=
697CA4A9039%40AM0PR05MB6018.eurprd05.prod.outlook.com</a> &lt;<a href=3D"ht=
tps://groups.google.com/d/msgid/jailhouse-dev/AM0PR05MB6018F1663ABE61DA3C69=
7CA4A9039%40AM0PR05MB6018.eurprd05.prod.outlook.com">https://groups.google.=
com/d/msgid/jailhouse-dev/AM0PR05MB6018F1663ABE61DA3C697CA4A9039%40AM0PR05M=
B6018.eurprd05.prod.outlook.com</a>&gt;
 &lt;<a href=3D""></a>https://groups.google.com/d/msgid/jailhouse-dev/AM0PR=
05MB6018F1663ABE61DA3C697CA4A9039%40AM0PR05MB6018.eurprd05.prod.outlook.com=
 &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/AM0PR05MB60=
18F1663ABE61DA3C697CA4A9039%40AM0PR05MB6018.eurprd05.prod.outlook.com">http=
s://groups.google.com/d/msgid/jailhouse-dev/AM0PR05MB6018F1663ABE61DA3C697C=
A4A9039%40AM0PR05MB6018.eurprd05.prod.outlook.com</a>&gt;&gt;<br>
&gt;&gt;&gt; &gt; &lt;<a href=3D""></a>https://groups.google.com/d/msgid/ja=
ilhouse-dev/AM0PR05MB6018F1663ABE61DA3C697CA4A9039%40AM0PR05MB6018.eurprd05=
.prod.outlook.com?utm_medium=3Demail&amp;utm_source=3Dfooter &lt;<a href=3D=
""></a>https://groups.google.com/d/msgid/jailhouse-dev/AM0PR05MB6018F1663AB=
E61DA3C697CA4A9039%40AM0PR05MB6018.eurprd05.prod.outlook.com?utm_medium=3De=
mail&amp;utm_source=3Dfooter
 &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/AM0PR05MB60=
18F1663ABE61DA3C697CA4A9039%40AM0PR05MB6018.eurprd05.prod.outlook.com?utm_m=
edium=3Demail&amp;utm_source=3Dfooter">https://groups.google.com/d/msgid/ja=
ilhouse-dev/AM0PR05MB6018F1663ABE61DA3C697CA4A9039%40AM0PR05MB6018.eurprd05=
.prod.outlook.com?utm_medium=3Demail&amp;utm_source=3Dfooter</a>&gt;&gt;&gt=
;.<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;<br>
</div>
</span></font></div>
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
om/d/msgid/jailhouse-dev/AM0PR05MB60188F8CE4254465566F345BA90B9%40AM0PR05MB=
6018.eurprd05.prod.outlook.com?utm_medium=3Demail&utm_source=3Dfooter">http=
s://groups.google.com/d/msgid/jailhouse-dev/AM0PR05MB60188F8CE4254465566F34=
5BA90B9%40AM0PR05MB6018.eurprd05.prod.outlook.com</a>.<br />

--_000_AM0PR05MB60188F8CE4254465566F345BA90B9AM0PR05MB6018eurp_--

--_004_AM0PR05MB60188F8CE4254465566F345BA90B9AM0PR05MB6018eurp_
Content-Type: text/x-csrc; name="apic-demo.c"
Content-Description: apic-demo.c
Content-Disposition: attachment; filename="apic-demo.c"; size=1841;
	creation-date="Sun, 20 Nov 2022 18:44:32 GMT";
	modification-date="Sun, 20 Nov 2022 18:44:53 GMT"
Content-Transfer-Encoding: base64

LyoKICogSmFpbGhvdXNlLCBhIExpbnV4LWJhc2VkIHBhcnRpdGlvbmluZyBoeXBlcnZpc29yCiAq
CiAqIE1pbmltYWwgY29uZmlndXJhdGlvbiBmb3IgZGVtbyBpbm1hdGVzLCAxIENQVSwgMSBNQiBS
QU0sIDEgc2VyaWFsIHBvcnQKICoKICogQ29weXJpZ2h0IChjKSBTaWVtZW5zIEFHLCAyMDEzCiAq
CiAqIEF1dGhvcnM6CiAqICBKYW4gS2lzemthIDxqYW4ua2lzemthQHNpZW1lbnMuY29tPgogKgog
KiBUaGlzIHdvcmsgaXMgbGljZW5zZWQgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBHTlUgR1BMLCB2
ZXJzaW9uIDIuICBTZWUKICogdGhlIENPUFlJTkcgZmlsZSBpbiB0aGUgdG9wLWxldmVsIGRpcmVj
dG9yeS4KICovCgojaW5jbHVkZSA8amFpbGhvdXNlL3R5cGVzLmg+CiNpbmNsdWRlIDxqYWlsaG91
c2UvY2VsbC1jb25maWcuaD4KCnN0cnVjdCB7CglzdHJ1Y3QgamFpbGhvdXNlX2NlbGxfZGVzYyBj
ZWxsOwoJX191NjQgY3B1c1sxXTsKCXN0cnVjdCBqYWlsaG91c2VfbWVtb3J5IG1lbV9yZWdpb25z
WzJdOwoJc3RydWN0IGphaWxob3VzZV9jYWNoZSBjYWNoZV9yZWdpb25zWzFdOwoJc3RydWN0IGph
aWxob3VzZV9waW8gcGlvX3JlZ2lvbnNbNF07Cn0gX19hdHRyaWJ1dGVfXygocGFja2VkKSkgY29u
ZmlnID0gewoJLmNlbGwgPSB7CgkJLnNpZ25hdHVyZSA9IEpBSUxIT1VTRV9DRUxMX0RFU0NfU0lH
TkFUVVJFLAoJCS5yZXZpc2lvbiA9IEpBSUxIT1VTRV9DT05GSUdfUkVWSVNJT04sCgkJLm5hbWUg
PSAiYXBpYy1kZW1vIiwKCQkuZmxhZ3MgPSBKQUlMSE9VU0VfQ0VMTF9WSVJUVUFMX0NPTlNPTEVf
UEVSTUlUVEVELAoKCQkuY3B1X3NldF9zaXplID0gc2l6ZW9mKGNvbmZpZy5jcHVzKSwKCQkubnVt
X21lbW9yeV9yZWdpb25zID0gQVJSQVlfU0laRShjb25maWcubWVtX3JlZ2lvbnMpLAoJCS5udW1f
Y2FjaGVfcmVnaW9ucyA9IEFSUkFZX1NJWkUoY29uZmlnLmNhY2hlX3JlZ2lvbnMpLAoJCS5udW1f
aXJxY2hpcHMgPSAwLAoJCS5udW1fcGlvX3JlZ2lvbnMgPSBBUlJBWV9TSVpFKGNvbmZpZy5waW9f
cmVnaW9ucyksCgkJLm51bV9wY2lfZGV2aWNlcyA9IDAsCgoJCS5jb25zb2xlID0gewoJCQkudHlw
ZSA9IEpBSUxIT1VTRV9DT05fVFlQRV84MjUwLAoJCQkuZmxhZ3MgPSBKQUlMSE9VU0VfQ09OX0FD
Q0VTU19QSU8sCgkJCS5hZGRyZXNzID0gMHgyZjgsCgkJfSwKCX0sCgoJLmNwdXMgPSB7CgkJMHg4
LAoJfSwKCgkubWVtX3JlZ2lvbnMgPSB7CgkJLyogUkFNICovIHsKCQkJLnBoeXNfc3RhcnQgPSAw
eDNlZjAwMDAwLAoJCQkudmlydF9zdGFydCA9IDAsCgkJCS5zaXplID0gMHgwMDEwMDAwMCwKCQkJ
LmZsYWdzID0gSkFJTEhPVVNFX01FTV9SRUFEIHwgSkFJTEhPVVNFX01FTV9XUklURSB8CgkJCQlK
QUlMSE9VU0VfTUVNX0VYRUNVVEUgfCBKQUlMSE9VU0VfTUVNX0xPQURBQkxFLAoJCX0sCgkJLyog
Y29tbXVuaWNhdGlvbiByZWdpb24gKi8gewoJCQkudmlydF9zdGFydCA9IDB4MDAxMDAwMDAsCgkJ
CS5zaXplID0gMHgwMDAwMTAwMCwKCQkJLmZsYWdzID0gSkFJTEhPVVNFX01FTV9SRUFEIHwgSkFJ
TEhPVVNFX01FTV9XUklURSB8CgkJCQlKQUlMSE9VU0VfTUVNX0NPTU1fUkVHSU9OLAoJCX0sCgl9
LAoKCS5jYWNoZV9yZWdpb25zID0gewoJCXsKCQkJLnN0YXJ0ID0gMCwKCQkJLnNpemUgPSAyLAoJ
CQkudHlwZSA9IEpBSUxIT1VTRV9DQUNIRV9MMywKCQl9LAoJfSwKCgkucGlvX3JlZ2lvbnMgPSB7
CgkJUElPX1JBTkdFKDB4MmY4LCA4KSwgLyogc2VyaWFsIDIgKi8KCQlQSU9fUkFOR0UoMHgzZjgs
IDgpLCAvKiBzZXJpYWwgMSAqLwoJCVBJT19SQU5HRSgweGUwMTAsIDgpLCAvKiBPWFBDSWU5NTIg
c2VyaWFsICovCgl9LAp9Owo=

--_004_AM0PR05MB60188F8CE4254465566F345BA90B9AM0PR05MB6018eurp_--
