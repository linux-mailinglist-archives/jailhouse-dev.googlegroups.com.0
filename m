Return-Path: <jailhouse-dev+bncBDAYHZ5XUYJBB4P76GMQMGQEWCSBI7Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33f.google.com (mail-wm1-x33f.google.com [IPv6:2a00:1450:4864:20::33f])
	by mail.lfdr.de (Postfix) with ESMTPS id 4129B5F4964
	for <lists+jailhouse-dev@lfdr.de>; Tue,  4 Oct 2022 20:48:19 +0200 (CEST)
Received: by mail-wm1-x33f.google.com with SMTP id i187-20020a1c3bc4000000b003be06269377sf325472wma.6
        for <lists+jailhouse-dev@lfdr.de>; Tue, 04 Oct 2022 11:48:19 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1664909299; cv=pass;
        d=google.com; s=arc-20160816;
        b=Oqes3k2sY5OysdP1dP/n6WLpDkccn8O6ZF/KT1fHhrFnsqIEywjIAAoUE9RwCJ9R0l
         UTEgR5ZRIpIWxAQO9Zs73epXM8A8nbvtHO9SCAyAwYghwuuBz5t4Ll7FLQRYY4+PDVqn
         cT+fP/jWwOj+FX64E9pDjBJwa0zj0UVFoI/aCGeVGM9iU2BWgaG8Kv/+1STzyHi2lKtO
         +hpAXVwILt/x+f0XVsGqGyFaPB3YHhqZXudwdEAbacCIqwxTI7AmdwqwgHEOeatwJx5I
         sEHiVLxARSRMDqjIe3l1ZNXuuxbCooy5GPMPoz1AIUm1F3SbWKHP9p7drJyc54cxE2f3
         dyog==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version
         :content-transfer-encoding:content-id:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:dkim-signature;
        bh=VS/Gw+lpZX6ePz5OLBYI2ULDS26YbZ9m0DTnprDsZL0=;
        b=yOIi6ll5Cjd/Qm16xBrpaKXGQDQO1Cb7f/whup64Pn3jWRcoY5kQZQgFiA0lvh/8HU
         gjDok7LTGDodOmxTnY+v5iKrG/tZPqxOcaSjtMr3scFlv8p5fY265DKqOLEe3qpxuR1k
         aGUHyb93lLTPdLhVHCjAyul1TUHpOQOinUfaPgIDcnlzY7oOnGLVA3wUhbHaOEvNOt/e
         zlCyMwHBuA6hQkDodwFeu2E/1DNHICSmkG0gFEYThHYXXxzMVmyjJks/mqNAjkCrtHdc
         vyHkcVegANaytLR+rT5IJifE2mccwC8w/ch5bk8A27vHcB2wYAVXC5Z4pBATZX3x5h/0
         /xGg==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@vmware.com header.s=selector2 header.b=1xYA4yuE;
       arc=pass (i=1 spf=pass spfdomain=vmware.com dkim=pass dkdomain=vmware.com dmarc=pass fromdomain=vmware.com);
       spf=pass (google.com: domain of namit@vmware.com designates 2a01:111:f403:c112:: as permitted sender) smtp.mailfrom=namit@vmware.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=vmware.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to
         :x-original-authentication-results:x-original-sender:mime-version
         :content-transfer-encoding:content-id:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:from:to:cc:subject:date;
        bh=VS/Gw+lpZX6ePz5OLBYI2ULDS26YbZ9m0DTnprDsZL0=;
        b=HFjURs/B57E7z1QfpVy3yJiDWBIzYPPOLvKP3Kzy5fHp1ajT95mdMqwqgLDFYDmTgB
         dV6zZW9qZlqNdLdJxOPtDMo5myrsEQcggoGmSe8bq4/IgiI8gkKFNmS0sdnI27gkTUFg
         ZReeTsjcJDKPWTVfeT2hxJyHvcZvYFCMIGXh71mHUPBmSi/qg9GqYIGNQhYgaQeOR/kW
         Nnvmr4KQsH1D4KQw1UHlT0FnEDQy/poCQSxbCCL+DmEk/mkyO/AwV6yeFHZ25DCxLsDR
         Xy9bpBZhDa15zD4HWevD6HeGaAmpauGIdWnBY/JUEmLJKfhQHjCwZFdr2gwLaNlr8j15
         DdiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence:reply-to
         :x-original-authentication-results:x-original-sender:mime-version
         :content-transfer-encoding:content-id:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=VS/Gw+lpZX6ePz5OLBYI2ULDS26YbZ9m0DTnprDsZL0=;
        b=sFFmvhMQ+8wwVWqy16JsVVgP3Qv7Ki51p5WOvsmINnqydVHK3J5s+oNtR/UCnARJS1
         yj+tybs7Re2bodIRUOwCn7UPr33/Cy/ccgQlReGSQF3A8obLpDEmqAzQtEIdezaAF0cZ
         HkPWzaUlPRQtz+ih+TzcvLxX5PjR6gYM+wJ+IieQsM8oC6mUqFc3S8UNwUdo9pWUROZa
         +2p5gzsaaZ12i2M7B1r/ozeB6pxPCKeJx3PgGChIhCSjpFtWPle0S1XT81Ti/iX+sO4u
         l1uk1f73pCh5aon3MMNZHVK0Iq129QPVNNDRIm/a7BNI9KkKb9ln5AJrp2XG7KUfSil4
         BThw==
