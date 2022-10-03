Return-Path: <jailhouse-dev+bncBDAYHZ5XUYJBBH525SMQMGQEGYGMFOA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x639.google.com (mail-ej1-x639.google.com [IPv6:2a00:1450:4864:20::639])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A635F349A
	for <lists+jailhouse-dev@lfdr.de>; Mon,  3 Oct 2022 19:34:25 +0200 (CEST)
Received: by mail-ej1-x639.google.com with SMTP id sa15-20020a1709076d0f00b00781d793f51fsf3630129ejc.18
        for <lists+jailhouse-dev@lfdr.de>; Mon, 03 Oct 2022 10:34:25 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1664818464; cv=pass;
        d=google.com; s=arc-20160816;
        b=h8VnOITUKnAdUg/LpjH3AchZ3VtB2bYUQlNgQWptHWc+3Hzx2kabyW24CIkl/ccdd1
         MB0XzzPzyPqja9hsrQyfEPEj/ZO5W4sanFtYi1mZaoqWmYzSfekgzIQSo0I51UfdD92y
         YKWpvsYqozvxcV4rI4KB3luwHeT9Tlsko+fW7V0cBEg0MuUjVGLL1WkJEE3yng3NDaQv
         ZxwO8Kqm4PJQ/+PUjka9SQvqSFU/xGdNUTlFIWj1SG6X0AjsnM52evXvA3ogOwlXl2Zd
         8bBn9NQPkbqZNlbQP/XUUd9d1fVFd6H3rOSOxS6k2E5+bSJ/mlfi77gs4p5cRWrS0sW3
         6GIw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version
         :content-transfer-encoding:content-id:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:dkim-signature;
        bh=IewApqytL0vIZI6NBNoC0DDwklejqwkW5nokkB6C7ns=;
        b=jtHIOLCw363P6WdS2ws5aBDBGBXpu3EpY2aNtyn6DHF5J2W3lE/g5wpJ7tybeCSzYF
         yNhiDCic1b7W8gbhEhCI9qgywXDUFi19w8Z5wp4E0KwO6EaNVKfQbBjkiVwRdgcnWZ8E
         9vGZrU5DSfv1orXxncNMidQ5m7tj0TatPw3o19ZogLAkYyM8QU8WN0gT8X48PuPS9rvE
         34rAdXa29sTmIStQBw8TpNlEzWPvDX5Zlql2gHyyj7KCqRIyUcbnPkHIqo6AsKbakzCn
         N93zOHeQtAHHgZYzoZuMO8QzpJBkqZsGy0YBjlQnBx0VeAA7kRL2kMD2ucnwroFjUqtq
         m+jQ==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@vmware.com header.s=selector2 header.b=CUBLXxK1;
       arc=pass (i=1 spf=pass spfdomain=vmware.com dkim=pass dkdomain=vmware.com dmarc=pass fromdomain=vmware.com);
       spf=pass (google.com: domain of namit@vmware.com designates 2a01:111:f403:c100::4 as permitted sender) smtp.mailfrom=namit@vmware.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=vmware.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to
         :x-original-authentication-results:x-original-sender:mime-version
         :content-transfer-encoding:content-id:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:from:to:cc:subject:date;
        bh=IewApqytL0vIZI6NBNoC0DDwklejqwkW5nokkB6C7ns=;
        b=QIZuGAocE02UieNchQLV6YZe/VvsJtoi+V2svpYoasoCpsDqmTihewHiUL0Y5tnGKJ
         PCohKQmOHrB9t88WV6lgzfMaCzFdb7mkPzwg3PLf5A6KDbIvlYFm0zdlbUPoCIWCI3kI
         +8T8Wx3tThRtCxvnt1pbxGxxkZNGk5lxVe74cFpTWEgcB/iHx+zEvDaTWg+nCQ/hlpg2
         IVCcQWsqug5nRgSQitQSZ/eWT2+i7dE/YdZVUJiiXSrp95IAJWCIKTCvNfwQYzqrxw+4
         CyOj/4NXQaIMjROahCHJ5RtcJDgjg+fVmyNTyHebOBZ8/9b4i3F5qwdtfVBEDWMKrktK
         rzpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence:reply-to
         :x-original-authentication-results:x-original-sender:mime-version
         :content-transfer-encoding:content-id:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=IewApqytL0vIZI6NBNoC0DDwklejqwkW5nokkB6C7ns=;
        b=neSchBkphlBiN2VaDmuLo73RNRG8CIFoHjfAZlKyMoJS5uc9P/DxTjl3nQYZPuvhnh
         SKXLESGI0J2vexzufqYr2nGxkKtaDVFjLexr//+iWuW08aq1Xc2RW28JEai1DwzydPCN
         SXBaXXnBTmMMqKu+QveyKcQ3bw7bvtAheTOYbhUD/pCyzwJOZnQmrJ5MGcssNstKdd5d
         Dh+QPJV6wactyep7hSBum+tyqLWIlYH9gFWDxcFXNAh8/h/AXRPyv6olPSMv++YjTMZu
         6Ch/bII/WP01AjJszOWPIcy9Lv0/gL9F4PdcEkVga+D6bip8P2QM/FSbGYZhIvGktJVi
         E50g==
