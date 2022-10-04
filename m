Return-Path: <jailhouse-dev+bncBDAYHZ5XUYJBBPHY5WMQMGQEUKQKWXI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33a.google.com (mail-wm1-x33a.google.com [IPv6:2a00:1450:4864:20::33a])
	by mail.lfdr.de (Postfix) with ESMTPS id 055935F3A7D
	for <lists+jailhouse-dev@lfdr.de>; Tue,  4 Oct 2022 02:20:14 +0200 (CEST)
Received: by mail-wm1-x33a.google.com with SMTP id c2-20020a1c3502000000b003b535aacc0bsf9993822wma.2
        for <lists+jailhouse-dev@lfdr.de>; Mon, 03 Oct 2022 17:20:14 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1664842813; cv=pass;
        d=google.com; s=arc-20160816;
        b=bUTH8GYLJrxRDbgOOHY0L/6yKY2xQpQLdj6UXkV8mzaCZYTYhscTTvwPUKepWsW6Xt
         HGVMIBXYoAbOxQlwYWGDi5BsztmSp7najsdZpS4NfBLFW0URhDE7kpzlEC7Flxw0cdgD
         QBQWHqt44GDFKIwORpAFu+jc1uXnJ5gByYzsU4tAoV26u6L+SDB0hmc78hNOPVCEAQ+t
         qkPZADAMjPnEu3OSDyOyb04xd3Ue6vNLvcdTXV3pbDjM6yfl5n2pJEq3rx+2n9SqI9GL
         O9qi6P4WCyOkHJDim9e8ewMvcP5mvF+AhLnat7RswnCOy2Z0c/sLGqU+WX+7bBcMV6aA
         BcbA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version
         :content-transfer-encoding:content-id:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:dkim-signature;
        bh=FjEoNY1ZxGzmr6gxZi7ydzuNamFYgcTau0hAhsv1Qqk=;
        b=zgLOboxqUwu5AWzBn3CGSN61JdodKRZcfCEQgiFwz1g5YTHreWGUrl3Nws4ojA3shF
         OPzjMwXGWFGR85sTqYpkzaHprAGB7sNZRH93KjrdQSrGJbE/Q+ofJR98EH58usEaGh+H
         buhuVRy98y6X5AoRCfCR1fPsJNhK4kJq3kaLdhNkOmuOMHHgzdeJ7UZTVzBe93vSyRpe
         CsDo56tfsre/t0rjQLV1oSAGnsNoTPSmtNtlobisWv/dmz1KDp2MDQnCFqQdsUMTWexc
         t/vlPgJyIBXE152lcs9HCtKkFjfc4s+vWtkpnz0SKAOnsE4EuBTrUuVQv5iBeGOKnyC1
         iqwA==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@vmware.com header.s=selector2 header.b="VxG3iK/Q";
       arc=pass (i=1 spf=pass spfdomain=vmware.com dkim=pass dkdomain=vmware.com dmarc=pass fromdomain=vmware.com);
       spf=pass (google.com: domain of namit@vmware.com designates 52.101.51.5 as permitted sender) smtp.mailfrom=namit@vmware.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=vmware.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to
         :x-original-authentication-results:x-original-sender:mime-version
         :content-transfer-encoding:content-id:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:from:to:cc:subject:date;
        bh=FjEoNY1ZxGzmr6gxZi7ydzuNamFYgcTau0hAhsv1Qqk=;
        b=FFHcl0Y1aHuPtKi08ldkqraLGA+UfAl8VbM9wSrL1BaHLMohkaBFCtYRRzVy3iQdaN
         2iplwYvEUYktyE4zvJgpItCoJ3UMbcIGhuB2UeDTe+xGN8KoN6a4VpCLJC0XCwaa07ty
         QYWpv88cZ5iiZS3yB5k83Ggr2IfZsJZ9NdNrGLryo+i3TDCS2ltlbInbNjizGb1ih2PF
         EmMKg09NwwL2BTKR12GQN/wvY2GYjXFYqYDbYSe8D4yPHa7HflcqBGtYUWgu5sXupJA+
         UtRCXBsaQsGbVsFgHwmwphwsJnJnOTsjWv5OXthwH5T1vmme4XNaLjBLZMvjUVAuOF4R
         0PkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence:reply-to
         :x-original-authentication-results:x-original-sender:mime-version
         :content-transfer-encoding:content-id:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=FjEoNY1ZxGzmr6gxZi7ydzuNamFYgcTau0hAhsv1Qqk=;
        b=7WxhOYDPPLrG0xbUso7wJuXOTvo6QO1s87tFnZMoHyDu5viiwtKQparWv4wFBhi0aS
         fi00lFIjaLXRVJGfRHjIQwHP9bCl4rUPNzl2Ioi4K9Hv4NR1arATunamxSJaYsntrHQz
         h18vTX27RMqIFkt7c/p2sh9XQvU/DvbnCxjVMAac4Mp4kBEB64heQy85d5eurFJ7lGZK
         Aqc+Sp3OV6PQXJoLw5u2RuXVOzA8AOZL0h4VDOsWKfeTAULxK9DXHiKXp/sHtw7lyfrA
         lFDAeKRa9ueiItFwVsjXjkNRUlDwtaVC5NPu7wZQqJ8PbdOXpbZXN7796mWMMlEuIt7G
         oQ4g==
