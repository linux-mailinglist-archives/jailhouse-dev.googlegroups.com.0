Return-Path: <jailhouse-dev+bncBAABBRG56SXQMGQEZFXIE6Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-io1-xd3b.google.com (mail-io1-xd3b.google.com [IPv6:2607:f8b0:4864:20::d3b])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF17886757
	for <lists+jailhouse-dev@lfdr.de>; Fri, 22 Mar 2024 08:09:58 +0100 (CET)
Received: by mail-io1-xd3b.google.com with SMTP id ca18e2360f4ac-7cbf3ec6a96sf267076339f.0
        for <lists+jailhouse-dev@lfdr.de>; Fri, 22 Mar 2024 00:09:58 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1711091397; cv=pass;
        d=google.com; s=arc-20160816;
        b=rBI2wz6QbNvbWWd2Ed5jgrgmiNbzkcWvRDOooPz1X2ypz94NIQbhhgclQmlwStmTWD
         YRTH+Tf+ePhCFFIT1gdAgapjk4WrI65avNVbhjHvh5x/eVEF8XLrfOv8UzZvs01SvPDo
         Ab+rkxEnioO+0RD6FIOlPhLk/qXjiKelCcel2ULYXOO//RblfOb8Ad30z0dcdeYQh/sN
         VYxM11+JmuH4FaYuPKwFp/9QOG8WbHFE6tba6RZVE2KLXvHEDhKVBqk/rDHeX5q3iQY4
         f3zhJ/yrwLb90Kfcl53bCF5tSEJcY7wvYyA7qJsylhKqBuvpFRIfOww8K8zt8tS1dbaR
         YViQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :to:from:sender:dkim-signature;
        bh=r/0xTicSaqbNJoYNPGwK9EV83ryqhkYtz9AZ7HsLaSM=;
        fh=9He9y5Oo7atqlFk7CDifGjS5jgM6l3Rs2pWo5cRxLZo=;
        b=Qc/BAJmNtUkzhy43OH1VbbZhVAYjlausRUEBPKcNef60nQYQ1oDL5BbSBscPvlRnwc
         uLgYEYNrcbTPnCy/KhQTdDwCIlv9RLbGfJqr25fGZ26DEyCbsoo+PuFFfiPyaqXzWpfG
         48xg4twWU090J3/dayFVehZYrjDCod9u4rtHRHarQamnHGXOl8zDgH77FPrbvfUjT0RP
         3A1MFRcZwurus+vvHnOAjk8zEpqxqlYCaWrd0lmGlILY+Q1EVDXZdhkKKIlYviiJ0ero
         kyxMwgqcCgch9U7vs0Itpjc+cWEYOFAi11v3AzdCtO8ndVw77AJ9tWmkIlkvm2hcr1Z7
         TvwQ==;
        darn=lfdr.de
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@rsssh.onmicrosoft.com header.s=selector1-rsssh-onmicrosoft-com header.b=fvKe5fY2;
       arc=pass (i=1 spf=pass spfdomain=rss-hamborn.de dkim=pass dkdomain=rss-hamborn.de dmarc=pass fromdomain=rss-hamborn.de);
       spf=pass (google.com: domain of s.cyklarz@rss-hamborn.de designates 2a01:111:f403:2623::700 as permitted sender) smtp.mailfrom=s.cyklarz@rss-hamborn.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1711091397; x=1711696197; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:content-language:accept-language
         :message-id:date:thread-index:thread-topic:subject:to:from:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r/0xTicSaqbNJoYNPGwK9EV83ryqhkYtz9AZ7HsLaSM=;
        b=CypMKe6q2I7INmyaxHO34+kEntbeiXIUms8vxsxzVPMNhptKE2roTuMn9JqyZrfCds
         YVfooAVEid7OXTWmHDYvCMqgrhE+v4bk4rE9GxvPm3eE2Ru78wbWUtSg132XG5dAxReL
         8IJUF24F0jlB7rjmNnVsy19erbLZ0fvTZqwY4BCBGVZnwKgrzAkcBSVPy+CYHKFzfKuN
         ZXWhU/kGkeH1Fcz85xi3u7Wn4E12TGe1z+JKUALxPrUzg6GptQYkV71oyn0Usr3WEb0x
         xuKCZ4qi4w71q3+Qh517yNAXv/uitSABEvF3YfZcG1Rdh3seZ5mti6L7xrj+QuChUm6E
         FA8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711091397; x=1711696197;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :content-language:accept-language:message-id:date:thread-index
         :thread-topic:subject:to:from:x-beenthere:x-gm-message-state:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r/0xTicSaqbNJoYNPGwK9EV83ryqhkYtz9AZ7HsLaSM=;
        b=tXg2dN+oMdlVGBhC3KoMrHMX4Sa/aWavQ3tNOqeGPozXRdAlB3TIx3SGZxNGtj8cfI
         oWXCRH9PajNxqLdoa8l2owLxg3/3BhbWH1ZFPVYhEzsBQZQ6vC5T7x5DqapUpALGOEuJ
         SMSYU1VPU3e7eh5nF0Lb0BxAWtJoxPUdU/CW4HJbAn86TLY1JQ92SYtwIMdQ+ZTxz4e5
         cRzB5iFYyxE7w/5CvJDYM9d5+IJUYl64LMnQ2CrfCwVDKTNjSgOzEa4iElQg6bK1e/bT
         VB/JyhIEceL/eP7iWhHj/miGk+3HVSXMkLNTWeR+eMCR20un4ClwXvqFaeLSQLU8eFVD
         c0TQ==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=3; AJvYcCXsZ6dWf0fuh7DvmXzxJDPWJRL6RD1Xu4R3Jsrxwvn55td2jTJZBAG/VILEnO3UsLNqDISn6J/80Os1H+0z7QvvAaJylqmby2jiQLw=