X-Gm-Message-State: ACrzQf0SlL1I3WUu4tbqkqA7XkwSrAlW1AdT+j0sd7GjcmEZ44xBUrTz
	fUhttD7HT4y2LuNM+0rxp9Q=
X-Google-Smtp-Source: AMsMyM438oebLJJLZwyfWeZNLA5MSIe+Vo5ZN83syUti6584j0gIuBDM9g8S7NN0bluL8oSTRSoPVQ==
X-Received: by 2002:a17:907:72c5:b0:783:c3ac:ecbc with SMTP id du5-20020a17090772c500b00783c3acecbcmr15811344ejc.498.1664818464544;
        Mon, 03 Oct 2022 10:34:24 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:3518:b0:780:f131:b4d9 with SMTP id
 r24-20020a170906351800b00780f131b4d9ls867128eja.11.-pod-prod-gmail; Mon, 03
 Oct 2022 10:34:22 -0700 (PDT)
X-Received: by 2002:a17:906:fe45:b0:788:15a5:7495 with SMTP id wz5-20020a170906fe4500b0078815a57495mr11602737ejb.633.1664818462753;
        Mon, 03 Oct 2022 10:34:22 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1664818462; cv=pass;
        d=google.com; s=arc-20160816;
        b=0tJqrkPsCpzIZ+QxrLFBxcmesNDTqk+DOMc/bJ1PMhWmhAiVG5kpEoY3nfkI/hubLj
         G6v1mITpVObx7C+WdGkkTgIEzqSu2yL8DsoxMrkWFS/7uwEcQSfD5sZ84PePbL+5RfG1
         05I/B8pkTrX+flvtt7pV1N3VcKPPOPbAtXoIVT881vmlHRUlELS9k6+MND5wKJvRoQ2F
         /wml2nc9OWQB/tgwBU1qP3NWIY2NhfQ8Wk+7hnUoKzrjk039oHBx/7IVpddgnH2iVGCh
         HG8BxRErBun84OhmxunZr5dBPr1hsF6gtjqtZ2bBXskHJqB5VGIipCOVv9UNr19yO/iY
         7s7Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-id:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:dkim-signature;
        bh=gbnE7MrDWW5nQM+t2yG5rjk3HSDbCgVczShqlOfEIoc=;
        b=k0hUt2S2X/XKNtBFKhGPC3yKowJ1vVZmzV6FVkodTCbo4hme5OZASHh5pBZ3RzW/BD
         5eu2/w2MeclolRCXHxoH81zRnjpOFvW59Bn+Ov8Er8Rss+PPyPhI48F914IC/Q5DRUID
         PAhXMqOdttNK/J/aPWPVzhT5w5Nugo1Zf6tpUefmp/ycFr21KvVBjb8vihzujKlq7Wz3
         JiKs7Cw4llfWX5AbU75HiVZY+vYydmEJ5EeELFtJTGMe8Y/DENuC1K5jgnr67SgsPTso
         Z6XfSYwC7BaEuiU1CcVWIIzeW943oY+91xm60IcsbYD3y0o8EBxMw1Dt9XG6uW3DOQHR
         gVcg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@vmware.com header.s=selector2 header.b=CUBLXxK1;
       arc=pass (i=1 spf=pass spfdomain=vmware.com dkim=pass dkdomain=vmware.com dmarc=pass fromdomain=vmware.com);
       spf=pass (google.com: domain of namit@vmware.com designates 2a01:111:f403:c100::4 as permitted sender) smtp.mailfrom=namit@vmware.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=vmware.com
