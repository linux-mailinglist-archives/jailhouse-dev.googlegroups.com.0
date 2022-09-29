Return-Path: <jailhouse-dev+bncBAABB4W52SMQMGQEUYSOKDA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x338.google.com (mail-wm1-x338.google.com [IPv6:2a00:1450:4864:20::338])
	by mail.lfdr.de (Postfix) with ESMTPS id B29ED5EED43
	for <lists+jailhouse-dev@lfdr.de>; Thu, 29 Sep 2022 07:36:51 +0200 (CEST)
Received: by mail-wm1-x338.google.com with SMTP id c2-20020a1c3502000000b003b535aacc0bsf2462621wma.2
        for <lists+jailhouse-dev@lfdr.de>; Wed, 28 Sep 2022 22:36:51 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1664429811; cv=pass;
        d=google.com; s=arc-20160816;
        b=ZWVEfion/DpzXhY8LwjbrDLQE83Sss5EUvQaY7zLa1NEn5rzAKGCDseFmQL12AU3O4
         IqlXaeVQRZWFjIhHAbXSBwjMAPO5bT2Bu0xDKWW3uo+P7qTKbX7312bH8OJnu0l/pvR4
         ojQ7sgc0nQa1kSycJ8zd/S4aDT0uK/W+2O+mFX8Pb2ZTRyeH09xyXK92ixpFd2ZDz/oR
         /hlYpEQshO3NZu7WBD6ukSP99Djjfia5EfQYeHfdYmIA2kqWEzWdbtGbpvD4fQsoLaxD
         glGsmAGIaiFXrTs55LjrPraOYzdm+JPWPOrXoKnvKgMGElgybWsiy3Cm+w+YAxtm5sUP
         NLkw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version
         :content-transfer-encoding:content-id:user-agent:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:dkim-signature;
        bh=sgFBSCQ5CHEbtwsYvmrzAdUWiWu82XVyMnIyExDDE0A=;
        b=pX9Khp8P0T4MaPewnRDg3wAMKPXj/cNSIEp/BGpjV9PmEFZLGQtFPPOZS6wMQw95vn
         SzwHbZwKpfNPXdoES8UrqIooFXMwe1bo+h/nCmTlGML2iSTtWS6lfGaVSd5T0eS09977
         1qjqKh1kkJP4udpWbXzRyu/q3xKpCkcWGBxHHIuE+yq4ckrm+sv70WGhWGNDWelb127U
         yuKB6YG4w/Wp+uzbIKd/38nVzSjOCBRROhG4DwhOqjn1Xw5XTHWXAqfZwrylxEG1Lp2j
         e2HI6md+etDfZFZgUS2gGqHarmnffjoQPhkZDHhCAXzYI4kGILVK0VDb08X3tKrLPuDc
         XwcA==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@vmware.com header.s=selector2 header.b=H5RxDyJh;
       arc=pass (i=1 spf=pass spfdomain=vmware.com dkim=pass dkdomain=vmware.com dmarc=pass fromdomain=vmware.com);
       spf=pass (google.com: domain of akaher@vmware.com designates 2a01:111:f403:c112:: as permitted sender) smtp.mailfrom=akaher@vmware.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=vmware.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to
         :x-original-authentication-results:x-original-sender:mime-version
         :content-transfer-encoding:content-id:user-agent:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:from:to:cc:subject:date;
        bh=sgFBSCQ5CHEbtwsYvmrzAdUWiWu82XVyMnIyExDDE0A=;
        b=OVodgsWuzs9HKA1fovUlv7sSEcYGnW1PWJfG+VAvJO6ZF7jExjj/fOs1mhTCAjjOJR
         XFMHDW5+VaJ0zK9ZJ9ZhhvxacS2HpYda3qSMOq8yawKmx3auTsQWSBsEUJCu3OhfsUS/
         angiSiUmzyY9IJWbo9YH7sCjS/UYhHrld2qpe1VKdya91I66V/o6Oe5Ka3cDvEe8rc9F
         KZltxG+OaQzfkcp7p+BRfhs5dxvrqBC+ITOIN5ymxebtQugkdwc5PWBfustWUStLridb
         QV8K96LUn2zrYTQFuivBXlc9v39zeEXSzWYoWCkTF2xAkRpX/SzavYFaHITCzHl/FdvU
         bYXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence:reply-to
         :x-original-authentication-results:x-original-sender:mime-version
         :content-transfer-encoding:content-id:user-agent:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=sgFBSCQ5CHEbtwsYvmrzAdUWiWu82XVyMnIyExDDE0A=;
        b=NTv1KUlBdAKY1WQt68KNAmTCt2QeUUiSZPeAZNnQZEHmokgKnaM9A3nKXqptbTDJDz
         g4bSoVe/rwXNBaEIoSskVFScDdMiokgjyqryWDRuwfa73WRiM5HL/TNi2RQTXsILUdev
         SkQ38LCqdVQbRL0IeoLPC8na2Q4rN5TXhBg2+Pl3FYgdjhal5Edd/3znlmlD6vhnXnlU
         1Plw8UwFWu9Og+rmXpyvgrYJvuD9t+JrLDuPDsUw/WlQKaoK8o3iow6TquZpT6dFAS5I
         Tg1iobeIEcZgVMNEG1LN3l2COYF0bg5NlPOsTdpfamFj/5NGtWY7VaHDjlqYGpINi3yq
         HX/Q==