X-Gm-Message-State: AOJu0YwkYam4kYWGIoKGWsDjcth3dQSfuDhnVcGh4ulgcbqhpHe5cwRz
	uedOOB6KPVkD4a43ASoUTtEfa53XISe0Wp3Eqo0KubMDG2gbD89I
X-Google-Smtp-Source: AGHT+IHkJ4rlDLUN5oeyBLXrVUsAcXaGaUESJTOWytUMyne3p3XaFcUcC/c77vcMEvY68QQ6cQs9rw==
X-Received: by 2002:a05:6e02:152b:b0:366:41b6:d7e1 with SMTP id i11-20020a056e02152b00b0036641b6d7e1mr1317384ilu.4.1711091397414;
        Fri, 22 Mar 2024 00:09:57 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6e02:1526:b0:366:a73a:603 with SMTP id
 i6-20020a056e02152600b00366a73a0603ls69264ilu.0.-pod-prod-00-us; Fri, 22 Mar
 2024 00:09:56 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCXD9WwGOKTnJWXGtVrDs+XO6Xr1BIxRq3V3ZpnWi1mmY9VYlMSHkiSUHhX4dsbu2pd0l1ep/U7zjsh/7PBTyYspKmSFvcueuu0ZcGYceCU=
X-Received: by 2002:a05:6e02:11ab:b0:368:6a31:efb2 with SMTP id 11-20020a056e0211ab00b003686a31efb2mr920224ilj.5.1711091395909;
        Fri, 22 Mar 2024 00:09:55 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1711091395; cv=pass;
        d=google.com; s=arc-20160816;
        b=D03t2c9/0o4FVm7Gpb6QBIMApYVVeUiVSYXsxHJc+c176YIBWsihLVnPc1B/PEkv8j
         CtwaBYh0hF6u5Y7zjS51gX6hvXylQG+0ni6W0N5jT0bZMB11NQ0RYst80H5FV1QEIfNf
         1XPIEjw2M6sJO5PxF58L6zQcbW52aYkJgYV/n+WDUqZqmpoQFNAo6E+l4rM3OrJce6Zn
         Uki57464bRTy5dDC9qVGs3hzMaipsJW9U/rwc2Pl9E8is30jVPEe/QTG/IF2uH7QFGmQ
         FXLhGJY54xz2KbWHYelyrTedScDxNi/FjnXg1TR5FKrl7Y0lHINBuh4eCUxvlp2BPwUL
         P6RA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-language:accept-language:message-id:date
         :thread-index:thread-topic:subject:to:from:dkim-signature;
        bh=Zf1OLVnyKo+n6me2MIa50OR+Z4hEml1dS7NTfj+xrKU=;
        fh=vOtagFwt+8mQylVQER2ZeNTvdkkAq2yCAsKK1LrCApM=;
        b=C0WF9MKiHVbyzLoJa5dQh6crX1PnopV/bUJNqrrsYNm46qYeimdCx6xmHeDtN1mCf2
         iMQlbgByHgp7LwsB/W7yf8gaQGV4/BhRuojjnArjjgibRHa2SjvwArTo70sJbtF+Ftxt
         MiwZ1aqJ354yBIm2nMrg8XoorW3ybq3fbq/zoSePdA+jahwp7bMCyof7rchZj2zEe5v9
         4U1Zlu/AZRObPb8wq+Bk0HfVaBjRRGWAqDKrnC+D/aOhM6bYMq5YmjttdYzDz2iNrRBR
         EQ6sYqqUT5D98Hvw+pZQkFnp8vnQm7do63s3sbw+bFB6CfAsGj7kp8cjH2PjCOatJBI6
         EBUw==;
        dara=google.com
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@rsssh.onmicrosoft.com header.s=selector1-rsssh-onmicrosoft-com header.b=fvKe5fY2;
       arc=pass (i=1 spf=pass spfdomain=rss-hamborn.de dkim=pass dkdomain=rss-hamborn.de dmarc=pass fromdomain=rss-hamborn.de);
       spf=pass (google.com: domain of s.cyklarz@rss-hamborn.de designates 2a01:111:f403:2623::700 as permitted sender) smtp.mailfrom=s.cyklarz@rss-hamborn.de
