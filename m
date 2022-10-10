Return-Path: <jailhouse-dev+bncBDAYHZ5XUYJBBCPGSCNAMGQEM7PK4ZY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13f.google.com (mail-lf1-x13f.google.com [IPv6:2a00:1450:4864:20::13f])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5CC5FA0C3
	for <lists+jailhouse-dev@lfdr.de>; Mon, 10 Oct 2022 16:58:19 +0200 (CEST)
Received: by mail-lf1-x13f.google.com with SMTP id u3-20020a056512094300b00497a14e7589sf2929782lft.12
        for <lists+jailhouse-dev@lfdr.de>; Mon, 10 Oct 2022 07:58:19 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1665413898; cv=pass;
        d=google.com; s=arc-20160816;
        b=sIkXpp0O0Bt6ogyuUXSX2A6HkLiFo4rK2pbrjvhCnRIDPIjA20+XgyCIt7EfKm0551
         igFDBlb7RQFO129zimKB8TWkbviTdFVjJy0maXhuIcaNhgCpCNtUW4B28od82e8dZDyN
         ARBgs2U+Yq2W260tbKI1PgbJWgWoD/9CW5YpGCL41XIQ7pDld1JFayRGzB6NCEqO522D
         SvSbPxG7zgJvkDPIAQOr9qr+E6Ogb2BFVkzIr95zlCfSIbPKxWdmYAS+tbP3YApw1Gn2
         QK2hfKnFuE1PyOOiKgJOOf1PRkgT4nXLcIB2v/0Zo/T1h9uwqv0j7/ihLAbKyqpefIXy
         ztYA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version
         :content-transfer-encoding:content-id:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:dkim-signature;
        bh=1josIc72uTtq32pPMsYpLQJ9QdEbfluc3B+jdsHen10=;
        b=0OmRbpDZDZZrWBwAo1PgM3rFlVgQx8wgEDtxxBfrvSanHTHKncazlQJTrUb56qRzZb
         Sxn1SB7ZHsWKjdFm2m+iK1pyP2msLfZ/pDNLeJhgkWUFVH3PsdPUXzxoWN5dnrCAGwof
         +ek6UDFWZLHgKihz9U40XQ8ypaMLF3uABLRD6jKeqtdZaLqmBqXHApYbURLqmPUZVMG7
         bXaK7jNOyggM6+kMWzpQB9D4Fr/qVAAPGZIgNTyamiHjLZkUGGCtw44ydOL7yBVneP9F
         8hiiplNlKHSschXf31S5blbz/jfdnws89/JLMi8Jwvar9cseF9DlyLOlzid8sfAZ67gf
         KKzg==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@vmware.com header.s=selector2 header.b=kKhFXmsg;
       arc=pass (i=1 spf=pass spfdomain=vmware.com dkim=pass dkdomain=vmware.com dmarc=pass fromdomain=vmware.com);
       spf=pass (google.com: domain of namit@vmware.com designates 2a01:111:f403:c111::9 as permitted sender) smtp.mailfrom=namit@vmware.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=vmware.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to
         :x-original-authentication-results:x-original-sender:mime-version
         :content-transfer-encoding:content-id:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1josIc72uTtq32pPMsYpLQJ9QdEbfluc3B+jdsHen10=;
        b=ZJiynbwfjE6dZ9DZ5N9AJCQ3z2RyO42nH5zsgALJ68NFK9LNq738SiNdt+W8unghtS
         zATRdMysmxbIi6uqXmpchhEmATyL+C3L/I47EwwfTkPxa7+MTwjNgVrndgTZInDbOB9D
         +oAijSfBJoIX5yLBpZC8/X31VUvx32lnzkAcYp1UZd0/BU7xxo5/hwuu2XHjHHlVxixn
         yNEJW3Z3NdNt5ZmgBGTCX90qYOabSiRFbUGBZIelCa6CT7GxQa7twi8HM3ctt/5+kwHV
         cKlygnnoKYzyxlA+lv3g9bEyEAkkzo03tV2Mv5pt4wQcvLVa/2+ScwGt+R+CLp0mdRXx
         qIMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence:reply-to
         :x-original-authentication-results:x-original-sender:mime-version
         :content-transfer-encoding:content-id:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1josIc72uTtq32pPMsYpLQJ9QdEbfluc3B+jdsHen10=;
        b=Y8z1tFgFGGn0wtKazRHa6sCnTajaqtmqnGB0wi55cCAaRXBTLDHv6Pk8/c/JLvCxR3
         tgfu7l4QdnbeTO6S0lgGUkunkh8veJ7u3yjG8PriFCbW3cgIjooN9rngBOTJaqC09U88
         GEjj0POBAmXhEZOG/lDFtV7Y0F7M5siYcnIoJyeQSGp6oX0+Nvo7ALR4vltVshIiW39d
         mJREYouxvRPqHoPdsQ6m5WxLKEDWuKr6i1tSHJPvh7M6X/wsPS4wn24a9KQ6/VHVB1tM
         VjSU0ATScPxtCm3afhYLGBPxGCns8gIr5GKKD9iGmDi9jwk4smaC3DLaUafW+UXwkj+t
         d3iQ==