X-Gm-Message-State: ACrzQf0XgfATo7ejcVOXQ12+EQqUHBK7XX50Xu9JEgBbbJVe1doJSHyx
	ISIDF6dtwj51vlAf036Tp/o=
X-Google-Smtp-Source: AMsMyM7DrGRu1ZckB/j+d+KExxhkHncZrwIgPZ4mntXUkEcFm5pjv9/3f77na3g/19V9IdtXQUuy8w==
X-Received: by 2002:a05:600c:3493:b0:3b4:9a0e:b691 with SMTP id a19-20020a05600c349300b003b49a0eb691mr9201520wmq.123.1664429811075;
        Wed, 28 Sep 2022 22:36:51 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:500a:b0:3a3:13cc:215 with SMTP id
 n10-20020a05600c500a00b003a313cc0215ls1361596wmr.3.-pod-canary-gmail; Wed, 28
 Sep 2022 22:36:49 -0700 (PDT)
X-Received: by 2002:a05:600c:3b8c:b0:3b4:8ad1:d894 with SMTP id n12-20020a05600c3b8c00b003b48ad1d894mr893777wms.113.1664429809800;
        Wed, 28 Sep 2022 22:36:49 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1664429809; cv=pass;
        d=google.com; s=arc-20160816;
        b=Mfe8wGmv8m7Q+tQLc/2KDtALfu6LO1O3TWKYW8q+Buks+N65HqBy1a/LIn2/JVjimo
         /LjeM/9rtxnaeK0W3F4F5UzXMZDTFcat7/b/XL6mVYeBtRQzhGA83DK/asjzptLsQa0Z
         BqxPASLpBm8asr35tyVYbN+d2kuy1Ml0qB5fpu9dItDfTJAQMw6nBq7EQ9lI9U2AM8mG
         K/c5t5u6ig6pM+UJgu20MjPQq41cPGoYLtKjDV6bUwHozb9CXki3ujMospUF05iJu3yZ
         YyjfD/5riYrE3G11FDjhymzqZpw/CVGr1OWLwGcRTWbOtHzGbQx8hUuduyqUgcsH1Y0/
         VvHw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-id:user-agent
         :content-language:accept-language:in-reply-to:references:message-id
         :date:thread-index:thread-topic:subject:cc:to:from:dkim-signature;
        bh=UrOWv1ag1dIuCL8Q4/wZnOS4WGDDMGPvVBZRFbKA9p8=;
        b=VJrIeygAjbUf7GtMflH693XVzb7VYMas0DiEovrpKeK6TUmpUOA4xEkTbIW+8RaM6t
         r4hL5FZkcMjiStz6xO8TJ+h1Lp78s6lENwpjEdEYj07l9vpeSo9XEEhuG7wGHzxeuW04
         ro4evUFOOjc9rKkrFv9hR1VtCWXQJKP1e6aaYT2bmgRPOA8c9XffXMI55U7FJckAnZ3t
         whWbu/Td06AufTvDKqkHH7unpz4AhZbJKloyGgbUOE2ctymbhTkikRsqwmjA1Ucjk5w6
         SxnAJqQzXLdLT+j2eG5wQIWPmIDFD9eL4wKO/3Bi9M+OuTerb7I6gdLcf6JVsL60Dvqi
         MvbQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@vmware.com header.s=selector2 header.b=H5RxDyJh;
       arc=pass (i=1 spf=pass spfdomain=vmware.com dkim=pass dkdomain=vmware.com dmarc=pass fromdomain=vmware.com);
       spf=pass (google.com: domain of akaher@vmware.com designates 2a01:111:f403:c112:: as permitted sender) smtp.mailfrom=akaher@vmware.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=vmware.com