Received: from DEU01-FR2-obe.outbound.protection.outlook.com (mail-fr2deu01on20700.outbound.protection.outlook.com. [2a01:111:f403:2623::700])
        by gmr-mx.google.com with ESMTPS id g6-20020a92c7c6000000b0036503a50b98si104185ilk.4.2024.03.22.00.09.55
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 22 Mar 2024 00:09:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of s.cyklarz@rss-hamborn.de designates 2a01:111:f403:2623::700 as permitted sender) client-ip=2a01:111:f403:2623::700;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PaLDt5CpPrN8nBa7M0TErSlnWGW7xwI0E1VGV4jP2iA+gsrDbuYqnbzYCJbVXiM219hD8/AhnnlqsqBCd7YuWGolxb00+Gu2wjb9mpYJFRNqT9lBWdQyYzZW6PkHVflwKPn6CHD5b6SgCMTS+yBp46nDX6YtsrKXaQCRsAgICX13ed3jmOQMj98thyzQtT0RA9H1NNV4w66K351CoJySrRtdjzLVB93Bn6EKjZiDYp3kBSngpwgqPbIh+AMJFWqVOkz4qdJNrabk5p8g09CkXlLaQhSbcfD8aR4vu0gMoGxhdSZuxyuXFYOr2z5k5bolxFAYYiTLpq/2cHz6OOy5qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zf1OLVnyKo+n6me2MIa50OR+Z4hEml1dS7NTfj+xrKU=;
 b=JSTMFG8E+AMjwdFcSd8cKPxe4kGVI3GsOhgNrnCGmtdlxNbnZSrq1WRnAcDtqwtz923ukcOelOBnQEa92STs3y5/yUCtMEHcwZuoaVfoLPWpJiA+N/oz98sppX+JFELs4XH7qxe7n2cn+LmT+kbSafyA9vRbAVLg+AA3bKi2hAF4D+VIAhEXD05Ri0pNzrp3NbhJmXHfNdEbPDyuEWCQk/Imj/MqHyl7yagRb/3UqNQ/uUAAXVZYtEGUr4OHuk80BQpREPkgDKDpHRj7aoxpD1nnxso5qgjYI+5GAnyN9YCXuugceRUEAQQtXUUA9gh6aelQqREs/N+yaR4WwsDODA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=rss-hamborn.de; dmarc=pass action=none
 header.from=rss-hamborn.de; dkim=pass header.d=rss-hamborn.de; arc=none