X-Gm-Message-State: ACrzQf23VeCWrVHtiAI1bWHzIoffgMRqD4O++pIswvmx9pkSBy9WEpdy
	7fhoaWekTJd0L95T4Rp4umo=
X-Google-Smtp-Source: AMsMyM4leLbraioER8gIOxaPOi58RnWea7kps0B3qf9gnCZF7Cu6fxkhyh3FBQXDc5U9W7k3+1O+Mg==
X-Received: by 2002:a05:6512:15a2:b0:4a2:7618:d712 with SMTP id bp34-20020a05651215a200b004a27618d712mr6845448lfb.672.1665413898413;
        Mon, 10 Oct 2022 07:58:18 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9357:0:b0:26c:56b2:1383 with SMTP id m23-20020a2e9357000000b0026c56b21383ls2107413ljh.4.-pod-prod-gmail;
 Mon, 10 Oct 2022 07:58:16 -0700 (PDT)
X-Received: by 2002:a2e:9d8a:0:b0:26e:314c:c3fd with SMTP id c10-20020a2e9d8a000000b0026e314cc3fdmr6078782ljj.105.1665413896628;
        Mon, 10 Oct 2022 07:58:16 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1665413896; cv=pass;
        d=google.com; s=arc-20160816;
        b=LcXSeIl9RuUetxwsJMcCOJIK6nh8mL1knYfjW7/K9Od5A2L2HrHfiMJDRgru0ZpWZC
         e9A/1DdXZxjKYTfo0SU1/FFlqQMm7v91fooWc5n6vxcNB0059UA7qHMlJmZxwFZHk2xC
         Tx6Qm+ge8S1s5sdx5QWzd/R3MtKgvjfMnF/IcSE9OYmFVZ//mYHcRFQNrBMhHIiKf3U9
         bkyqI3JPg3Ni2AM7OYsbRj6Ov2/9M4UHX54S/JOFC2ZG3Vh2CalzmDidb6vVwjFe2BWc
         Tg6nMvm+204OH15eutMioBRxb/ga9UPpmGWIHG0UTdPGa8I12o69rGJOJ/Zx5rOf6Vs4
         XU4Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-id:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:dkim-signature;
        bh=rYO8dCN0RAPjyyKUKeDabhUwzPIiWj1zLa9O3qPgnss=;
        b=BnK3nGH3hTg4751c8s4Hr7FNoAxBFwwm39klbnkmBrE2968UFyYWyoXoSRqMxHuw9Y
         cWOR/DI4MWTAd6VxsC6G2yA6ZaIGkp4V1F94ewk9KCqRGdiW06eI757HPQsCFp4BmKvc
         izGs464ofEHcZKTmV4I0H01e6FGPNmU5xCX4ZxQqGDI8AgVGjp8FPty95Pzgek56ITzu
         sF0iAefbtQqeJBdg30eDXgKT/0FY70fHX4AY+98oOE7lkwYBFbswutLHKYAlQAGCHvzC
         kScI8vEiuWUbKSdXA9jIgAxCAL8XQSr9gSAbr8+eX0/DLYyaeBClsg/sSMPbKUkfqQLS
         KAbg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@vmware.com header.s=selector2 header.b=kKhFXmsg;
       arc=pass (i=1 spf=pass spfdomain=vmware.com dkim=pass dkdomain=vmware.com dmarc=pass fromdomain=vmware.com);
       spf=pass (google.com: domain of namit@vmware.com designates 2a01:111:f403:c111::9 as permitted sender) smtp.mailfrom=namit@vmware.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=vmware.com