Received: from na01-obe.outbound.protection.outlook.com (mail-westcentralusazlp170100000.outbound.protection.outlook.com. [2a01:111:f403:c112::])
        by gmr-mx.google.com with ESMTPS id n24-20020a7bcbd8000000b003a5ce2af2c7si220890wmi.1.2022.09.28.22.36.49
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 28 Sep 2022 22:36:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of akaher@vmware.com designates 2a01:111:f403:c112:: as permitted sender) client-ip=2a01:111:f403:c112::;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jqq/4fs061YDqJQYDt4F8La3HQDB7hmUmqFGU3YS1pN/wDmqzdfHRZl/35PwnWEk7CEZCph0yXq9Ebyss3OacDFylcvO48kaJ6Y+ZDYjiQlnnleaxkgF9qfSaXx2uIpCGFoKmpAIXp3eE238W05sGQEXrotCJ7gCKwmFUtrnJgNuXd3YKJ/bRXKNwqvokvT1c0LiwV3oFx1n8rCKxrd2D0R3R6yDcbRqQJ8VVIENwkgMw/RQvP5Rx0Bm06/5sX2w4Yo9r7YIoaSwjruu77OUOgEfCXq6NbVd+R20I7to87pZBuEaXwirO9ySRuv+EBIdnQc/fM6VTxVsM6/TVqXukg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UrOWv1ag1dIuCL8Q4/wZnOS4WGDDMGPvVBZRFbKA9p8=;
 b=QZEZGuicSbEFX97REXsixki3gZOWSqNKVtadELYf9V7LNC8N6PreYqNhgG4e6ct8TfaQv31d80/yYy99yiwPd6VFPdzbue9hGX7wKx6nNcsfYhlfU5oANJHqeA+YcSmiEiX6FcKyd+VMNpS66iTlPdyzw5JB/2358TdyBQpTwTeI4W4+G/jOBKZa7Xt+kFjALRG1p+Z3YdAWdxeZyZW/MWjH/TYeZE0trK3R8ipjNwART62N8HIWfd/ib9hZml1z60tMcJlBQmdegti5Ed0xA1Ej8XY5NalaJVlrB/HHQcamwnbjZmyCSZm8swnQyv2RendvPgIcjTnHWdWdURM3sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