Received: from na01-obe.outbound.protection.outlook.com (mail-eastusazlp170110004.outbound.protection.outlook.com. [2a01:111:f403:c100::4])
        by gmr-mx.google.com with ESMTPS id m10-20020a056402050a00b004542c733389si330059edv.5.2022.10.03.10.34.22
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 03 Oct 2022 10:34:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of namit@vmware.com designates 2a01:111:f403:c100::4 as permitted sender) client-ip=2a01:111:f403:c100::4;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S6TBiDjzsKsM1MY3Cs6s/4tE58DAF+CPepSFV3fymCSqgHk11e0ze8qqgPmbqAo4QALAGSDJXV6L4PpLL9aK5AIJ38iTrSfjjyHIRrjb5RcbYLOIZtaJETjqgj5rlWJpsgHrCwOvk60SizhZC4AQkNOIvh573f34F4+gHhTGD89OMU+qa34k/AIZf5fwRkVCPpSg9lVsSsWOyGvt+dgte9Gg54NBsbAULii2sox0ncX5lF9K8oVMlxPxwy3OYTLNuDiy89BfsF4UzLhXBi3CpUNMBNVFz0oru+gNFs42OOYsLXp+9lxSYy9Ub9Y/A+FgyLNBGBm+Dupz5kCZ7bO6/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gbnE7MrDWW5nQM+t2yG5rjk3HSDbCgVczShqlOfEIoc=;
 b=j0vxyCIqv3m7KPwBFomzpo6DxT27uiwOhk+lMJJq+r9tOyDT33xRxPvA414hbbpsN2DYpVrZAA9Pmp79fne/Ywf3blZW90NU2FGXRXoKq5WfoLyX9ORscA2SJ0MSFwFWBcc5yahvW6rv9YDGhKr3QA0ao5l+Ibo40QX9TsmZmUhA3IHsO3jVzkwAIVd8W7LEgCjgTK+plT3LyzIKgWF+kU3yl4GwrKDnwIlG0Kyedgo0qV7mS+o0ppr2s2EwFBN5aTaqz+51Ug077zrU7HuWK2QkHBaypdWAsvtFGZLjsmJNeErsqvgEwFNm2diTsegfUu/uJogOCj1+OxpxENERVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