Received: from na01-obe.outbound.protection.outlook.com (mail-centralusazlp170130009.outbound.protection.outlook.com. [2a01:111:f403:c111::9])
        by gmr-mx.google.com with ESMTPS id e10-20020a05651236ca00b0048b224551b6si398589lfs.12.2022.10.10.07.58.16
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Oct 2022 07:58:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of namit@vmware.com designates 2a01:111:f403:c111::9 as permitted sender) client-ip=2a01:111:f403:c111::9;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RYj8IVbHL5TeLctsE7SNniC4FhYikkGDfbW0Rh/bWGfKp+dVSpMubwdf74yA6joIBSfDPNAaeKHB41UwmZSVt5h0p3JLVNBFWA9J2I97sR4pFQaUvDEjhzbc0T7nah5yd/6d/rZrqSv1JzFnTZKcc0UJPkVfp9CecYEpPXLz8//pAsyx2JDS0av94+AARXsuufWD/Tzdqb2u3rgTduatjT6CUQEh7C1NH+BOaquia6E5zf6daF0sSoqnL3scA1FeUFNy4Pgq0X2Lsb0mrEdBQRMgwQVMqGSveSmSTPdIuIe61D9e+3ZeFC18Ql2cbUCJPIP7aOvhZzsf4WMBoiHB9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rYO8dCN0RAPjyyKUKeDabhUwzPIiWj1zLa9O3qPgnss=;
 b=hFmw2HbN2k2RgzviO6NuWIEeKI6tgcPwGAEySt3FAGZlD+HMdz/kFaUKQWX4IJX/UnUkMo8hOHpRNdJUHahnbNnS65znKX706RZgW4Ejv0sVsfywzk4sIWxjJS949KmjE2uSNI05dkL79m1o5BI5sOoTgSoV5+HfO1/v2abSXa2YFIvK2ah63AKfYThL5GQMYylFLk7AmvFx41nAlC+41DRl7QA/BUJK3kqcPKUEpaWsrmXdD2lPijeaLfNkINGBDUZblEnuw5avgI21qPcgvOirFb0kP5GfLkHLl+Ukq9o8lNc28GsiGX8QfrF6mMSqLYAS6tMk8iBVVPqHV0M9zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