X-Gm-Message-State: ACrzQf0wDPxattnrGYduGyG3ejMRAdqysNCN9iyW1UfHw/g0MFSLGrLc
	RNWnd2f6xZJW0ghMQBw7XEM=
X-Google-Smtp-Source: AMsMyM5jnoIR89a1VOTsOYxHpnKWAoMKIruFTP+IV7ZCrQtfDhK9cI2Q36x08Uknq2CpLLVSPqTRbA==
X-Received: by 2002:a5d:6c62:0:b0:22a:2f59:cb7d with SMTP id r2-20020a5d6c62000000b0022a2f59cb7dmr17210700wrz.405.1664909298671;
        Tue, 04 Oct 2022 11:48:18 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:500a:b0:3a3:13cc:215 with SMTP id
 n10-20020a05600c500a00b003a313cc0215ls8440212wmr.3.-pod-canary-gmail; Tue, 04
 Oct 2022 11:48:16 -0700 (PDT)
X-Received: by 2002:a1c:730e:0:b0:3b4:b0c0:d616 with SMTP id d14-20020a1c730e000000b003b4b0c0d616mr810400wmb.72.1664909296891;
        Tue, 04 Oct 2022 11:48:16 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1664909296; cv=pass;
        d=google.com; s=arc-20160816;
        b=nyFi2UWuufBDcnArqe0OT8naLrj0VEFdZVyVDYguCQyCfsRGTy5SeaHWxLgcC6YVAb
         LuIY1iTd+BFeEoTPh25oXMzrFizrfVXwTUGcB0WykFLIEZSlfmBcYFjf+V1NokQkzj32
         HdhuKB5VzVbSArd01VvppcRoWVAjQqVzEuh1KEFHH26irfrPNNenyKAG/b7lTlIHWMSs
         sJzjWHeawSVeOcubpUxP0ad2eaeq7tXyCdfT6LRFUvnchsg3aVGRrbcF6kAjhrsdFESy
         AQ1OKe5m/YBmscHxVjjRmsb0IDwPLqMuB3ljhNcs+tVCan2rdeb9YBjU/tRcSPhWTbWy
         HmVw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-id:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:dkim-signature;
        bh=5LryRDm8y+65OMvtow/u/52xXaCbdUb7ljWmYRrN11k=;
        b=xhY1GPrW898GB+PBs1Mpp3EYRynIDTv6uQ/lz2qLnDTLuMHqcC+RaCyRUB5y41HYZO
         8BzGN+QJXm85EugcTk8Ady/Lzl0B93vI2rWczvvR0uUmtSXk4+7bCedrA7JXkTYLQpSU
         Tx9YS5jYN9Lb1SbJdfF0BtKS8npoiM6UU/REpQFIFabg3WSNI6q7BBgthyX8Js8ftFxB
         c2YRKTOnD/72vYUqIke3YLfKGI3Ih2u6wt499OBq1g1zUaJSDXjVrel1m+n6/a9LF0W/
         vzLYSIQgi5A/ToR5H0TDJn1hKAmiu4/GBNsY81HmoW0mE97cMqH8OG79V2Yy2DJAERyR
         fQ/w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@vmware.com header.s=selector2 header.b=1xYA4yuE;
       arc=pass (i=1 spf=pass spfdomain=vmware.com dkim=pass dkdomain=vmware.com dmarc=pass fromdomain=vmware.com);
       spf=pass (google.com: domain of namit@vmware.com designates 2a01:111:f403:c112:: as permitted sender) smtp.mailfrom=namit@vmware.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=vmware.com