X-Gm-Message-State: ACrzQf0G3kKa9zpPIXpk1I4Hs7XQzclxGKU36PTBAQ3NF8Z1W9Q1wn9X
	8LIKn047pTpR6gGxwwnSVGE=
X-Google-Smtp-Source: AMsMyM7ErP8lsxy4tAcR7hbL436a3hsaCLLXpHYIy6ABrIJeIWSm+vcd2jcPnzb98W1a+YGL/OFmnQ==
X-Received: by 2002:a05:600c:3d8f:b0:3b4:aab6:4a97 with SMTP id bi15-20020a05600c3d8f00b003b4aab64a97mr8623977wmb.82.1664842813412;
        Mon, 03 Oct 2022 17:20:13 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:7714:0:b0:3b4:a307:9032 with SMTP id t20-20020a1c7714000000b003b4a3079032ls6174313wmi.2.-pod-control-gmail;
 Mon, 03 Oct 2022 17:20:12 -0700 (PDT)
X-Received: by 2002:a7b:c8d5:0:b0:3b4:76bc:5dae with SMTP id f21-20020a7bc8d5000000b003b476bc5daemr8446764wml.122.1664842812091;
        Mon, 03 Oct 2022 17:20:12 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1664842812; cv=pass;
        d=google.com; s=arc-20160816;
        b=gAZlLOkaOVry5CMARNBhWHGKrl05+PGih3L8k49S/iLVJFIimT9r9K+xGgErhBccru
         k3bX6LzcXwpMotVEPXkzIAJguPZf9gR9oKTVVjgVSIkI1LGpDcVI6uQ44+xFs0ouB/Ed
         Ph4qwakY6IBxYyukVLKME1yMmUK0thdmtZ7nadRJ6oswdi5l3fUAl0pVH4pI/avaHCzL
         JqGfHWW0GlhxwFevuAF6LorR4u5FyY/Rl9gw5h7y3sm6V4ixhRrwdZpPOJCmJmrabJEW
         ct3jR6QFT6qW4fEouKnr5RWvzUx4LfFKz40wyN2PGBlzZ9u7jSj27bLZAO6eLzPH9j/n
         7StQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-id:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:dkim-signature;
        bh=v0UkDABw6ohtJ22tdaxOAXwyPxZuELnjvmHTTEte5wQ=;
        b=yGynEZN+0p50JMivqQonZQktFvhpKjYIKBjYv27+7Kb/PUoBioZsG7f/l/PVaehgXm
         zogtBC0CrIMMC6QDz8gj4g0Yxv5qZnbF6xnBc/4F1eIMjArvTUsSSH81egOAuI0AC9EQ
         ssAv/VVK7Y4E5HUwv4VCkRxu/QiVO5vI65VuHdTyG5dfwBxIBkzVeWKWF+FXrVPoMFs5
         gnY/3g1sPc+E9K1jIGlg74vayYfF08ikTk4DOF3NnsbrHIjEN8ULRY7OV+r+Ywz9Tzui
         Lg3Fj62AevGfxvWuvwwnmtjzdYtt7kUWedFj0mlgO3ZkrdQ7vJPHcLO2NJL4hKCHsTNr
         ErkA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@vmware.com header.s=selector2 header.b="VxG3iK/Q";
       arc=pass (i=1 spf=pass spfdomain=vmware.com dkim=pass dkdomain=vmware.com dmarc=pass fromdomain=vmware.com);
       spf=pass (google.com: domain of namit@vmware.com designates 52.101.51.5 as permitted sender) smtp.mailfrom=namit@vmware.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=vmware.com