Received: from BY3PR05MB8531.namprd05.prod.outlook.com (2603:10b6:a03:3ce::6)
 by MN2PR05MB6269.namprd05.prod.outlook.com (2603:10b6:208:cd::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.7; Mon, 10 Oct
 2022 14:58:07 +0000
Received: from BY3PR05MB8531.namprd05.prod.outlook.com
 ([fe80::942c:7d1b:6b3d:85b6]) by BY3PR05MB8531.namprd05.prod.outlook.com
 ([fe80::942c:7d1b:6b3d:85b6%7]) with mapi id 15.20.5723.013; Mon, 10 Oct 2022
 14:58:07 +0000
From: "'Nadav Amit' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: Nadav Amit <namit@vmware.com>
CC: Alexander Graf <graf@amazon.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
	Ajay Kaher <akaher@vmware.com>, "x86@kernel.org" <x86@kernel.org>,
	"hpa@zytor.com" <hpa@zytor.com>, "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "rostedt@goodmis.org" <rostedt@goodmis.org>,
	Srivatsa Bhat <srivatsab@vmware.com>, "srivatsa@csail.mit.edu"
	<srivatsa@csail.mit.edu>, Alexey Makhalov <amakhalov@vmware.com>, Vasavi
 Sirnapalli <vsirnapalli@vmware.com>, "er.ajay.kaher@gmail.com"
	<er.ajay.kaher@gmail.com>, "willy@infradead.org" <willy@infradead.org>,
	"linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "helgaas@kernel.org" <helgaas@kernel.org>,
	"bhelgaas@google.com" <bhelgaas@google.com>, Thomas Gleixner
	<tglx@linutronix.de>, "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de"
	<bp@alien8.de>, "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v2] x86/PCI: Prefer MMIO over PIO on all hypervisor
Thread-Topic: [PATCH v2] x86/PCI: Prefer MMIO over PIO on all hypervisor
Thread-Index: AQHYx28G+J2WSwxm3kmFzqoOhSDYUK3dXFQAgBj77YCABouGgIAAKhGAgAD4GgCAAK7iAIAJLbYA
Date: Mon, 10 Oct 2022 14:58:07 +0000
Message-ID: <37B773B8-A918-45E8-9642-9F6112CDCBB6@vmware.com>
References: <9FEC6622-780D-41E6-B7CA-8D39EDB2C093@vmware.com>
 <87zgf3pfd1.fsf@redhat.com> <B64FD502-E794-4E94-A267-D690476C57EE@vmware.com>
 <87tu4l9cfm.fsf@redhat.com> <04F550C5-786A-4B8E-9A88-EBFBD8872F16@vmware.com>
 <f1a7e603-2e64-fd2a-1100-f2898060e3f7@amazon.com>
 <DF8775A4-5332-412C-9359-749E96E83907@vmware.com>
In-Reply-To: <DF8775A4-5332-412C-9359-749E96E83907@vmware.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY3PR05MB8531:EE_|MN2PR05MB6269:EE_
x-ms-office365-filtering-correlation-id: 69df7bd8-e1bb-47a0-8da2-08daaacfd759
x-ld-processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3ndTD+kWc7Des/PCBwoe6WcHAIvzmJxk31e4vq8i/2to+pJZkz6An7DBSzBE20ofdGn3MEHsGiyOG9tLA+rVv1oZt+GRNHXBSL3pafvfP+6zY7bxBmE+DxxRLBgd9/leF/ExseJuB8g+ZNm+xCEFHvTKg9pLavn45NAth6JngtYblEsNaME7JDmbzm6sZejjFAPIBoxtUxIghRj2CtySG0w6Srd+h6RB8X9NeSVeqTKofwFbGckOkchJkQWMj5vkAsDpbgWFdnhK2pWTtCdP4V4/TVmgIAiyK2VVkZp6Y3znqHsVvhAhKFrc2Bl2pES/0FzWyveObNE6YSGRUIrC6e/RJLmskGBWjy4LBmibPxmv/yXd3r1hAfUNGnQJBTIPYlqY/Q+J6lRWQbjGaijmfKRX0yHCf7w/ZJt2D4Y8EBS2S3px655MbNz87Yl7U3GfyDRl4vnVyH1qLaHL3pDaph3ZZEyaVT5ioo+a8HhbkgutP3qEb/0G2N50kpXkYMucSHOq7MNi9UXL8oouvaDHJh4IxhGIarIPR6+6lCVHpDqmMy12dHa1WD1IlyP5dCRKbh1XgBKLBofxay9KuP5Fxq29AMubo+mF0QIRKfts4BXj6OHJeg/txs+bcg0xLHcGiROGIsPPd3X6LLOy+ABq8jrsavHJ7QIv6kWJKiCrYLaQhbLHCOnNrqL94BsThR9zKBzJVaOQ7yZe8EBpvHRkpEkRu/p+2b4ZNUIzzqBzy9uuOjmZpSI8HfdinzFCwFj88YM/vmw6UTpP2arHmKjv55hE7S3gz939mIAdzdPvtBY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY3PR05MB8531.namprd05.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(396003)(136003)(366004)(346002)(451199015)(4326008)(8676002)(76116006)(66556008)(7416002)(66446008)(66476007)(8936002)(38070700005)(6512007)(26005)(66946007)(83380400001)(6506007)(86362001)(64756008)(54906003)(5660300002)(33656002)(41300700001)(6486002)(2906002)(122000001)(36756003)(6862004)(6200100001)(37006003)(478600001)(38100700002)(71200400001)(316002)(53546011)(186003)(2616005)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bTJoNWcycWlRRSs0UzFML0kzaENSTjFPWC8wSnNYR2F2amF6bEx3M1N1eDFU?=
 =?utf-8?B?aTZqWEFSTVAxT0N5ZEp6WWpyNVlZQllwbGt6YVpLcHZIdlZkMloyMTFmM0FO?=
 =?utf-8?B?bkZtT2t6SlBadlgrRDBzU3NoUnh0MkI2RWpmNFFpS0MvMXZGSjhzblZ5Tnp2?=
 =?utf-8?B?a3F2THhycEloeVhveHRqdVowWmFmSlp2a1VZTkdyZWxCTmUrQm5NUmlIdTVN?=
 =?utf-8?B?ZVZEdm01azVlMjJqb0VCUGNtRTB3bGx2UDJ2TjR3eU42enJxejlkWkF5U2ZI?=
 =?utf-8?B?Q2JRQU8wYmY0Nkh1dGNyT0RudGg3bStnU0xYTWIrTkVLVE00dXJSdmtUMnpG?=
 =?utf-8?B?dFdMTVBmN1pVUmhlbW5NNWV3OFd1UzR6N2FKdW41bXZhd1VPOXdBN21uYXRY?=
 =?utf-8?B?RytNbmNxbjB6SU0xWW1FNFhyLy9QK251MXNZZ0piMFNyamxkRHVzREVIUHRu?=
 =?utf-8?B?RlA5TkV6aFlNY3VwZFE0MXRqa0NlM2JiUDYvV2VDenY4VHNldG1JVTNGNGly?=
 =?utf-8?B?U2dVRTZiTDl6ZHExeTFOOUFIRTFtbFZ3RkswVG84YVZ5VXhGbktqL3dKV21N?=
 =?utf-8?B?L2pyVjhZYlFOYmNsVnJyZGJTMmRzLzdkOHJQbUNkUTBRR09rZHdJUm1DZ0Qz?=
 =?utf-8?B?cGh1ckx2b3pSK0V1M090bEI5R1lkVk5EeSsvNU93dnZBLzN4MjFKUWU4akJm?=
 =?utf-8?B?SHJlZlZQTEt6b0dLSmluUEZBRUNmdmRoK211ZkFpemQyY1pCMDVlR3dhcGlS?=
 =?utf-8?B?ZGh6M3pTUVlvczVmaFQyWmQ1eGZITjRkZWxJbnNrOFY3WkxnVkRmMmQ4cVAv?=
 =?utf-8?B?Wk4wWDBJQ1BYZ3NzVVZCT1FNU2RPbmgyQ2hCUkZzcVEyZlFNclFlSkNoYjVB?=
 =?utf-8?B?UVA4dEs1NHlDYWxQUkZNSDNIcU5DdFZ6bzBHRTBRb3JlZG02cnF0R2Q1N1pS?=
 =?utf-8?B?d0NSNEV5TURHNDNrWTFQVkg0N2puVWppVmNMcVFGRFU4djdrQVNYNTRuMU55?=
 =?utf-8?B?eWNRZjZ3NXlHalJBUndtd0Jnckk0VVhmOHgveEdmSXVxdUxVckFoYXpDcys3?=
 =?utf-8?B?T1J0Z05OSHRDako3MlhZRHNISFB1dTJ3UlQrN1RKS0VqajZ3OE9nSmpwZVNE?=
 =?utf-8?B?TEN3aVFScWxqakUrV1BIR1FCa3ByakExQ2owWk1nYzBTMWFBb2tpS1BQSEVN?=
 =?utf-8?B?YzZnd1VkV213QVdxcFJ6SGhoUWVjZHNqR2RVQ2hTNENmL3RKRGgyN3hGbm12?=
 =?utf-8?B?RFR4TjhleWpiSkRZd0Y3TENTWHl4SVNTamttSC9tVVIxdGFYZkNReDRldVVt?=
 =?utf-8?B?Wnh2WUtBd0hydmJKQ0I0WHd3NDdBd3hVQTBDMzg2RURlbTRON2twdGUvNEVu?=
 =?utf-8?B?TVZ6cjJPa0c1QlhIK3JTZnZKM0FrSVF2QlVkZHljdXppdytwNVJQc2ZldEd1?=
 =?utf-8?B?dU9Cemk3MlhoZnpPRm42ZWxOZlFLbFQra3hZRzN3aUNiZ1FVNEVuTjZldHNm?=
 =?utf-8?B?NlBtVFN6amY3alVtNkh1RFE0N0lZNGhUeEkxVVc3L2RqcTRKaFo4NXkyVzJj?=
 =?utf-8?B?K1pSL3UzcjJMa0hyUUw1eStrdko2WThZaExyUy9OckNrM0lWUTQ2bmpmNmlD?=
 =?utf-8?B?ZnRGZHNFMk54cnQ3ZG9Ma0I4SXllL3RodFdPMzh2d0VzVTEyMkFka3YxcnRw?=
 =?utf-8?B?ODdFU3RYM0MxZkxJeWJwSGp0bzZJM29YL2p6WjU2NVQzYTFjMCtCejd5RjFX?=
 =?utf-8?B?aXI0SktsQWVPYTQzVWFYc0VhbERxaUE0ZGxuSUR3OGFoRE4xVUVLTy8wTUhV?=
 =?utf-8?B?OHV5cytod3VBN2JVREd6QlZsZUFYRWxydHA3alh5dEYyMFhnR2t1YzVUVDQ0?=
 =?utf-8?B?bW1rajdrRnc5RTNJR3pYZjhVUGw2aC93OGJXSlBYb2JSREM5Rkg4dnh2eXZp?=
 =?utf-8?B?SWZKazF2VlNhaHQzY3VDemRkMXkwQWJGcDNVY2ZScTNJc1RmNHJ1cEdXRjIz?=
 =?utf-8?B?MCtMN0F0VzlOSlBMeU1RV2cxbTljNndiWEF1cmtFQUZEQlJOYjA3RUYwQkVD?=
 =?utf-8?B?aU1mbGYrN1hQcXE0QVNXTTNxTDlVV3VSVGQ2ZnlkdmJIOGtzd2oxeUw1SWV4?=
 =?utf-8?Q?quyg3M4cBRrnLa5sMOx3o+wqU?=
Content-Type: text/plain; charset="UTF-8"
Content-ID: <E9C3B43181985F4F97F91A814A79A6C1@namprd05.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY3PR05MB8531.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69df7bd8-e1bb-47a0-8da2-08daaacfd759
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Oct 2022 14:58:07.3956
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xGHU5bIcBDSFl8n5qpOcg5QjgLSkBqoIyZVxUwqwYTGbkWdZeTV3Ie/t33RGlF1rfww1qFYruaX4UR5W2+SFBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR05MB6269
X-Original-Sender: namit@vmware.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@vmware.com header.s=selector2 header.b=kKhFXmsg;       arc=pass
 (i=1 spf=pass spfdomain=vmware.com dkim=pass dkdomain=vmware.com dmarc=pass
 fromdomain=vmware.com);       spf=pass (google.com: domain of
 namit@vmware.com designates 2a01:111:f403:c111::9 as permitted sender)
 smtp.mailfrom=namit@vmware.com;       dmarc=pass (p=QUARANTINE sp=NONE
 dis=NONE) header.from=vmware.com
X-Original-From: Nadav Amit <namit@vmware.com>
Reply-To: Nadav Amit <namit@vmware.com>
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

On Oct 4, 2022, at 11:48 AM, Nadav Amit <namit@vmware.com> wrote:

> On Oct 4, 2022, at 1:22 AM, Alexander Graf <graf@amazon.com> wrote:
>=20
>> =E2=9A=A0 External Email
>>=20
>> Hey Nadav,
>>=20
>> On 03.10.22 19:34, Nadav Amit wrote:
>>> On Oct 3, 2022, at 8:03 AM, Vitaly Kuznetsov <vkuznets@redhat.com> wrot=
e:
>>>=20
>>>> Not my but rather PCI maintainer's call but IMHO dropping 'const' is
>>>> better, introducing a new global var is our 'last resort' and should b=
e
>>>> avoided whenever possible. Alternatively, you can add a
>>>> raw_pci_ext_ops_preferred() function checking somethin within 'struct
>>>> hypervisor_x86' but I'm unsure if it's better.
>>>>=20
>>>> Also, please check Alex' question/suggestion.
>>> Here is my take (and Ajay knows probably more than me):
>>>=20
>>> Looking briefly on MCFG, I do not see a clean way of using the ACPI tab=
le.
>>> The two options are either to use a reserved field (which who knows, mi=
ght
>>> be used one day) or some OEM ID. I am also not familiar with
>>> PCI_COMMAND.MEMORY=3D0, so Ajay can hopefully give some answer about th=
at.
>>>=20
>>> Anyhow, I understand (although not relate) to the objection for a new g=
lobal
>>> variable. How about explicitly calling this hardware bug a =E2=80=9Cbug=
=E2=80=9D and using
>>> the proper infrastructure? Calling it explicitly a bug may even push wh=
oever
>>> can to resolve it.
>>=20
>>=20
>> I am a lot more concerned with how we propagate it externally than
>> within Linux. If we hard code that all Linux kernels 6.2+ that are
>> running in VMware prefer ECAM over PIO, we lock ourselves into that
>> stance for better or worse, which means:
>>=20
>> * All past and future versions of any VMware hypervisor product have to
>> always allow ECAM access for any PCIe config space write
>> * No other hypervisor benefits from any of this without upstream code ch=
ange
>> * No real hardware platform benefits from this without upstream code cha=
nge
>>=20
>> By moving it into MCFG, we can create a path for the outside environment
>> to tell the OS whether it's safe to use ECAM always. This obviously
>> doesn't work with MCFG as it stands today, we'd have to propose an MCFG
>> spec change to the PCI SIG's "PCI Firmware Specification" to add the
>> respective field. Future VMware versions could then always expose the
>> flag - and if you find it broken, remove it again.
>>=20
>> Putting all of the logic on which system potentially prefers ECAM over
>> PIO config space access into Linux is just a big hack that we should
>> avoid as much as possible.
>=20
> Thanks Alex. You raise important points. Let me try to break down your
> concerns slightly differently:
>=20
> 1. Enabling MMIO access should be selective, and potentially controlled b=
y
> the hypervisor. The very least a "chicken-bit=E2=80=9D is needed.
>=20
> 2. PCI SIG would change its specifications to address unclear hardware bu=
g.
>=20
> I think (1) makes sense and we can discuss different ways of addressing i=
t.
> But (2) would not happen in a reasonable timeline and seems to me as an
> unnecessary complication.
>=20
> But before we discuss how to address the issue, perhaps we need to first
> understand it better. I am not sure that I understand this MMIO bug, and =
so
> far nobody was able to provide exact details.
>=20
> So I went to have a look. It might not be super helpful, but for the reco=
rd,
> here is what I collected.
>=20
> First, we have commit d6ece5491ae71d ("i386/x86-64 Correct for broken MCF=
G
> tables on K8 systems=E2=80=9D). It tried to "try to discover all devices =
on bus 0
> that are unreachable using MM and fallback for them.=E2=80=9D Interesting=
ly, it
> seems similar to FreeBSD code (commit 2d10570afe2b3e) that also mentions =
K8
> and has similar detection logic in FreeBSD=E2=80=99s pcie_cfgregopen().
>=20
> Then commit a0ca9909609470 ("PCI x86: always use conf1 to access config
> space below 256 bytes=E2=80=9D). The correspondence [1] mentions some bug=
s: ATI
> chipset, VIA chipset, Intel 3 Series Express chipset family and some repo=
rts
> on Nvidia. It turned out some devices had problem probing - to figure out=
 if
> MMIO is broken - the way the previous patch did.
>=20
> All of these bugs are circa 2008, of course. And note that FreeBSD did no=
t
> take a similar path. The correspondence around Linux patch is endless. I
> admit that I did not understand whether eventually the issues were found =
to
> be per-bus or per-device.
>=20
>=20
> Back to the matter at hand. The benefit of using the MCFG approach that y=
ou
> propose is that it can enable native systems to use MMIO as well. However=
,
> since the list of bugs is unclear and the problems might be device-specif=
ic,
> it is not clear what information BIOSes have that Linux doesn=E2=80=99t. =
In other
> words, the benefit of getting it into the specifications is questionable,
> and the complexity+time is high.
>=20
> Can we agree that the feature would be enabled explicitly by the hypervis=
or
> and Linux would enable it based on the hypervisor input (through some
> channel?)

Alex, is it ok with you? We will enable the feature (disable the bug)
explicitly from the hypervisor, but would not rely on MCFG changes, which
would even in the best case would take some time.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/37B773B8-A918-45E8-9642-9F6112CDCBB6%40vmware.com.