Received: from BY3PR05MB8531.namprd05.prod.outlook.com (2603:10b6:a03:3ce::6)
 by SN6PR05MB4909.namprd05.prod.outlook.com (2603:10b6:805:8f::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.14; Mon, 3 Oct
 2022 17:34:16 +0000
Received: from BY3PR05MB8531.namprd05.prod.outlook.com
 ([fe80::942c:7d1b:6b3d:85b6]) by BY3PR05MB8531.namprd05.prod.outlook.com
 ([fe80::942c:7d1b:6b3d:85b6%7]) with mapi id 15.20.5709.008; Mon, 3 Oct 2022
 17:34:16 +0000
From: "'Nadav Amit' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: Vitaly Kuznetsov <vkuznets@redhat.com>, Alexander Graf <graf@amazon.com>
CC: Ajay Kaher <akaher@vmware.com>, "x86@kernel.org" <x86@kernel.org>,
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
	<xen-devel@lists.xenproject.org>, "acrn-dev@lists.projectacrn.org"
	<acrn-dev@lists.projectacrn.org>, "helgaas@kernel.org" <helgaas@kernel.org>,
	"bhelgaas@google.com" <bhelgaas@google.com>, Thomas Gleixner
	<tglx@linutronix.de>, "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de"
	<bp@alien8.de>, "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>
Subject: Re: [PATCH v2] x86/PCI: Prefer MMIO over PIO on all hypervisor
Thread-Topic: [PATCH v2] x86/PCI: Prefer MMIO over PIO on all hypervisor
Thread-Index: AQHYx28G+J2WSwxm3kmFzqoOhSDYUK3dXFQAgBj77YCABouGgIAAKhGA
Date: Mon, 3 Oct 2022 17:34:15 +0000
Message-ID: <04F550C5-786A-4B8E-9A88-EBFBD8872F16@vmware.com>
References: <9FEC6622-780D-41E6-B7CA-8D39EDB2C093@vmware.com>
 <87zgf3pfd1.fsf@redhat.com> <B64FD502-E794-4E94-A267-D690476C57EE@vmware.com>
 <87tu4l9cfm.fsf@redhat.com>
In-Reply-To: <87tu4l9cfm.fsf@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY3PR05MB8531:EE_|SN6PR05MB4909:EE_
x-ms-office365-filtering-correlation-id: f067f375-a994-4f7d-f56f-08daa5657e8e
x-ld-processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IaLUdvWXEsR+zuBn4vVC5O6D2aYNnOJE1YfeoCPPy/2WQ65EDfBOC5kCLgRnYVqBSyr9lfyXrxb4R14kqV/57YCijAHSuUOwokBRVa+GK3n3g2EtHU+y/G68oJQaXGA/fDnCAGVsqaNHjgIN9ON6FdDLiggoIztOyzznnccnSsaeh1cSajSQPo5SWTwEJJF8KZd2hpfqj45M9z1bvD8f/VyItjIaAL2I5T0rqiMSje4CJBBQBzZGsoDRvmFj5VdSDLowFHWnDnB3cA6oR4GfLtLiXXNvwekw8lxIn45oNkvLd6XePYVK2bUeywI66lb95zaCTM8KknTuFLH67bclG2aYVpZ0nIQVIlPseDTirUWwdiJzXN0qdhjdnV4sCMgrt0pE9Sc4noU5eT0E6bBifqma1kZuHzmWbDEl4LN04PDraWbg6MAbNdyHi72foKiPNiucmZcFvc3URmbpfNrd+NOFy1EEY11+nASkiG9ooCff/XitFaEwzakpNFwFU5Ch/w/b0vyRb+NIqrCwp9dt1B3DRMbbYkiKcaBh3y0Pnwn4qcx1Ebi/jgmTkB47obsQDk3k/IZUSrgd9/2kNmzxJ2QVn0u8fApc0S0qQpqDMdWdUqR1sWJEudqviLIEjaJ1wtTpdCr+gjzOAuf3Zz3NoLDRLbHNsSG5bQQLGya91xXFjNTD+mLx+zBvfr8EK1dVS7yiCam9MSKIsqpE/oHIdiCBTrsitNbKIAp5vK/eqUd6EbjkCyFhVoBXDVF618Dn3u8p9yLRRt+4gtCw/O4h8o5/euzeukUR22Wth3gas0c=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY3PR05MB8531.namprd05.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(366004)(346002)(376002)(39860400002)(451199015)(2906002)(5660300002)(7416002)(8936002)(41300700001)(71200400001)(36756003)(478600001)(76116006)(316002)(38100700002)(86362001)(122000001)(4326008)(64756008)(6512007)(8676002)(26005)(66556008)(66446008)(6506007)(110136005)(53546011)(2616005)(66476007)(54906003)(66946007)(6486002)(38070700005)(33656002)(186003)(83380400001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SS9ZRWRva3lXQmpRcW9ZeE8rT3VZSlpRS2U0UmFMSGRBYVVoSjhSWUZVVFlW?=
 =?utf-8?B?YUpjQmZkRExYL0UwL1FOeFNvai90SmxVL3k3ZVBuWXRxK0kzZ1ZMK01sZFRi?=
 =?utf-8?B?cE9kcUw0RlRtRXQ1WmZoQmZDUlFtVGxWdDYycFJqcU9DSE1jRisrZzVIaGhK?=
 =?utf-8?B?ZEhLU3IxdHJHQ3FDRXhwUjhvMExZSWlpS0M5aXg5bVdLQXl4SWVDKytSdnZH?=
 =?utf-8?B?cWZERVVpVXdwYmJGdnlmbG1qbUZSZkwySXdZV0d6L1BSSEdZdjJ6UThpZ0pN?=
 =?utf-8?B?a0VITSt4NmJmSHJQUzFEekxaczZmclBpaFRreTFoSDFiR28zc1RlNlFOckhF?=
 =?utf-8?B?bTNUY2xBVTZBVk5Sdld1SkhYSmxOdmZQeGs5RGNMNHl0MldjeUE1dXgzd3Bz?=
 =?utf-8?B?b0lLOU1OWkpsNUdpVDgybkZvZ2pyNGlBUnUrdWpUTFBsblZhejJ6MFU0dE1o?=
 =?utf-8?B?RTBqaytjbUUybDZ3Z3Robkd5LzkvTkhlTGliREprOUxGbXVZUlFtWUZYNGpQ?=
 =?utf-8?B?T1UzR1QvZ2Y4TFZqNWZpNW5Fb3k1cDkzR0U2M1JvRUJDUkZlZDZsMUNMWjlC?=
 =?utf-8?B?SU9DdTJLdG42TStyUEQ4MUdBNFQwZmltNEVwVHBDZGNJYXg1QVM0eTRraTZB?=
 =?utf-8?B?WWIrYTZkMzlGT3NBeTlJcVRYWnZlZFBHcDBuOTgxVlBxSHdHRDMrREFzMlZL?=
 =?utf-8?B?WENuaUMvckYxOEF3ZjE5cjdidXRYdTljeGZvTlU2eUc0OG9VSytwVHVjNWZO?=
 =?utf-8?B?dVVFVnRVRWIya0xaQzJRM3pQM2k3M1Nxay9DRG56RW01cEJzZDRkQVMydG9p?=
 =?utf-8?B?ek1iRlFXenNaVHd1cXprc1VoQ2dLbHJEVjNHMktuVngwdzZOQy9TRFFLejNk?=
 =?utf-8?B?RWpFVGhYLzlhVXBoQTVRZU5CRDRIcUNIRDJoNjFxT1VjckNmRXpiTG9oR0lR?=
 =?utf-8?B?Y092MC9LL1VHa0NBVDcrNmhXNkxpVVJFTElZNll3WjRhU1Y5d2ZhMFJ3OG9o?=
 =?utf-8?B?VXh3aUZ6bkVHMXFuTDM5MmxOeHc1RkhVdWl5dnhJSThNNFd1N1JKUzZUOFZN?=
 =?utf-8?B?RzJzL25GWFJLRnNqVE9LakJOSFhEaHdZUVV4MTFXSWpSRDlGWWpHUDE2N1Ar?=
 =?utf-8?B?MERhbFB2SkRYeXRyR2pZQ3dHaE5UNVB4azFMMnJMQ1prM0dDM1BWcnFHOXl3?=
 =?utf-8?B?SHZQczU2N3Z1SlpFWFZxZGdHQUdKNTIvS0k1YWorRkx4QWsvUFBvU1dmOEor?=
 =?utf-8?B?RUk4NHMwanQ0bFpkRjhtdW1QcEtJWVJXYzNLUzdxWG42WHN2Z1p2Yk1YclNi?=
 =?utf-8?B?QVU1UDVYV1R1Q0l6eFZBR2NHcllVODNCSDdPMWdZZ3RNS0FSWXFKUEV0RmFG?=
 =?utf-8?B?R21mWGVoUGVIem5DWk95ZlNpNmJ6M285VlAyRXVHWkxGblg5MWNIaHE2dWJv?=
 =?utf-8?B?bEl2WXFkcjZKNHlJMkttQXh5YkJYd0JhU1V4bkpGaTR4VlVuNm00QVhMNThX?=
 =?utf-8?B?aU1YTmJhNUVkT3FFaG82TDQ1cTdNclcxQmFJRXByelR4MzFMZkEveCtaR2hL?=
 =?utf-8?B?eVhiSjBqOHVoU3FPTVRQM0JmM1RZZFhaTHFRbkNqWk9yWDAyUkIxMm5CRDRI?=
 =?utf-8?B?MFNLMCs4c3B1M1VMVmpsc0NwNk5GaUFtZCtqOUkrUU1BMjlLMHRkTEE4bFhD?=
 =?utf-8?B?MklNRDdlRUJwdVJjWi8yRnkvRVBObGp1YUcrSW43OUQwcngwM0g0WmsyVW1i?=
 =?utf-8?B?YjROVXpzSTRMa1poM3l2bzZFU2EzUkNVZEJkdTlzUU40b2JsUEdwRHF0bndO?=
 =?utf-8?B?TFppeFM2OVp3T055dDBWekxnVVdSZEFwS3I4NzVmUnNoTXdTbGZJakxnTTFC?=
 =?utf-8?B?eUx3dkErS0VHeGMxenpMVkdHTUZjM0tRSGJ5N0xpbXJrYkd6cE9hRWZBSjg5?=
 =?utf-8?B?bndPQ0lrMS9vak9IWVordnR4bHIrYkYyM0cwR0R5andKdmx1YnptT0pqeWxX?=
 =?utf-8?B?d3RYcmpjY3lCdlQvMjdnRmE4cGxYNEZoZlNSSGRYeUdDc0NyVE5YZE04d2pk?=
 =?utf-8?B?R3h0ZERDOVhMNFdGMWI2aDJ5V2RGVnFJTGZ4RGc4Nk5pZDNIZ1dqU2xTRmtn?=
 =?utf-8?Q?+a66uWCSsmVNdFG28Hq0rHmSH?=
Content-Type: text/plain; charset="UTF-8"
Content-ID: <7D0FA40BBFF97F47A797D05CA1FD21C7@namprd05.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY3PR05MB8531.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f067f375-a994-4f7d-f56f-08daa5657e8e
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2022 17:34:15.9768
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H7e6BrAlIbbPlhbwP3L1c1bni96047Ws6DuPb4ylCyO6F0J+GOacZaA0S6L4OAtbt+jZK+Hi+TbxT7kETvK/yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR05MB4909
X-Original-Sender: namit@vmware.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@vmware.com header.s=selector2 header.b=CUBLXxK1;       arc=pass
 (i=1 spf=pass spfdomain=vmware.com dkim=pass dkdomain=vmware.com dmarc=pass
 fromdomain=vmware.com);       spf=pass (google.com: domain of
 namit@vmware.com designates 2a01:111:f403:c100::4 as permitted sender)
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

On Oct 3, 2022, at 8:03 AM, Vitaly Kuznetsov <vkuznets@redhat.com> wrote:

> Not my but rather PCI maintainer's call but IMHO dropping 'const' is
> better, introducing a new global var is our 'last resort' and should be
> avoided whenever possible. Alternatively, you can add a
> raw_pci_ext_ops_preferred() function checking somethin within 'struct
> hypervisor_x86' but I'm unsure if it's better.
>=20
> Also, please check Alex' question/suggestion.

Here is my take (and Ajay knows probably more than me):

Looking briefly on MCFG, I do not see a clean way of using the ACPI table.
The two options are either to use a reserved field (which who knows, might
be used one day) or some OEM ID. I am also not familiar with
PCI_COMMAND.MEMORY=3D0, so Ajay can hopefully give some answer about that.

Anyhow, I understand (although not relate) to the objection for a new globa=
l
variable. How about explicitly calling this hardware bug a =E2=80=9Cbug=E2=
=80=9D and using
the proper infrastructure? Calling it explicitly a bug may even push whoeve=
r
can to resolve it.

IOW, how about doing something along the lines of (not tested):


-- >8 --

Subject: [PATCH] x86/PCI: Prefer MMIO over PIO on VMware hypervisor

---
 arch/x86/include/asm/cpufeatures.h | 1 +
 arch/x86/kernel/cpu/common.c       | 2 ++
 arch/x86/kernel/cpu/vmware.c       | 2 ++
 arch/x86/pci/common.c              | 6 ++++--
 4 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/x86/include/asm/cpufeatures.h b/arch/x86/include/asm/cpuf=
eatures.h
index ef4775c6db01..216b6f357b6d 100644
--- a/arch/x86/include/asm/cpufeatures.h
+++ b/arch/x86/include/asm/cpufeatures.h
@@ -460,5 +460,6 @@
 #define X86_BUG_MMIO_UNKNOWN		X86_BUG(26) /* CPU is too old and its MMIO S=
tale Data status is unknown */
 #define X86_BUG_RETBLEED		X86_BUG(27) /* CPU is affected by RETBleed */
 #define X86_BUG_EIBRS_PBRSB		X86_BUG(28) /* EIBRS is vulnerable to Post Ba=
rrier RSB Predictions */
+#define X86_BUG_ECAM_MMIO		X86_BUG(29) /* ECAM MMIO is buggy and PIO is pr=
eferable */
=20
 #endif /* _ASM_X86_CPUFEATURES_H */
diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index 3e508f239098..c94175fa304b 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -1299,6 +1299,8 @@ static void __init cpu_set_bug_bits(struct cpuinfo_x8=
6 *c)
 {
 	u64 ia32_cap =3D x86_read_arch_cap_msr();
=20
+	setup_force_cpu_bug(X86_BUG_ECAM_MMIO);
+
 	/* Set ITLB_MULTIHIT bug if cpu is not in the whitelist and not mitigated=
 */
 	if (!cpu_matches(cpu_vuln_whitelist, NO_ITLB_MULTIHIT) &&
 	    !(ia32_cap & ARCH_CAP_PSCHANGE_MC_NO))
diff --git a/arch/x86/kernel/cpu/vmware.c b/arch/x86/kernel/cpu/vmware.c
index 02039ec3597d..8903776284a6 100644
--- a/arch/x86/kernel/cpu/vmware.c
+++ b/arch/x86/kernel/cpu/vmware.c
@@ -385,6 +385,8 @@ static void __init vmware_set_capabilities(void)
 		setup_force_cpu_cap(X86_FEATURE_VMCALL);
 	else if (vmware_hypercall_mode =3D=3D CPUID_VMWARE_FEATURES_ECX_VMMCALL)
 		setup_force_cpu_cap(X86_FEATURE_VMW_VMMCALL);
+
+	setup_clear_cpu_cap(X86_BUG_ECAM_MMIO);
 }
=20
 static void __init vmware_platform_setup(void)
diff --git a/arch/x86/pci/common.c b/arch/x86/pci/common.c
index ddb798603201..bc81cf4c1014 100644
--- a/arch/x86/pci/common.c
+++ b/arch/x86/pci/common.c
@@ -40,7 +40,8 @@ const struct pci_raw_ops *__read_mostly raw_pci_ext_ops;
 int raw_pci_read(unsigned int domain, unsigned int bus, unsigned int devfn=
,
 						int reg, int len, u32 *val)
 {
-	if (domain =3D=3D 0 && reg < 256 && raw_pci_ops)
+	if (domain =3D=3D 0 && reg < 256 && raw_pci_ops &&
+	    (boot_cpu_has_bug(X86_BUG_ECAM_MMIO) || !raw_pci_ext_ops))
 		return raw_pci_ops->read(domain, bus, devfn, reg, len, val);
 	if (raw_pci_ext_ops)
 		return raw_pci_ext_ops->read(domain, bus, devfn, reg, len, val);
@@ -50,7 +51,8 @@ int raw_pci_read(unsigned int domain, unsigned int bus, u=
nsigned int devfn,
 int raw_pci_write(unsigned int domain, unsigned int bus, unsigned int devf=
n,
 						int reg, int len, u32 val)
 {
-	if (domain =3D=3D 0 && reg < 256 && raw_pci_ops)
+	if (domain =3D=3D 0 && reg < 256 && raw_pci_ops &&
+	    (boot_cpu_has_bug(X86_BUG_ECAM_MMIO) || !raw_pci_ext_ops))
 		return raw_pci_ops->write(domain, bus, devfn, reg, len, val);
 	if (raw_pci_ext_ops)
 		return raw_pci_ext_ops->write(domain, bus, devfn, reg, len, val);
--=20
2.34.1




--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/04F550C5-786A-4B8E-9A88-EBFBD8872F16%40vmware.com.