Received: from na01-obe.outbound.protection.outlook.com (mail-westcentralusazlp170100000.outbound.protection.outlook.com. [2a01:111:f403:c112::])
        by gmr-mx.google.com with ESMTPS id 125-20020a1c1983000000b003a66dd18895si142491wmz.4.2022.10.04.11.48.16
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 04 Oct 2022 11:48:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of namit@vmware.com designates 2a01:111:f403:c112:: as permitted sender) client-ip=2a01:111:f403:c112::;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=faXLpyR817QtBcFMKI0+xw3BvO3d9Ve+n3TqY+weBJyLPNH9dd8+4UFDqqmnEL7a/59jXuNGQV67t6uucgJcs/2reRrEiY/KNuNI5i7eXQ16q2g2IMPDI1QL5+45qZSKUzu1GWfn4TX+tQCBvEG4XwwLni7dbh4Vk++DeOIgScdGjBEea9sTExGIAEXUEOaXuepqdCaQ3TDq8voo5A456BBDoQKmjtnigrZqKCsfx6DzYk4cVVt+eaYcsEzy25xeO9fSCJwK2Fex3NX6AclOVfo5TxODuRwtMmZUAVYMX1cAknqS2aDJpuJwzL2nn2OjTxlt3xCqWhJM9G017JggHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5LryRDm8y+65OMvtow/u/52xXaCbdUb7ljWmYRrN11k=;
 b=OfaIQ5nFc6q2MHkmmYyc11nktToLIW+x3EkYoXIwzsj2S6lyz8VZrqXssXhFnF5mv04nSJ+W7nXUHYiCPGlveA5E62E7GKWTCRqy93Y1G8NPgEQEoeEgf6I5SbQJQKO/S99liw48Nns5IBwvYX+rasI8wxZbbV/jTkQ4a+1ntCmC09GZVtgFXfQ0+v3d7F+aYkA0qDFZCVdtBluHI6kTXQ9J3Ujim8/jwY5eG7KLfw3XOIqwknYRclh0oF7OkwdNaCglSYehwO6TuMIaC0QK1IJ75NA3zH4Jf5pArjxcIMPfFYzJTFKE6YEFIV4jh1PE+/H/SEjCiNCVmA57PqX31Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