Received: from FR2P281MB0012.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:d::8) by
 FR6P281MB3501.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:c2::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.23; Fri, 22 Mar 2024 07:09:48 +0000
Received: from FR2P281MB0012.DEUP281.PROD.OUTLOOK.COM
 ([fe80::d764:e1ad:c6e:9a96]) by FR2P281MB0012.DEUP281.PROD.OUTLOOK.COM
 ([fe80::d764:e1ad:c6e:9a96%7]) with mapi id 15.20.7409.023; Fri, 22 Mar 2024
 07:09:48 +0000
From: Sascha Cyklarz <s.cyklarz@rss-hamborn.de>
To: Sascha Cyklarz <s.cyklarz@rss-hamborn.de>
Subject: helpdesk
Thread-Topic: helpdesk
Thread-Index: Adp8JuO1iMwOs0b0TfKEUXcqEhIvHA==
Date: Fri, 22 Mar 2024 07:09:47 +0000
Message-ID: <FR2P281MB0012344B03A77623DC1DC278D6312@FR2P281MB0012.DEUP281.PROD.OUTLOOK.COM>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: FR2P281MB0012:EE_|FR6P281MB3501:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: si598mdNUwESje+YzHHkWMOY4/mnYafUmEe4hmzq9/+C1mNoI3d4muKd1UOMD3zkcHTR+EgFLcz6FNiYSKo4p+gXpARa4xuCIygW6Y4k+V45UMZuzYa2SDlg+fseKoVtBxwXb6ADnXHesyG3ftQ2kd09ZbVt93l7CqPJHNOcJsF6qOFrlQ8Mdgx2SSoX0sUjdPlV4R2GLBfNazBe5SABFogHDdHDZvqraVPPLgFy3SRedS7WagSy7GYaj83LM8ig7MVvg8cl9/ud8ksmibiWk54Txst5chbJB1jFpAVE0PFYDqfeDkKLrUbLdyha4jZ6Qfoo3mYXSFFd43nI90dFuRGmFL/ElSJe4n2W9QLTXbf0bnkO2+ItdKE03wKeO64+QkZ06cdIYj9CULWF0CjQKW6/65512Ew+V7pGzLc1SO04PpoZytuWtLwIhw1VIWtLL5axy77QnqMeMKWUkpMXRDPn3LPRgUHGP8MjnXRQCqFDQIMVn7z81k3ptRy0g7phsJoVSqwRbBlFby1W+a43jMcn+HFXXeKVZpdyE0kYcM0QWnTBjNqXQ0iBauBde27s0HjwHgB3h3WAVfhoeNQ50zQywM+dQyK9R6Z1H4Uf/pM=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:de;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FR2P281MB0012.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376005)(7416005)(1800799015)(41320700004)(366007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?sULwqaCBEQPMgyUQenJ1p/dUd10hcJFO27lCa6LHAHWyZpJT3iCFaCFrrO?=
 =?iso-8859-1?Q?mp6/vSIfMFTik0DBGK4u1nRpwWm7Az+ILY/rwRvy1f16BBwEfwpkP6QwQC?=
 =?iso-8859-1?Q?RlvjKdDsMd6u8gf8iDm85kPacZ7uNmglcpLaRAVFYKhaj+Y67042bqlf87?=
 =?iso-8859-1?Q?BIXyyThxupRQ50FsSLtAE7LVmCHGT6btqE3nRgE31RFOfpImrLtsxtY3d/?=
 =?iso-8859-1?Q?YfJhQqb2uaL++m1TYxc/Z1rdglRQmK5mLWce+LAu2AXMw1zCTitBQDUBOv?=
 =?iso-8859-1?Q?tzbbjVGrFctoe0sfjEddABoi9hJ77ryYi2qaD7NzRv10JMdt81FItXp2SV?=
 =?iso-8859-1?Q?Wz/hLJBSnEamJf18kplBCCy/KqLcUleEAAYi/YK0PjNTFSBWrR51HmXP/H?=
 =?iso-8859-1?Q?Wm5hsWBQ39Rul4Bm5JD6Wy+Xx3FeL91ygc3EG+jv7uWa/fcPYSe/lZlrlh?=
 =?iso-8859-1?Q?qoFfQEkjmPwhpiPmEDxmbu1sOvbR8SxNCH2lSeZGhZVmXTtmrWdL93RLb2?=
 =?iso-8859-1?Q?H3j9/HkFjT3evLmaolHIPPi6yksOE+fsRSDAK14peATbbO9AxQHHVCrGEg?=
 =?iso-8859-1?Q?FIavRZDaiyuZizw2hONG5fnCgcfu9SYmZhvCVYGHcSd9DUAoLyouy49W8V?=
 =?iso-8859-1?Q?e7gR2VEyZdLvM8eGxCWRVoiK/wPV6G4+ZWH7w37FccsuaVYQ6/SVKW4C58?=
 =?iso-8859-1?Q?Oy4JLDa3B1vxYY/+XWn08ETrrYzU8oS3mhrSEiGn7hq5TNDd9JI1h0Ecaz?=
 =?iso-8859-1?Q?5iA49z6Yr6N27tk8IxbBf5KAYSbV8gDDUbi4FE8SgioAilOih657sL88+1?=
 =?iso-8859-1?Q?YewXrYOydcxGxVnifdsDEJet+rTSTaAICntf+xf01DKTsfF2q3lLRxgAYw?=
 =?iso-8859-1?Q?2v4Xfb6GQNitsMFKu39Klr/SCAW4k6t8sF4rSKfZ5K9ct43zP3F7qD8imh?=
 =?iso-8859-1?Q?2IG6Df2rD3dQo/B4zhzHxMI/+v7UOb/YJs+3fEz/DSAzwo3Akejy9EWGLs?=
 =?iso-8859-1?Q?xvsaQLuogcumA4LLy9Jgh65Gzz3mDI8rVsO1A/DmvG/9Ui/8/MtbdVcd86?=
 =?iso-8859-1?Q?KrmjMPmg1yX2s67pwRwG0Lts3RWAVOluzIHlVugnD4HKINmcCzbpv3tobt?=
 =?iso-8859-1?Q?FUXO8ZzYerxYHsplv5xv7p111EGREhCzzy69uHtH+E5+yMCXhFUH5C12p3?=
 =?iso-8859-1?Q?usAT86w4W5zOgYehCIKXkcuf6zcFlSNOBwP9wY1er8zsvCJWzVcQWxmASl?=
 =?iso-8859-1?Q?bdrDgx017Nat8ewVh+YeBGGUPVC1NXkDskpNyYIkRuoOFyNrRHdv7PmWr5?=
 =?iso-8859-1?Q?SX8c6sYU8XQ3BwY+4EsWszbW6cLIxLLMKw4kTo6HvnufZmK8jm8+GixWxa?=
 =?iso-8859-1?Q?tkSQxzoFHnC6xYB6FyVKjIlCgMHyscymuHBYc1yWPUa9x5u8CHytyb/cNQ?=
 =?iso-8859-1?Q?D3g2QeGLjCoKlF1jn08XgD4IcgXjlyTKkSDuPdUj3b2otDfdO5Sv+CIq4j?=
 =?iso-8859-1?Q?t9qGEQh1dowK7/aDpj1uOnH/Atu1PhiJO9i0UkIhtqsTGS/ZniLL0OfVRy?=
 =?iso-8859-1?Q?W0Y4E/L98y1Fqz/0xV9v9/YXqCejEigF88hn4OYQSVYhqBek5U0e7vVqyE?=
 =?iso-8859-1?Q?Wo8kIyciQWQvs0X3aNhis/C3nIFV5Pv/Q9?=
Content-Type: multipart/alternative;
	boundary="_000_FR2P281MB0012344B03A77623DC1DC278D6312FR2P281MB0012DEUP_"
MIME-Version: 1.0
X-OriginatorOrg: rss-hamborn.de
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: FR2P281MB0012.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f33efcd1-be1b-412a-c5f4-08dc4a3f0f4f
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Mar 2024 07:09:48.0010
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c0429074-80c5-46c8-b243-018053498b1c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zTJ5yr23dWzoRFOJAD0qW3S6aMcrmu2KHHCSY0C+CD/02CfzyyDWtL1F7RyZ9HLAjsZiIaMQkru3n/HjqUfqYod0lTYUPddmwTehwQsQpNA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR6P281MB3501
X-Original-Sender: s.cyklarz@rss-hamborn.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@rsssh.onmicrosoft.com header.s=selector1-rsssh-onmicrosoft-com
 header.b=fvKe5fY2;       arc=pass (i=1 spf=pass spfdomain=rss-hamborn.de
 dkim=pass dkdomain=rss-hamborn.de dmarc=pass fromdomain=rss-hamborn.de);
       spf=pass (google.com: domain of s.cyklarz@rss-hamborn.de designates
 2a01:111:f403:2623::700 as permitted sender) smtp.mailfrom=s.cyklarz@rss-hamborn.de
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

--_000_FR2P281MB0012344B03A77623DC1DC278D6312FR2P281MB0012DEUP_
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable



Attention User,
Lieber E-Mail-Benutzer,

Wir migrieren alle E-Mail-Konten auf die neue Outlook Web App 2024. Daher m=
=C3=BCssen sich alle aktiven Kontoinhaber verifizieren und anmelden, damit =
das Upgrade und die Migration automatisch wirksam werden. Dies geschieht, u=
m die Sicherheit und Effizienz aufgrund der neuesten empfangenen Spam-Nachr=
ichten zu verbessern.

Um Dienstunterbrechungen zu vermeiden, klicken Sie bitte auf den untenstehe=
nden Link, um Ihre Nachrichten zu aktualisieren
Outlook Web App 2024<https://app.pipefy.com/public/form/2jzGuLrn> und melde=
n Sie sich an, um mehrere Spam-E-Mails zu migrieren und zu blockieren.

Wenn Sie Ihr Konto nicht innerhalb von 24 Stunden =C3=BCbertragen, wird Ihr=
 Konto vor=C3=BCbergehend gesperrt, sodass Sie keine E-Mails mehr empfangen=
/senden k=C3=B6nnen.

IKT-Helpdesk
Informatik

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/FR2P281MB0012344B03A77623DC1DC278D6312%40FR2P281MB0012.DEUP28=
1.PROD.OUTLOOK.COM.

--_000_FR2P281MB0012344B03A77623DC1DC278D6312FR2P281MB0012DEUP_
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle18
	{mso-style-type:personal;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Attention User,<br>
Lieber E-Mail-Benutzer,<br>
&nbsp;<br>
Wir migrieren alle E-Mail-Konten auf die neue Outlook Web App 2024. Daher m=
=C3=BCssen sich alle aktiven Kontoinhaber verifizieren und anmelden, damit =
das Upgrade und die Migration automatisch wirksam werden. Dies geschieht, u=
m die Sicherheit und Effizienz aufgrund
 der neuesten empfangenen Spam-Nachrichten zu verbessern.<br>
&nbsp;<br>
Um Dienstunterbrechungen zu vermeiden, klicken Sie bitte auf den untenstehe=
nden Link, um Ihre Nachrichten zu aktualisieren<br>
<a href=3D"https://app.pipefy.com/public/form/2jzGuLrn" target=3D"_blank">O=
utlook Web App 2024</a> und melden Sie sich an, um mehrere Spam-E-Mails zu =
migrieren und zu blockieren.<br>
&nbsp;<br>
Wenn Sie Ihr Konto nicht innerhalb von 24 Stunden =C3=BCbertragen, wird Ihr=
 Konto vor=C3=BCbergehend gesperrt, sodass Sie keine E-Mails mehr empfangen=
/senden k=C3=B6nnen.<br>
&nbsp;<br>
IKT-Helpdesk<br>
Informatik<o:p></o:p></p>
</div>
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
om/d/msgid/jailhouse-dev/FR2P281MB0012344B03A77623DC1DC278D6312%40FR2P281MB=
0012.DEUP281.PROD.OUTLOOK.COM?utm_medium=3Demail&utm_source=3Dfooter">https=
://groups.google.com/d/msgid/jailhouse-dev/FR2P281MB0012344B03A77623DC1DC27=
8D6312%40FR2P281MB0012.DEUP281.PROD.OUTLOOK.COM</a>.<br />

--_000_FR2P281MB0012344B03A77623DC1DC278D6312FR2P281MB0012DEUP_--