Received: from na01-obe.outbound.protection.outlook.com (mail-eastusazon11010005.outbound.protection.outlook.com. [52.101.51.5])
        by gmr-mx.google.com with ESMTPS id n16-20020a7bc5d0000000b003a5582cf0f0si316860wmk.0.2022.10.03.17.20.11
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 03 Oct 2022 17:20:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of namit@vmware.com designates 52.101.51.5 as permitted sender) client-ip=52.101.51.5;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nQiZCd/Uh5bRd+4d7oXqpdQVGiBfC7DDhOKJ/yK7aN88euOb0L+8+/ZZZhkrVttgcjRXRDKwWRqH3lPO/fxwkR9EZGixPsd2SbAe0N3IIYLCmg1pCo55TU+r+mQJ9Zr0GDAexqf8ELodJM+6Q7fv48tp6i/5160NFc9cMbtZbhllS1juQyQv1fIEabLp2+xUyCVjEw4lJRghf3ZsjE7GYyC3z2ATe3R3e2r5U7au/c4XY6ifnvtDocWjJeXU6vBtGWq5Xq10uoqXpBFruTS6auz3Kvk57SuUXOUqvGGopWtGtG1Qo5F6sEjHp1QhEToNb4eznt6ij9BSJvhvfViTHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v0UkDABw6ohtJ22tdaxOAXwyPxZuELnjvmHTTEte5wQ=;
 b=QD5Q4msO1l7Wsb36AnPhMkKI2+Ll7pCrk083nLSScpqaC5zF4+YSFsJxSRRNb1bM8Z12QWAWuhuTHr7X080OIcQfYy/nvcErlWguPqqDnCc7deUEGIChZPOzZwf38xiOeDrU2sw5WubWIhDpSl8YI7sj3pgknu452n5FyNQFbVdVw91v96plYtI3E7jXqeY529S2huS+PsKGuJwwa/VLPIk3jobbIUrcIcG0grtG0q/RqcWruJQG6MQ4CzkNA0Nb9o54Mw692ixL0v4wyByhOkKZ19Hu5lIGv0JU3zN8UfEgV0/+/b42mNru9PmdenAmZzllAEFuxKb6ywose2fw8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