Received: from PH0PR05MB8703.namprd05.prod.outlook.com (2603:10b6:510:bd::5)
 by DM4PR05MB9086.namprd05.prod.outlook.com (2603:10b6:8:b7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17; Thu, 29 Sep
 2022 05:36:46 +0000
Received: from PH0PR05MB8703.namprd05.prod.outlook.com
 ([fe80::ae59:5c22:5ddd:bec8]) by PH0PR05MB8703.namprd05.prod.outlook.com
 ([fe80::ae59:5c22:5ddd:bec8%8]) with mapi id 15.20.5676.017; Thu, 29 Sep 2022
 05:36:46 +0000
From: "'Ajay Kaher' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: Vitaly Kuznetsov <vkuznets@redhat.com>
CC: "x86@kernel.org" <x86@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"rostedt@goodmis.org" <rostedt@goodmis.org>, Srivatsa Bhat
	<srivatsab@vmware.com>, "srivatsa@csail.mit.edu" <srivatsa@csail.mit.edu>,
	Alexey Makhalov <amakhalov@vmware.com>, Vasavi Sirnapalli
	<vsirnapalli@vmware.com>, "er.ajay.kaher@gmail.com"
	<er.ajay.kaher@gmail.com>, "willy@infradead.org" <willy@infradead.org>, Nadav
 Amit <namit@vmware.com>, "linux-hyperv@vger.kernel.org"
	<linux-hyperv@vger.kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"acrn-dev@lists.projectacrn.org" <acrn-dev@lists.projectacrn.org>,
	"helgaas@kernel.org" <helgaas@kernel.org>, "bhelgaas@google.com"
	<bhelgaas@google.com>, "tglx@linutronix.de" <tglx@linutronix.de>,
	"mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, Alexander Graf
	<graf@amazon.com>
Subject: Re: [PATCH v2] x86/PCI: Prefer MMIO over PIO on all hypervisor
Thread-Topic: [PATCH v2] x86/PCI: Prefer MMIO over PIO on all hypervisor
Thread-Index: AQHYx28G+J2WSwxm3kmFzqoOhSDYUK3dXFQAgBj77YA=
Date: Thu, 29 Sep 2022 05:36:46 +0000
Message-ID: <B64FD502-E794-4E94-A267-D690476C57EE@vmware.com>
References: <9FEC6622-780D-41E6-B7CA-8D39EDB2C093@vmware.com>
 <87zgf3pfd1.fsf@redhat.com>
In-Reply-To: <87zgf3pfd1.fsf@redhat.com>
Accept-Language: en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/16.61.22050700
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR05MB8703:EE_|DM4PR05MB9086:EE_
x-ms-office365-filtering-correlation-id: d3fcc232-4650-4a4b-8d90-08daa1dc9995
x-ld-processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AEvJCC9vSC4rRmYjtidDq/0soFb/XPk66LUpYD/Vq9pALypDD7Rmd4TYS0AF9befxPoQGY4S+qyYOKjCTtoAlqlO0Z1z/WhXm+SEfYODDFLRJPNA5YrBdFrvmbTpjqSUl7gjcuAIwisncPZfe8FeSWh4nNkUREAoMA3iqvKSgIk7Yw7GElMgqKZI1x3HlYIHktV/3wpw9Uq7+9o/zCQVchDCKe+yI32glG/7fSfSYK3OUIUw5j8d55UpxkAmxQcE9lMkMgc5rCm5Ouc/wqt995rMQ8TfucT3eXbDzOhcjklbaWkg9drOblzP0+YAxKv6BGXs4mMhX/LdpGxz3krNGpoWiNe/LWvIcK5PmChiqpGLCgxVAGrxuDkq3T4f3+/op3ff19KkV3mghopo+uInLzaygJN6sE7kg9LL1M4blJOg6n1CxgbAZPdPKE/VrArKjP/EuLLSRW0ATHuo+yhh/j2iiFaTNtnd6Tu/22F5nolgT7/Uf3FZsweMqoxMXtJvr/8PARn68C8E9ZjuKIVCaP5QooQaSuJdD0IwPfPZvnuoRFc8u52u/u1yaJFSGjiErtxe2p2u8bjI7BsgAKIszpVVkSA9FqOtCbj0hmExfETF4kirgL/Ee8Y1eKlA6YUPe99ehQg2mXydyeLA8DwjHItoyS7TqF9JvWnOM2s/eZ8CDcCaOmWYB0V9tPtuekZi2a3JFTAV0hoWj8CCn03c1FqqA8qw7/nYXOabil6KXHzjFAgkUW9LgMldROoO/eaXQ9sRtTUQdPeEEKkChRk5EylB0ugm7JLEbsLwRKY+19M=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR05MB8703.namprd05.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(366004)(346002)(136003)(376002)(39860400002)(451199015)(316002)(7416002)(6916009)(5660300002)(2906002)(66946007)(8936002)(36756003)(86362001)(38070700005)(4326008)(33656002)(54906003)(91956017)(76116006)(66446008)(66556008)(64756008)(66476007)(2616005)(186003)(478600001)(41300700001)(26005)(6486002)(6512007)(6506007)(71200400001)(38100700002)(8676002)(122000001)(83380400001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UVc1dktDaWVNVUJlRGY1MEFCYm5JbFhLejhOc3Vjd0hDZXhMUXVmRHNPS2Vy?=
 =?utf-8?B?SGpGeTdqNHJIRU9sczF2cHQrNTVJNTdJSlBzVW5GdUZNanZqTjROMTFLeU9M?=
 =?utf-8?B?NHE5bmZWd1h6eDE5UUQvdmRpVnRFNlhoeHBob3FDbWM3bTBBT1VHWVNmWGkv?=
 =?utf-8?B?bERZSUl2ZitZdnNkWUgvTmZOYlR0UGtiWWdRamhvNytJbktEUnZmeFpBT3dl?=
 =?utf-8?B?cFdLcjVsWk12ejI5QjBMK1FqdlBqVndvWlkyZUFKaDRqR04zNWNVOEEybTh4?=
 =?utf-8?B?Tkp6UEtIUkFCd2h4RGttY3ZVdWo5d2swYkZFNkNiNk4wUm9Ha254aEJhbFFH?=
 =?utf-8?B?RnYvbDYwanoyYWNmaEtQR0JCUnlHTHlDV0lYc3hwREw1UGRTV0ljaG8zR0RM?=
 =?utf-8?B?dkpkU1N6UzUvb2hzYm55ODVKT0FwZlRmNVVrd2RaTnhoSlJ1R3p0WEtLQW9r?=
 =?utf-8?B?T0tnMDd4ZlppQTdFL1JqNnhoMzFHSkJVYlZJSTBPTjB6bVcyS1E4ek5adXk5?=
 =?utf-8?B?WDZKalNhOWxwcERRczMzZ1czRkc5KzJVSmk5N285QUNBc3V1RnZDbjFFZUVl?=
 =?utf-8?B?OVVmWlRFdEdyaU1GWHB2YVRITS9HeCt2eURnOTRuTG1taHk1NjFEVk4rS0Ru?=
 =?utf-8?B?V2EwUEhtV01RN2ZieFUzcm1rRHhFd1NWT0NsUkNHS3VkcENoaVpGRkg2YWVo?=
 =?utf-8?B?NVF2dXdHU0FSQU0vVU9BNm90L09MdWFJcllmaEVEVFRBMkh3d2lLZUplR050?=
 =?utf-8?B?L3pCNVZQWnk2ZGxVS1JCcFRsMUpyY3Q3NEdNWVhSaTIzZkZ0VGhTSmFvQVBa?=
 =?utf-8?B?d0VyUm9qU1pHSkZ6RGl2d0NKSnMvb3JzTm9ncU44NkRKM3BiK3ZMdVRqeU9s?=
 =?utf-8?B?Wi95VW4zUmwwSkpVLytIWUFLK1BUUk44MHp1WGY0OXJpcG1ZaGJOZGh5enE2?=
 =?utf-8?B?S0pJYnIzQUp6cXRKT2RQTEFVSWxiR3dJWmd4TTBsMVZ1c2VYc0J4U2tLNkVp?=
 =?utf-8?B?OXlOd0hwbXlidjVTd0x1elFEUUpVSUd2U0xmVUVCU2JjQ2xKNjJTNUFGT3Vs?=
 =?utf-8?B?UWpUL1BrSDRnZUZ2bGZuTTVURXNhUjIyWDNQRU1HUzF5OE5JVThjSXNRY0Jr?=
 =?utf-8?B?TWJ3YnlTOW11K0ZQWWpBVXNmY2NGNU5FK3pSY1E0R2VReWFmMHZxdm5RVDQw?=
 =?utf-8?B?NUwxMFJHVTdFM3JyNk9xc0xDenQvTzlZK2IvSFd3WUFMZ1pxRWFqWWpidmVF?=
 =?utf-8?B?SHJyWDJDbHh4cEFqbnZBSUxSQnZnakQ0ZkM0c2liREVqRnM2SXpEY3RNTjdH?=
 =?utf-8?B?ZytINWNPUTdoakpNbVpCRzIwWXNqSTZpajF0N0wzbHpyRWZYbitsYU1xTmdP?=
 =?utf-8?B?azQwL01iRmZTdXE2eTluQVBsZnVYUGFvV25ubUxzY1dMd1ZlYldTdGFkL1VW?=
 =?utf-8?B?S1UyRUdocG9IZ0pNZi82ejJaV3VNOXN3TlFJbEZhdFd6S2o0a0R0UUVyRVJm?=
 =?utf-8?B?TW5qaE5VVXFUdGc4ZHJOYnljQXBNcEtFOGMvMFZIenlEQ3F2UDZoQzJ0ODJF?=
 =?utf-8?B?OVN1MG5obDYzd1ZVVHpPWE1NUGhHWVF2K2orSENHRUZYUGNTZ3RaM2JrTEho?=
 =?utf-8?B?RGh2bUQxVWNZdmNrbmZtZlVGbDdhTlNveThIc0NJcG55TkRGMVJ6SnpBSDB3?=
 =?utf-8?B?Smdvc29GekRxRHU1VkxPb0Z6NTh3MzRMQnJMK0hIMG1pYjBWSHNJa3ZVTFlT?=
 =?utf-8?B?dUVOWVUzZDlBVzI5Y3dCcnpNNk9oV2dlTDdkbEMwOGtacDN6Nlh6cjVPaUpt?=
 =?utf-8?B?MjBZc01qeFpYdCt1UW5iRWVkcUpKbW4zRXVVL24xSmJ5ZlpZMDlFQ0V0cGhL?=
 =?utf-8?B?QkJtZDIzSG1pUzdJM0JLNER6dHFvUjlvOGtyQ0JEWk1wcDJpUDVXWERKODhh?=
 =?utf-8?B?L1RydnhiUEI3dTkycG1LekRJRHVTd25kYUEyT0ZGaEcwRE9QcjVQLzVIOWE1?=
 =?utf-8?B?cmVrUVRpTTh5OFJyT2FRdTFYY0szSWF1YzRDdnNGQlgxZFYwb2RNRnBTZjUv?=
 =?utf-8?B?UDBvMEFXNlM2R0tEN20zdzBRV2VxZW05TUpPcUR2QWJYV2NzQWRDMjEzdVJD?=
 =?utf-8?Q?0kon8D7pY7xbbzbxEgfirVXwz?=
Content-Type: text/plain; charset="UTF-8"
Content-ID: <5D3D0A98AAD0B3469FE6F3A222912A7E@namprd05.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR05MB8703.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3fcc232-4650-4a4b-8d90-08daa1dc9995
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2022 05:36:46.7470
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UKFRoiPk40nURvziT0fHiKYyP9eTOrRz5hYw/BbHB+Wa0agaBFKl4pb0t8hGKCKQ1jNOfk6z9Z98YzaqyV00dQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR05MB9086
X-Original-Sender: akaher@vmware.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@vmware.com header.s=selector2 header.b=H5RxDyJh;       arc=pass
 (i=1 spf=pass spfdomain=vmware.com dkim=pass dkdomain=vmware.com dmarc=pass
 fromdomain=vmware.com);       spf=pass (google.com: domain of
 akaher@vmware.com designates 2a01:111:f403:c112:: as permitted sender)
 smtp.mailfrom=akaher@vmware.com;       dmarc=pass (p=QUARANTINE sp=NONE
 dis=NONE) header.from=vmware.com
X-Original-From: Ajay Kaher <akaher@vmware.com>
Reply-To: Ajay Kaher <akaher@vmware.com>
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


> =EF=BB=BFOn 13/09/22, 7:05 PM, "Vitaly Kuznetsov" <vkuznets@redhat.com> w=
rote:
>>
>> Thanks Vitaly for your response.
>>
>> 1. we have multiple objects of struct pci_raw_ops, 2. adding 'priority' =
field to struct pci_raw_ops
>> doesn't seems to be appropriate as need to take decision which object of=
 struct pci_raw_ops has
>> to be used, not something with-in struct pci_raw_ops.
>
> I'm not sure I follow, you have two instances of 'struct pci_raw_ops'
> which are called 'raw_pci_ops' and 'raw_pci_ext_ops'. What if you do
> something like (completely untested):
>
> diff --git a/arch/x86/include/asm/pci_x86.h b/arch/x86/include/asm/pci_x8=
6.h
> index 70533fdcbf02..fb8270fa6c78 100644
> --- a/arch/x86/include/asm/pci_x86.h
> +++ b/arch/x86/include/asm/pci_x86.h
> @@ -116,6 +116,7 @@ extern void (*pcibios_disable_irq)(struct pci_dev *de=
v);
> extern bool mp_should_keep_irq(struct device *dev);
>
> struct pci_raw_ops {
> +       int rating;
>          int (*read)(unsigned int domain, unsigned int bus, unsigned int =
devfn,
>                                                int reg, int len, u32 *val=
);
>          int (*write)(unsigned int domain, unsigned int bus, unsigned int=
 devfn,
> diff --git a/arch/x86/pci/common.c b/arch/x86/pci/common.c
> index ddb798603201..e9965fd11576 100644
> --- a/arch/x86/pci/common.c
> +++ b/arch/x86/pci/common.c
> @@ -40,7 +40,8 @@ const struct pci_raw_ops *__read_mostly raw_pci_ext_ops=
;
>  int raw_pci_read(unsigned int domain, unsigned int bus, unsigned int dev=
fn,
>                                                 int reg, int len, u32 *va=
l)
> {
> -       if (domain =3D=3D 0 && reg < 256 && raw_pci_ops)
> +       if (domain =3D=3D 0 && reg < 256 && raw_pci_ops &&
> +           (!raw_pci_ext_ops || raw_pci_ext_ops->rating <=3D raw_pci_ops=
->rating))
>                 return raw_pci_ops->read(domain, bus, devfn, reg, len, va=
l);
>         if (raw_pci_ext_ops)
>                 return raw_pci_ext_ops->read(domain, bus, devfn, reg, len=
, val);
> @@ -50,7 +51,8 @@ int raw_pci_read(unsigned int domain, unsigned int bus,=
 unsigned int devfn,
>  int raw_pci_write(unsigned int domain, unsigned int bus, unsigned int de=
vfn,
>                                                 int reg, int len, u32 val=
)
> {
> -       if (domain =3D=3D 0 && reg < 256 && raw_pci_ops)
> +       if (domain =3D=3D 0 && reg < 256 && raw_pci_ops &&
> +           (!raw_pci_ext_ops || raw_pci_ext_ops->rating <=3D raw_pci_ops=
->rating))
>                 return raw_pci_ops->write(domain, bus, devfn, reg, len, v=
al);
>          if (raw_pci_ext_ops)
>                 return raw_pci_ext_ops->write(domain, bus, devfn, reg, le=
n, val);
>
> and then somewhere in Vmware hypervisor initialization code
> (arch/x86/kernel/cpu/vmware.c) you do
>
>  raw_pci_ext_ops->rating =3D 100;

Thanks Vitaly, for your review and helping us to improve the code.

I was working to make changes as you suggested, but before sending v3 would=
 like to
discuss on following:

If we add rating with-in struct pci_raw_ops then we can't have pci_mmcfg as=
 const,
and following change is must in arch/x86/pci/mmconfig_64.c:

-const struct pci_raw_ops pci_mmcfg =3D {
+struct pci_raw_ops pci_mmcfg =3D {
 	.read =3D		pci_mmcfg_read,
 	.write =3D	pci_mmcfg_write,
};

So to avoid this change, is it fine to have global bool prefer_raw_pci_ext_=
ops?

And raw_pci_read() will have following change:

-	if (domain =3D=3D 0 && reg < 256 && raw_pci_ops)
+	if (domain =3D=3D 0 && reg < 256 && raw_pci_ops &&
+	     (!prefer_raw_pci_ext_ops ||  !raw_pci_ext_ops)

>
> why wouldn't it work?
>
> (diclaimer: completely untested, raw_pci_ops/raw_pci_ext_ops
> initialization has to be checked so 'rating' is not garbage).
>
>>
>> It's a generic solution for all hypervisor (sorry for earlier wrong
>> Subject), not specific to VMware. Further looking for feedback if it's
>> impacting to any hypervisor.
>
> That's the tricky part. We can check modern hypervisor versions, but
> what about all other versions in existence? How can we know that there's
> no QEMU/Hyper-V/... version out there where MMIO path is broken? I'd
> suggest we limit the change to Vmware hypervisor, other hypervisors may
> use the same mechanism (like the one above) later (but the person
> suggesting the patch is always responsible for the research why it is
> safe to do so).

Ok, as of now we will make this change specific to VMware hypervisor.

- Ajay



--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/B64FD502-E794-4E94-A267-D690476C57EE%40vmware.com.