Received: from BY3PR05MB8531.namprd05.prod.outlook.com (2603:10b6:a03:3ce::6)
 by DM6PR05MB6506.namprd05.prod.outlook.com (2603:10b6:5:126::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.3; Tue, 4 Oct
 2022 18:48:11 +0000
Received: from BY3PR05MB8531.namprd05.prod.outlook.com
 ([fe80::942c:7d1b:6b3d:85b6]) by BY3PR05MB8531.namprd05.prod.outlook.com
 ([fe80::942c:7d1b:6b3d:85b6%7]) with mapi id 15.20.5709.009; Tue, 4 Oct 2022
 18:48:11 +0000
From: "'Nadav Amit' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: Alexander Graf <graf@amazon.com>
CC: Vitaly Kuznetsov <vkuznets@redhat.com>, Ajay Kaher <akaher@vmware.com>,
	"x86@kernel.org" <x86@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"rostedt@goodmis.org" <rostedt@goodmis.org>, Srivatsa Bhat
	<srivatsab@vmware.com>, "srivatsa@csail.mit.edu" <srivatsa@csail.mit.edu>,
	Alexey Makhalov <amakhalov@vmware.com>, Vasavi Sirnapalli
	<vsirnapalli@vmware.com>, "er.ajay.kaher@gmail.com"
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
Thread-Index: AQHYx28G+J2WSwxm3kmFzqoOhSDYUK3dXFQAgBj77YCABouGgIAAKhGAgAD4GgCAAK7iAA==
Date: Tue, 4 Oct 2022 18:48:11 +0000
Message-ID: <DF8775A4-5332-412C-9359-749E96E83907@vmware.com>
References: <9FEC6622-780D-41E6-B7CA-8D39EDB2C093@vmware.com>
 <87zgf3pfd1.fsf@redhat.com> <B64FD502-E794-4E94-A267-D690476C57EE@vmware.com>
 <87tu4l9cfm.fsf@redhat.com> <04F550C5-786A-4B8E-9A88-EBFBD8872F16@vmware.com>
 <f1a7e603-2e64-fd2a-1100-f2898060e3f7@amazon.com>
In-Reply-To: <f1a7e603-2e64-fd2a-1100-f2898060e3f7@amazon.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY3PR05MB8531:EE_|DM6PR05MB6506:EE_
x-ms-office365-filtering-correlation-id: d5d88cfd-0020-437b-20fb-08daa638fcb5
x-ld-processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yUkOPRZfOWa7TMe9u6E+zE8eWAgB2mNeP+wgcJ+/Yw9ueVfZK6haCABVNj/vlWESgQ4eUqw+gBq4/D3I0ECl3/9kPwrE/R8ubaNv0JiuN2XYndjJy65g9+3VptWD9iwh3zmgwOVoJYysoYXfdOLautz23qldH4Elu7+4raxobFBGQVVk/F71luw3XS8hAlaxfLaF8sn3ZAzb3MVxk0mBQVP+ojLI9FPovukpVSnMYyggXxFDHOhof8y2t0w12dmzRkGkBzfaInec/YW3e1HqN6B7wqeH3a6/tXYxW0GUuDOmhAfCWMK3ZLeRHKS/cW7EEUsnwpQWvGzzwtA6xrS+nZNLpOKpUrEepWOLB+ldYeWfp/bv6qBiOHFAjV2JQGOoeZH1cymF+T1GaUJxvzJ/MecexlUnoXjREwnIVQR0TK/76j/Gj+E8Mq+4OdYjDURF+xf9Ho4vXi3b2j82Xohu7KOWG33WBl70ThFfLXfdDNervkygUW68CDgaSDfKpL/ku3mtSkzxuDZm7nlsK3RSbXKvExPDs6nDo0X5joFgsAgxknPuHfwWwR05pSkoEdDX3twISc9yATqLn/8KJiXRV7k8T78I4PfwWTtCt3hGXRId9dEM0hUtPI0MeSbYmFG90mrTfDvaXJxoy36YR7FoA/Zb15prxv3Rg3Vh1GgtakcgP2kuu7OSWCNOu0SyD1YHdKPMNUbNsJ3L/+9hNJVwjmRSdICwh9Mj6y54Z3jDwvrctPKIsl7s4dAA7X/AKDSodGik0IHcOQ3u0OQEuLZwuX+ONuHm5TRWKWRZNhc1uqRuQZ5+gX4wE3xLo2PfpmJfC46sZ9UHTZLpB9KHRvz6EJyh3HEWw5TGKK3K6D0xpI/MYwYbMTx3+J4UlaaFJlkoDFlIuiBS8mCQmD8mtcCv8x/uW1O3bqqbnoHXaDMk+iUqqNwa8mRCx2AfmtyYsZ78
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY3PR05MB8531.namprd05.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(396003)(39860400002)(376002)(366004)(451199015)(2616005)(86362001)(186003)(66476007)(76116006)(66946007)(83380400001)(66446008)(64756008)(38100700002)(66556008)(38070700005)(71200400001)(54906003)(966005)(5660300002)(122000001)(478600001)(4326008)(7416002)(8676002)(41300700001)(8936002)(6916009)(26005)(53546011)(316002)(6512007)(36756003)(2906002)(6506007)(6486002)(33656002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UkRBVzVtb2cwWFN3ZXp2dnFYaWw2Qmw0L00zaDZFZDBHbjB5T0d1MStnZ1Nj?=
 =?utf-8?B?WkZKM3VqTDNrYW9wR3VGakFKNzhqejNNYmc1TmZ0NEwvRFlGTVpoUHp2UHJj?=
 =?utf-8?B?V3k0b2MyNEV3MXFBMGpJak5INnBjZzJFaTBvZWdOb2tGS3o5SjEyRmQ4cGtk?=
 =?utf-8?B?emF0TmlJSTVxam81VkVXbzdzbnJzV1VaS1FwSWFiNmdydHYwZ1ZvR2U2UXla?=
 =?utf-8?B?eTU2S0JCRTRTNkczRE1QamdhY0VGZWQ0T0p4U0dqUFBaemJQbWN4eXh3RmVB?=
 =?utf-8?B?TWR6Wis3QWJ6KzM3a1JTVFIvTUk4WGV2L0k2bTZYQXBtc1NBcHdQM2VaRFQy?=
 =?utf-8?B?VCszcks5dlpObmNDSXdrVXdiM2RNK2dud1BQZzZhd2NXZElLc2dSN201Rjgw?=
 =?utf-8?B?YWMyTHpQQ0c2RENBWFpodVVXODZYMUhhVkJqdmhpSnBqRUJsRWdCd3JZU1hH?=
 =?utf-8?B?ZTJUN2syZG1wbGhlYnQ1cXZTS3ZDOG5yQXFkTW9VcUd6WHUxbks3bTAzNHB1?=
 =?utf-8?B?SWJ3NlFEcU81KzJMb1J4b0J1bHo4SVh0N0dNNHIveVVmdU9KYTZMUXA2dTUv?=
 =?utf-8?B?QW1MWmY2d3dxOUcvanFWNUpUcXZRbFQwZi9SUExVZ09vN1VRTGQ4S091Z0dn?=
 =?utf-8?B?SllxVmlWRXJSKzErQjRCajRJMXFIRG5TcURGaGQ2dnZ3bUdpZmMvakVZeEJS?=
 =?utf-8?B?S1dIblNyR2RsQXN4TUZpb2xVRERtS0kxaGJOanJUaXJQaVJkT3VCaDExa0xa?=
 =?utf-8?B?TDgvTW9qZ0ZGditLcUpWd3hjQlR1QXRLKy9xMGJsMWNpK3NQL1lmMU5HektW?=
 =?utf-8?B?bDJYOFRhUXNEUWhxaisreGFtZk95bmNJelpyVnpIN2JzYnVlNDg1SFJ2d2lU?=
 =?utf-8?B?dmhYaDg3M0IxQ3drSXdXTU0zbFA0cjR2Y0wzem84S0tRYmZ0anF6YmlRSzB0?=
 =?utf-8?B?RXZ0YnNsVmQySnBzMU9WMXB5RzRQenAydVpTS2ZsWEIyNmovMUpIMVZiWnZK?=
 =?utf-8?B?dVBUOVgyUk5iTi9EejRTR0I3UzQxbGZTdVUybmNGUW9kMHorTFhWMEt5YUNL?=
 =?utf-8?B?eXdvbXhITC9GbDh2QVJOOXBiUXowSi8yM1cxYmdZSjV1cDFMM0V1Slc5M0d2?=
 =?utf-8?B?ekROVDF0MlRpcm03eTdVRThMTlAweUZSczN0TU5nNEpHUjVtNmNwZllWWVhR?=
 =?utf-8?B?a3JYZ3NJQzZ4Tml6TkFuYmhCZmJBV0hrelpIMUJWcm1uRWcrNjhqUmZNNFR1?=
 =?utf-8?B?Zzhhd0ZlUUhEbHlsVEcwanNVTVBZK0h0U1UxSFErS1dpQXhabVIzcTI1Tnkw?=
 =?utf-8?B?ZWd4VW1Bc21tbi9kdjN3dTRpcjZweFB6MXdSNC9oaU8zUFBzYVlmRDNVRS9o?=
 =?utf-8?B?NEtOR1lURThDRG1pMWZpS1gvMmRoYjJ2Uk9HcUluNnl3UkFZeDE4TCtqcHlM?=
 =?utf-8?B?NFR6TVZkczl6T0FmTnY4bWJQeTdUb1dUZW9ucTIwc21PTkppcDJ5emFWa1B2?=
 =?utf-8?B?M3piZExEM2g4b0dwUnRQR2hMc2pvU0FqQ3p3TW8zSC9LeFhla0RDZE1IbGt2?=
 =?utf-8?B?OHBmZ1F2My9Yem9pNFIwc1U3SlgwT1VuUGtqY3NXbGdBUTNhNG1FQmIyYkRX?=
 =?utf-8?B?RnJjYkRJang0QjJEYzJBTzBBdVo5Ky92eDJYRitwTVhxYkhVUGI3ZnhnVlJE?=
 =?utf-8?B?em81MDN3bGRyTWVUbUIyazF2dHB0N1ZqZy9pSytLeHRDWndNOEVwTGJGZlMr?=
 =?utf-8?B?V2p1VjVTdnEzMkJsOWl6K0ZpM0xvVlJpOWtFTTJxdUVhV1FDMjJHTlZSeXlU?=
 =?utf-8?B?K0tBZ1ptREJYVURRaXIrdG1PTFBSd0pQcWcxcTVXczR4K3FqcXlteHNsZk5E?=
 =?utf-8?B?V2JYOUxCSlJjeFhlaTBoOFpENTdLMXZkTjk5UHZINy80QVFCYzIxR2NIZE1K?=
 =?utf-8?B?YmJpRVMrRlNTWE5qVTh4S3U5VzI5TXZ3VHF1Vit2eUNIUFdDTTVoZkFYRTlY?=
 =?utf-8?B?MEhDQTVvY3d2Y2h4d3BBUXRzWXh2UDl4ak1BRVdCQk93UjZYNjRERmR1Z1VS?=
 =?utf-8?B?T04vL2hseHl5NS9JQVFYN0UvRmVwaDVyL3E0UURiWDdYa0FwbVduajc5NHFz?=
 =?utf-8?Q?304/N3MbaDAjuFkXfuYs4BRy/?=
Content-Type: text/plain; charset="UTF-8"
Content-ID: <4170C95495E7224CB50BF35570867FBA@namprd05.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY3PR05MB8531.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5d88cfd-0020-437b-20fb-08daa638fcb5
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2022 18:48:11.3829
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nQd9N0EHsEM5bd9MDUlqtEYo78OtJmXmyR3tvUaz61ImDGbTaqnPAv3ScHoCX7bPjEdaH6cWyMLxtcK1MqjfJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR05MB6506
X-Original-Sender: namit@vmware.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@vmware.com header.s=selector2 header.b=1xYA4yuE;       arc=pass
 (i=1 spf=pass spfdomain=vmware.com dkim=pass dkdomain=vmware.com dmarc=pass
 fromdomain=vmware.com);       spf=pass (google.com: domain of
 namit@vmware.com designates 2a01:111:f403:c112:: as permitted sender)
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

On Oct 4, 2022, at 1:22 AM, Alexander Graf <graf@amazon.com> wrote:

> =E2=9A=A0 External Email
>=20
> Hey Nadav,
>=20
> On 03.10.22 19:34, Nadav Amit wrote:
>> On Oct 3, 2022, at 8:03 AM, Vitaly Kuznetsov <vkuznets@redhat.com> wrote=
:
>>=20
>>> Not my but rather PCI maintainer's call but IMHO dropping 'const' is
>>> better, introducing a new global var is our 'last resort' and should be
>>> avoided whenever possible. Alternatively, you can add a
>>> raw_pci_ext_ops_preferred() function checking somethin within 'struct
>>> hypervisor_x86' but I'm unsure if it's better.
>>>=20
>>> Also, please check Alex' question/suggestion.
>> Here is my take (and Ajay knows probably more than me):
>>=20
>> Looking briefly on MCFG, I do not see a clean way of using the ACPI tabl=
e.
>> The two options are either to use a reserved field (which who knows, mig=
ht
>> be used one day) or some OEM ID. I am also not familiar with
>> PCI_COMMAND.MEMORY=3D0, so Ajay can hopefully give some answer about tha=
t.
>>=20
>> Anyhow, I understand (although not relate) to the objection for a new gl=
obal
>> variable. How about explicitly calling this hardware bug a =E2=80=9Cbug=
=E2=80=9D and using
>> the proper infrastructure? Calling it explicitly a bug may even push who=
ever
>> can to resolve it.
>=20
>=20
> I am a lot more concerned with how we propagate it externally than
> within Linux. If we hard code that all Linux kernels 6.2+ that are
> running in VMware prefer ECAM over PIO, we lock ourselves into that
> stance for better or worse, which means:
>=20
> * All past and future versions of any VMware hypervisor product have to
> always allow ECAM access for any PCIe config space write
> * No other hypervisor benefits from any of this without upstream code cha=
nge
> * No real hardware platform benefits from this without upstream code chan=
ge
>=20
> By moving it into MCFG, we can create a path for the outside environment
> to tell the OS whether it's safe to use ECAM always. This obviously
> doesn't work with MCFG as it stands today, we'd have to propose an MCFG
> spec change to the PCI SIG's "PCI Firmware Specification" to add the
> respective field. Future VMware versions could then always expose the
> flag - and if you find it broken, remove it again.
>=20
> Putting all of the logic on which system potentially prefers ECAM over
> PIO config space access into Linux is just a big hack that we should
> avoid as much as possible.

Thanks Alex. You raise important points. Let me try to break down your
concerns slightly differently:

1. Enabling MMIO access should be selective, and potentially controlled by
the hypervisor. The very least a "chicken-bit=E2=80=9D is needed.

2. PCI SIG would change its specifications to address unclear hardware bug.

I think (1) makes sense and we can discuss different ways of addressing it.
But (2) would not happen in a reasonable timeline and seems to me as an
unnecessary complication.

But before we discuss how to address the issue, perhaps we need to first
understand it better. I am not sure that I understand this MMIO bug, and so
far nobody was able to provide exact details.

So I went to have a look. It might not be super helpful, but for the record=
,
here is what I collected.

First, we have commit d6ece5491ae71d ("i386/x86-64 Correct for broken MCFG
tables on K8 systems=E2=80=9D). It tried to "try to discover all devices on=
 bus 0
that are unreachable using MM and fallback for them.=E2=80=9D Interestingly=
, it
seems similar to FreeBSD code (commit 2d10570afe2b3e) that also mentions K8
and has similar detection logic in FreeBSD=E2=80=99s pcie_cfgregopen().

Then commit a0ca9909609470 ("PCI x86: always use conf1 to access config
space below 256 bytes=E2=80=9D). The correspondence [1] mentions some bugs:=
 ATI
chipset, VIA chipset, Intel 3 Series Express chipset family and some report=
s
on Nvidia. It turned out some devices had problem probing - to figure out i=
f
MMIO is broken - the way the previous patch did.

All of these bugs are circa 2008, of course. And note that FreeBSD did not
take a similar path. The correspondence around Linux patch is endless. I
admit that I did not understand whether eventually the issues were found to
be per-bus or per-device.


Back to the matter at hand. The benefit of using the MCFG approach that you
propose is that it can enable native systems to use MMIO as well. However,
since the list of bugs is unclear and the problems might be device-specific=
,
it is not clear what information BIOSes have that Linux doesn=E2=80=99t. In=
 other
words, the benefit of getting it into the specifications is questionable,
and the complexity+time is high.

Can we agree that the feature would be enabled explicitly by the hypervisor
and Linux would enable it based on the hypervisor input (through some
channel?)

Thanks,
Nadav

[1] https://lore.kernel.org/all/20080112144030.GA19279@jurassic.park.msu.ru=
/T/#u

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/DF8775A4-5332-412C-9359-749E96E83907%40vmware.com.