Received: from BY3PR05MB8531.namprd05.prod.outlook.com (2603:10b6:a03:3ce::6)
 by MWHPR05MB2797.namprd05.prod.outlook.com (2603:10b6:300:60::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.8; Tue, 4 Oct
 2022 00:19:47 +0000
Received: from BY3PR05MB8531.namprd05.prod.outlook.com
 ([fe80::942c:7d1b:6b3d:85b6]) by BY3PR05MB8531.namprd05.prod.outlook.com
 ([fe80::942c:7d1b:6b3d:85b6%7]) with mapi id 15.20.5709.008; Tue, 4 Oct 2022
 00:19:47 +0000
From: "'Nadav Amit' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: "H. Peter Anvin" <hpa@zytor.com>
CC: Vitaly Kuznetsov <vkuznets@redhat.com>, Alexander Graf <graf@amazon.com>,
	Ajay Kaher <akaher@vmware.com>, "x86@kernel.org" <x86@kernel.org>,
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
	<xen-devel@lists.xenproject.org>, "acrn-dev@lists.projectacrn.org"
	<acrn-dev@lists.projectacrn.org>, "helgaas@kernel.org" <helgaas@kernel.org>,
	"bhelgaas@google.com" <bhelgaas@google.com>, Thomas Gleixner
	<tglx@linutronix.de>, "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de"
	<bp@alien8.de>, "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>
Subject: Re: [PATCH v2] x86/PCI: Prefer MMIO over PIO on all hypervisor
Thread-Topic: [PATCH v2] x86/PCI: Prefer MMIO over PIO on all hypervisor
Thread-Index: AQHYx28G+J2WSwxm3kmFzqoOhSDYUK3dXFQAgBj77YCABouGgIAAKhGAgAA7TgCAAAYigIAAJ+qAgAAH8wA=
Date: Tue, 4 Oct 2022 00:19:46 +0000
Message-ID: <CD4F5AD2-AEC6-47B6-AFA0-98DCE2AE1A84@vmware.com>
References: <9FEC6622-780D-41E6-B7CA-8D39EDB2C093@vmware.com>
 <87zgf3pfd1.fsf@redhat.com> <B64FD502-E794-4E94-A267-D690476C57EE@vmware.com>
 <87tu4l9cfm.fsf@redhat.com> <04F550C5-786A-4B8E-9A88-EBFBD8872F16@vmware.com>
 <42CFC548-F8FE-4BD9-89AB-198B2B3F1091@zytor.com>
 <AD04C0EF-E3E0-4DE2-A812-B05382D6F7C2@vmware.com>
 <8859A371-E810-4720-AAFD-06603816AA53@zytor.com>
In-Reply-To: <8859A371-E810-4720-AAFD-06603816AA53@zytor.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY3PR05MB8531:EE_|MWHPR05MB2797:EE_
x-ms-office365-filtering-correlation-id: 86993544-9e91-40af-e4bd-08daa59e24e9
x-ld-processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7N80bXbU2EmPnlovtiK8XuGaqXR93zh9Zg48ngcf6BB3WjKehE9ucL1exMPTFrEJDw3EgmbfxTKKsc7CwjOR6b5qdPF1UsX+1wpBsj2/xedB+2AgkCVHl6yl+LWeCHwT3H4p1Q3OFOCMaDCmJI49kJf+YnwVQclaTd19IF6ceNsrZjAG1fmT+4YsJohKJvpL/MXBmL5EOCrZiOoOiwh+2XnluvrGRvWBezzz/cKHuf7eYsO6D5XyQdG1kAUHkDPbS7AJMBQhrbQFkgnlx4A3KCA9yOYE7268unahm1wphyp5jcJUUWPcFcl4WaGGLGcLracIr0ifKnTmQHwEOOdZtdLnVrWNOvOTnu6zmVW2rNe1dstbPeFvUmhz9H4v46Oh/5KH9Pt5dizLmJgy4pKW6OXD+xGvlxqiVH3FoT7UuX8ikyV5s9jOHSMR4e9Kx2FXXIR06pYTRxfaiTCE0ofCdWQjs2prEkfiGbaSJfeAbePLEgQq0CZEOmgnanWGQGVVutRrc73/ZGB1AT8yLw1+5bE71myKv2GjsmYkSfWFiGISqxB2jmXTpu/VPsQnOQM1dZACsC4kG2n5oKj40Obe8O0wBaqkPOGO9/73pqn46jjUOv28X6usFTQCvvgYQqYPT9qPq8Dqulm7iUrrK/fAymohvS73/6tzJDupQArmScpCPUAytNy6MjbB6gc0CV5ExD2FzH6gbhJzBiDOnRXfIUiTKcaY5dbl8eWHNVvCqdLhczwBgqBT5YrUVMdIHwKt2LLOwHYXR/0NvpY1daxIBP/vgLVLZh3goBIMG7bvOCI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY3PR05MB8531.namprd05.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(346002)(376002)(366004)(396003)(451199015)(83380400001)(2616005)(186003)(38070700005)(38100700002)(122000001)(7416002)(8936002)(4326008)(8676002)(64756008)(66446008)(66476007)(66556008)(66946007)(76116006)(5660300002)(41300700001)(2906002)(478600001)(71200400001)(26005)(6506007)(6512007)(6916009)(53546011)(54906003)(316002)(6486002)(36756003)(33656002)(86362001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SUhoRUEzeGdRdy9xTi9MNXNHbEF2bEJpZjJWdmg3ZWU4QW5OdFJaK01DelRG?=
 =?utf-8?B?UTJYTTFYQmk3eldoYlpwbjhiQjVIeEhyYjl2SFluZFBFaHhueDBtck83b0xU?=
 =?utf-8?B?Y01wRG9tVVRwcGFNS2EweGJGZTZJR2graDVKeEdub1o1dHM0MXFDYTBFSTZp?=
 =?utf-8?B?cytaVHdJZnRBYmZhN2tUdDhIdlQvbllGWU1VZmZ1c282RkYrNHVpdmJDSEx6?=
 =?utf-8?B?NHlDbTZzVzR0SWhkUE9rc1BlTGo3Z1VkbFdLUXNGQlc3RG4xWVhyU3Y0Q1lS?=
 =?utf-8?B?U2RIdUtVdWNhVzRFV2hUNG9PbGd0QXgrU3NVbXdnWDhjbERhOUpxcmx0cjk2?=
 =?utf-8?B?Tmh3aDdZRExhK3htS2xCSmVHNjlNTk9wY2xaQXo5elN1bzBTSzIyK2kxN29i?=
 =?utf-8?B?dU9DUklsUE0rRFgvY3c5UlJpWkcyb2VqUURpTkMwekRXZmZ1eVVpWlFneWJF?=
 =?utf-8?B?N3hua2ZReHF3ME94VTJ0TnVCdFoxYTl4WGZWRk9QK2RwWDUwa3BmbUlSZzZs?=
 =?utf-8?B?NFdIeUlKNFZPdWZLR01YOENUWHBNNG11WW54cGoydWdpemtFbzZyR0Ruam9Y?=
 =?utf-8?B?VGV1ZnR0MVVzTG03YlFtb2FSSnNzb1MwSGNqZEJLUkNnUnVWTFpXUkR4SUVZ?=
 =?utf-8?B?eGRtK1l2cThyZ3c2MUZDNERlTXVkbUtmRHl3ajF0bHFpZ0o2N2lDODUzSVlG?=
 =?utf-8?B?cWpCeXpxa1lNVVNISTlBd2dMb040SldLT0N0L3lPWHZReHc3aDc4bW85L0VO?=
 =?utf-8?B?NkJvNnRKcmwxTGlGUHNVaEJzTm9ZajR5eWV0SWdxNXBuNG9ZZkRQK3dRam51?=
 =?utf-8?B?UWp6RGRDY1pBMnluTnNpV3cwNmVrWnphajBOWjdEK1UzRWcvZmNxRUhHZ2Nw?=
 =?utf-8?B?RjVibXdFMmw2VHRnVTNvSlpJNUNORk1QaWNaWTNvY1A1OFhmZFhUWmlaSHFL?=
 =?utf-8?B?QVNBSjNzMjFKU2hOdU5pa1pYd3phVHNoZXZ1L1IrNmtDekQ2Z2xuVDBNOVpt?=
 =?utf-8?B?cVZkRnA0TDRzUkZMLzlPNW1SY0VXWlVBaWJOREtkTEdDN1MvY1IzQ0Eza3c4?=
 =?utf-8?B?ejJTRXJVV3kvMEdYaEkwZW1Oc3hScFpkN0NoSlN6eFI3R3J0cmZyeXpTanBJ?=
 =?utf-8?B?Z1VLSWZpdHdxWXVzaFBsVnA5TDZHTFloakpVQ2NBVUZkODkrNEJIdW53TEpw?=
 =?utf-8?B?N29yYzYxVGs3Yi9wOEF3SUloZWRvNjJwNHA1RC9pMFpQNm12bnFVZFZGQmtV?=
 =?utf-8?B?ak1mbVE3ckRzekhlWXBzYUprQnZQM0NlUHU4bm8vV1NzMG1nakYwM3RqUWhR?=
 =?utf-8?B?NE1EN3haOEtEZk9nUmk3RmxMd2NzN1E2R3dldU9oNlhOVDRhZm1VK056QmRL?=
 =?utf-8?B?bkRiNEN3V0FHOHAxSlppVEFlZG5ISnZNRVpiZnZMWnpuWWcrWFFMZWkxSmQ5?=
 =?utf-8?B?V2pBVWRpd1NKcWtaTzBYc2s2YWk1U2N0ZEN3T2pyR0JRczZlRkVGWTNFYzdB?=
 =?utf-8?B?dkc1MzVXTzV5OGtmWk9naGdFQk00dE43SzF1ZGFFeGJPaXYrNlk4WCtiTk92?=
 =?utf-8?B?Sm1iamVxWUpLcDRxWVVlL3lEYjdOUS8wZnlseE9UY2h5SDRRamJpOXk1bmxr?=
 =?utf-8?B?a21YSHN3N2pQUElMSHRNMXZvK3g1OVdVSTZWSUp1TklUVWtDaHRpK3hLbGox?=
 =?utf-8?B?dS9rZmJBa1Q1ZHltRFhRMm41bk0rblZGa1lJSzV0dlFXYWJkWVlVRTY3U2E2?=
 =?utf-8?B?MUFIblZ3bWpXbXZwVVlSMmNxY2RjSmhHcDBFZlBtTnJTczJCZGEvNVJCanRk?=
 =?utf-8?B?dUVaTm82TTRrMzdBRkZrdjJyRTBWZFBuaUxKVkI3b3BFd08wbXE1UFJXQlM0?=
 =?utf-8?B?a1Q1T0Z1RGdyeEY2MkV0eXdOUlQ0WEhXSWVIV1FhYnM0N2k3T0JNdUI2U2NH?=
 =?utf-8?B?aW1ZV2FHZTcwODdSMlNQWHJ0N09oY2RPNEpoQmpReG1JSXpGT1JuY3loOVoz?=
 =?utf-8?B?eElRU3JpRUdiZjVyVEc1T2syZTUzNDVJdHB5UGxBSTA4cG13ZC9sTUIwb1Zv?=
 =?utf-8?B?SXdZZ3k4dnJXK25kOW1kbnVoMFVob0ZLV0M5S1BXMGhKS1BQemNyRldnWGtp?=
 =?utf-8?Q?BcZyoJ3RGEu3sHL91TgjwcoUJ?=
Content-Type: text/plain; charset="UTF-8"
Content-ID: <D2B1F25462B88D4794E529D8DBDA59C6@namprd05.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY3PR05MB8531.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86993544-9e91-40af-e4bd-08daa59e24e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2022 00:19:46.8445
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Csdm8jE2Q4IDVUn8fk5GivlsK2y6kcs/AII07MLZtqoTtkZlDHo4RlL5iyR1FH7c11pin3Acq+hQBB+J/oIbaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR05MB2797
X-Original-Sender: namit@vmware.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@vmware.com header.s=selector2 header.b="VxG3iK/Q";       arc=pass
 (i=1 spf=pass spfdomain=vmware.com dkim=pass dkdomain=vmware.com dmarc=pass
 fromdomain=vmware.com);       spf=pass (google.com: domain of
 namit@vmware.com designates 52.101.51.5 as permitted sender)
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

On Oct 3, 2022, at 4:51 PM, H. Peter Anvin <hpa@zytor.com> wrote:

> =E2=9A=A0 External Email
>=20
> On October 3, 2022 2:28:40 PM PDT, Nadav Amit <namit@vmware.com> wrote:
>> On Oct 3, 2022, at 2:06 PM, H. Peter Anvin <hpa@zytor.com> wrote:
>>=20
>>> =E2=9A=A0 External Email
>>>=20
>>> On October 3, 2022 10:34:15 AM PDT, Nadav Amit <namit@vmware.com> wrote=
:
>>>> On Oct 3, 2022, at 8:03 AM, Vitaly Kuznetsov <vkuznets@redhat.com> wro=
te:
>>>>=20
>>>>> Not my but rather PCI maintainer's call but IMHO dropping 'const' is
>>>>> better, introducing a new global var is our 'last resort' and should =
be
>>>>> avoided whenever possible. Alternatively, you can add a
>>>>> raw_pci_ext_ops_preferred() function checking somethin within 'struct
>>>>> hypervisor_x86' but I'm unsure if it's better.
>>>>>=20
>>>>> Also, please check Alex' question/suggestion.
>>>>=20
>>>> Here is my take (and Ajay knows probably more than me):
>>>>=20
>>>> Looking briefly on MCFG, I do not see a clean way of using the ACPI ta=
ble.
>>>> The two options are either to use a reserved field (which who knows, m=
ight
>>>> be used one day) or some OEM ID. I am also not familiar with
>>>> PCI_COMMAND.MEMORY=3D0, so Ajay can hopefully give some answer about t=
hat.
>>>>=20
>>>> Anyhow, I understand (although not relate) to the objection for a new =
global
>>>> variable. How about explicitly calling this hardware bug a =E2=80=9Cbu=
g=E2=80=9D and using
>>>> the proper infrastructure? Calling it explicitly a bug may even push w=
hoever
>>>> can to resolve it.
>>>>=20
>>>> IOW, how about doing something along the lines of (not tested):
>>>>=20
>>>>=20
>>>> -- >8 --
>>>>=20
>>>> Subject: [PATCH] x86/PCI: Prefer MMIO over PIO on VMware hypervisor
>>>>=20
>>>> ---
>>>> arch/x86/include/asm/cpufeatures.h | 1 +
>>>> arch/x86/kernel/cpu/common.c       | 2 ++
>>>> arch/x86/kernel/cpu/vmware.c       | 2 ++
>>>> arch/x86/pci/common.c              | 6 ++++--
>>>> 4 files changed, 9 insertions(+), 2 deletions(-)
>>>>=20
>>>> diff --git a/arch/x86/include/asm/cpufeatures.h b/arch/x86/include/asm=
/cpufeatures.h
>>>> index ef4775c6db01..216b6f357b6d 100644
>>>> --- a/arch/x86/include/asm/cpufeatures.h
>>>> +++ b/arch/x86/include/asm/cpufeatures.h
>>>> @@ -460,5 +460,6 @@
>>>> #define X86_BUG_MMIO_UNKNOWN          X86_BUG(26) /* CPU is too old an=
d its MMIO Stale Data status is unknown */
>>>> #define X86_BUG_RETBLEED              X86_BUG(27) /* CPU is affected b=
y RETBleed */
>>>> #define X86_BUG_EIBRS_PBRSB           X86_BUG(28) /* EIBRS is vulnerab=
le to Post Barrier RSB Predictions */
>>>> +#define X86_BUG_ECAM_MMIO             X86_BUG(29) /* ECAM MMIO is bug=
gy and PIO is preferable */
>>>>=20
>>>> #endif /* _ASM_X86_CPUFEATURES_H */
>>>> diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common=
.c
>>>> index 3e508f239098..c94175fa304b 100644
>>>> --- a/arch/x86/kernel/cpu/common.c
>>>> +++ b/arch/x86/kernel/cpu/common.c
>>>> @@ -1299,6 +1299,8 @@ static void __init cpu_set_bug_bits(struct cpuin=
fo_x86 *c)
>>>> {
>>>>     u64 ia32_cap =3D x86_read_arch_cap_msr();
>>>>=20
>>>> +      setup_force_cpu_bug(X86_BUG_ECAM_MMIO);
>>>> +
>>>>     /* Set ITLB_MULTIHIT bug if cpu is not in the whitelist and not mi=
tigated */
>>>>     if (!cpu_matches(cpu_vuln_whitelist, NO_ITLB_MULTIHIT) &&
>>>>         !(ia32_cap & ARCH_CAP_PSCHANGE_MC_NO))
>>>> diff --git a/arch/x86/kernel/cpu/vmware.c b/arch/x86/kernel/cpu/vmware=
.c
>>>> index 02039ec3597d..8903776284a6 100644
>>>> --- a/arch/x86/kernel/cpu/vmware.c
>>>> +++ b/arch/x86/kernel/cpu/vmware.c
>>>> @@ -385,6 +385,8 @@ static void __init vmware_set_capabilities(void)
>>>>             setup_force_cpu_cap(X86_FEATURE_VMCALL);
>>>>     else if (vmware_hypercall_mode =3D=3D CPUID_VMWARE_FEATURES_ECX_VM=
MCALL)
>>>>             setup_force_cpu_cap(X86_FEATURE_VMW_VMMCALL);
>>>> +
>>>> +      setup_clear_cpu_cap(X86_BUG_ECAM_MMIO);
>>>> }
>>>>=20
>>>> static void __init vmware_platform_setup(void)
>>>> diff --git a/arch/x86/pci/common.c b/arch/x86/pci/common.c
>>>> index ddb798603201..bc81cf4c1014 100644
>>>> --- a/arch/x86/pci/common.c
>>>> +++ b/arch/x86/pci/common.c
>>>> @@ -40,7 +40,8 @@ const struct pci_raw_ops *__read_mostly raw_pci_ext_=
ops;
>>>> int raw_pci_read(unsigned int domain, unsigned int bus, unsigned int d=
evfn,
>>>>                                             int reg, int len, u32 *val=
)
>>>> {
>>>> -      if (domain =3D=3D 0 && reg < 256 && raw_pci_ops)
>>>> +      if (domain =3D=3D 0 && reg < 256 && raw_pci_ops &&
>>>> +          (boot_cpu_has_bug(X86_BUG_ECAM_MMIO) || !raw_pci_ext_ops))
>>>>             return raw_pci_ops->read(domain, bus, devfn, reg, len, val=
);
>>>>     if (raw_pci_ext_ops)
>>>>             return raw_pci_ext_ops->read(domain, bus, devfn, reg, len,=
 val);
>>>> @@ -50,7 +51,8 @@ int raw_pci_read(unsigned int domain, unsigned int b=
us, unsigned int devfn,
>>>> int raw_pci_write(unsigned int domain, unsigned int bus, unsigned int =
devfn,
>>>>                                             int reg, int len, u32 val)
>>>> {
>>>> -      if (domain =3D=3D 0 && reg < 256 && raw_pci_ops)
>>>> +      if (domain =3D=3D 0 && reg < 256 && raw_pci_ops &&
>>>> +          (boot_cpu_has_bug(X86_BUG_ECAM_MMIO) || !raw_pci_ext_ops))
>>>>             return raw_pci_ops->write(domain, bus, devfn, reg, len, va=
l);
>>>>     if (raw_pci_ext_ops)
>>>>             return raw_pci_ext_ops->write(domain, bus, devfn, reg, len=
, val);
>>>=20
>>> Also... any reason we can't just set raw_pci_ops =3D=3D raw_ext_pci_ops=
 for the case when the latter is preferred, and dispense with the condition=
als in the use path? Similarly, raw_ext_pci_ops could be pointed to error r=
outines instead of left at NULL.
>>=20
>> I understood from Ajay that the initialization of raw_ext_pci_ops can be
>> done after the hypervisor initialization takes place, so doing what exac=
tly
>> what you proposed by is not possible. It can probably be resolved, but I=
 do
>> not think the end result would be simpler or cleaner. I think that the =
=E2=80=9Cbug=E2=80=9D
>> solution really conveys the behavior.
>>=20
>> IIUC performance would not be noticeable affected by 2 more conditional
>> branches.
>=20
> Isn't that exactly what you would want?!?

Two branches (which are probably mostly predicted correctly) are
inexpensive (nanoseconds?)

Causing a VM-exit, and the whole mess of handling it in the hypervisor
(potentially the userspace part of the hypervisor) is expensive
(microseconds). IIUC, Ajay wants to let reads to pass through to memory,
avoiding these VM-exits.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/CD4F5AD2-AEC6-47B6-AFA0-98DCE2AE1A84%40vmware.com.
