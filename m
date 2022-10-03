Return-Path: <jailhouse-dev+bncBDAYHZ5XUYJBBDFI5WMQMGQE5BACXEI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x539.google.com (mail-ed1-x539.google.com [IPv6:2a00:1450:4864:20::539])
	by mail.lfdr.de (Postfix) with ESMTPS id 534A05F37BD
	for <lists+jailhouse-dev@lfdr.de>; Mon,  3 Oct 2022 23:28:45 +0200 (CEST)
Received: by mail-ed1-x539.google.com with SMTP id w20-20020a05640234d400b00450f24c8ca6sf9545561edc.13
        for <lists+jailhouse-dev@lfdr.de>; Mon, 03 Oct 2022 14:28:45 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1664832525; cv=pass;
        d=google.com; s=arc-20160816;
        b=XI8WxmXqdOy7uwtruJX3yb/7K5sSEXthhgiGVb/amJlbD2fsGxOrx+uv3W2xzSEF6n
         2iBE+51bpBKERqKbjod27NUxWBa0zwALa/1abGgOPQQfR/kbk+wTP8YF8LZdNr1+v4Bs
         hMjHzytTw8jRHV1Cy6CW3JWf5PZtj8fidSnPU8mY+4kfNtGhvzOf2nCgDMN65qB57+Iw
         a6Gnt+Rl0LcM1bOHNnRQprd7wtOyGxU9D7Tvs3zWcjPuP444Y9HTDOhijV7i4to/3YeM
         Ti98eiR1FQmcymSSLtoY4sEdylfAO7RNZo8YGOqbRnP4A5qk2HYWEcv74FkYhkH+XbT4
         PlJA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version
         :content-transfer-encoding:content-id:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:dkim-signature;
        bh=IJv5YZzG9uPCJEEYEN1Swxv62PzpkyCA5OipxqGv9Eo=;
        b=OkmzUHSgBGfGJdNct46Mofv6I6WNCBtivGpG7W0IThD8YcPxAIlTypwp2ll9SezeZP
         3GP8vqWufJAgM+DI4HypXdfavm8awNPZlXxKytXK4+xKtLrYct2C8nRZ5EwA7wBcdBZW
         /OACeRgCCAE4eF2U8e6ySdaOVSttL2FIR1sjk7S6kzgZ3rvnZ2ono/7/AonxU4CGIubF
         VcLIBl00DWyz9poQIm5Qrr6c7JxqsHqp0IunvJAVSJatzkXW+fJARrYe+ZWsNIJMlGu1
         oZREIzCRsBbFoP7CIEYKZ9wGvmJnOk2Lgad71gGmeezTDCg5RQX9fzzHxnNOB5E4ODbO
         MwWg==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@vmware.com header.s=selector2 header.b=CiVfhXyj;
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
        bh=IJv5YZzG9uPCJEEYEN1Swxv62PzpkyCA5OipxqGv9Eo=;
        b=pFb9TGMTrRzOZB+Bh3isoYBdFABnJ/N63UZ18gs20C3Fn1mF/DPhzoMkapaeNKRFgC
         w34ZCgxnKctogUREMJXTzlb5pKQtTeEsyJF/YfSgnaVidV0YpdmbiY3fKb2cNb4/ulfi
         Nep32ZJlHUIbbr9rPqwHdqqz7r3mmtvjBWuQLfY1IWy1oXmnY8xhPk6WVVjmmUwR7xZF
         jKp3rl98F4rE/8E+5LhaIYSQoOrNqjGl0yuzAZWqq4mCP+IP7Ws4kZd1DDKxhTIKgmUT
         P/FqT67WppvwKSwDciv6/87sYYsjqxzYk7uzjAcCmR3b+LCZ0qAtCF/OPwIHmwfURsGx
         5gkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence:reply-to
         :x-original-authentication-results:x-original-sender:mime-version
         :content-transfer-encoding:content-id:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=IJv5YZzG9uPCJEEYEN1Swxv62PzpkyCA5OipxqGv9Eo=;
        b=aeNL8opsYGUYoqt55BtpUf8vI7aR3Z54yhLQIAsT2+IG2oa8uP2nzD2YzfV2FaC/nC
         94FG4dWONw33ic+uslQo/5FOTborxeFRBbQRnfEjDIdIRbYhd9NCnZpMDPGGVAZIILt9
         3D6idHvLkLgsA8ryWp58RCE/AhIvrDpd7fc6Dpec0zGOojSD7g9XzVFLb/pTkJnlRk/R
         365PsSKE7r6ef51Hk9uIC8dfEUuQPnFoQN+b1sRtmZloOcwD9Zj/fnjrT2hslFHrAu9y
         X8CGu+eL4b8XQ4PexagW64lC1rzMKdutUPoukW37te9/0iRz1yUk7OB5cFSGsH/+tZ9i
         yKyQ==
X-Gm-Message-State: ACrzQf2lLgI/O/O97gWwTr0E3ItLAL7jdRxgCGzLN0tSgpAzJHWNnbcL
	A1KJfYymQzXy8yidTQu5twA=
X-Google-Smtp-Source: AMsMyM6OOCRr0vq6Jxl7mRet3CSRW6CZWrhLeKB2kaijdlOKxbAl+ofyVO/wvMWMJW54UWkQc7yO8A==
X-Received: by 2002:a17:907:7f93:b0:781:dbee:dece with SMTP id qk19-20020a1709077f9300b00781dbeedecemr16466050ejc.323.1664832524941;
        Mon, 03 Oct 2022 14:28:44 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:a10a:b0:77d:b590:5e60 with SMTP id
 t10-20020a170906a10a00b0077db5905e60ls5969798ejy.8.-pod-prod-gmail; Mon, 03
 Oct 2022 14:28:43 -0700 (PDT)
X-Received: by 2002:a17:907:75c1:b0:783:a2c1:860a with SMTP id jl1-20020a17090775c100b00783a2c1860amr16758656ejc.641.1664832523369;
        Mon, 03 Oct 2022 14:28:43 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1664832523; cv=pass;
        d=google.com; s=arc-20160816;
        b=EEBf+SIIXubzkjdC3g4eusL3bPXZ6MHVHO8xOzFGdXV1vHpg0HBm5P5kGTBQLmSrwy
         a9GGia3wZQjgDDnNUjf0cLHuPllHivX+UbqxQhK7/yTh/q19YkeEPp1DQtCjx19SSuzK
         UiM6fTib3ZBRVD7JIbwouZHTbWpgNQB4A9mWd1C2gDWTv58cfWY6pKtf5F7/3aeNplRG
         tBRan3ijVRqPjEM4hO7z+aBKxVFj8tKogd9i+LzaOtxmxAbPkBlFm0wMiQwtBme22ftZ
         bgYq3hAy1eiHymulixQMji1QYtfeFEoA+Q022iCHTyXYMH6AGsZ0XcubN3SaAhr4JmzW
         KfHw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-id:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:dkim-signature;
        bh=Zw9fEnOoZeFAV82VlAHROfs2DhT1mAznnEugB9t75Rc=;
        b=jah9rue/zCaCfls8otjIa/XrOL8j15NsFRyMSLkYOZ2Rqk/wyBTLm2gate3UaAlSRV
         J+l0FEwveZ8m7PXqMjy3GU8RULDOabxNBo++kAwUHjSZkRadxg/GjbwWpsSUnPNTiN6M
         Qjdegj5cxE+G/ECiP6M8PDcchsJaNNFjODg9WDV2mBZUEbQdrythb3lwT93ME7wB3uja
         XG9rN4U/haG6lLr4jboepHT0B4bIUleERQ+kLcqtJYLc4+Tdp8fuvdXMDpqE3UUrx6Ei
         UxvuEf39uZBNRHBkE7l2qXu5v7ssK7/nYx0tX3LtBCRDrjoaa5X3cRjBEmJMePgstJqo
         oI3Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@vmware.com header.s=selector2 header.b=CiVfhXyj;
       arc=pass (i=1 spf=pass spfdomain=vmware.com dkim=pass dkdomain=vmware.com dmarc=pass fromdomain=vmware.com);
       spf=pass (google.com: domain of namit@vmware.com designates 2a01:111:f403:c100::4 as permitted sender) smtp.mailfrom=namit@vmware.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=vmware.com
Received: from na01-obe.outbound.protection.outlook.com (mail-eastusazlp170110004.outbound.protection.outlook.com. [2a01:111:f403:c100::4])
        by gmr-mx.google.com with ESMTPS id jl4-20020a17090775c400b00780aaa56c40si293652ejc.2.2022.10.03.14.28.43
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 03 Oct 2022 14:28:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of namit@vmware.com designates 2a01:111:f403:c100::4 as permitted sender) client-ip=2a01:111:f403:c100::4;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TStowMQnvKQ0EB/QqIYKa6JYYaWMCCNXeX8X6wU4ZcaXq1XS1wLjSrgrh8ystH22teajwo7u91348AUdTvwSO0c2hIUk0dEVfnp0Rnf0QT+oXd5OzJ+cx1AbECNUCDxL5cUn9GDUb6GK2JT/hdzJMQrDtJ0rs2ZQzV3cVTJINS2RhrWe2bgpjuxqZLSmAp7s9uXfZPD7EPhsXVKdrH1odIWL0yLDzjaKF2XmdvPmzsjUerwTmxVq1YDt8VaZYvLT4JYG4S8dqMOIHonndUia4FYLbdxAYnH/k9R6xYmJgYwe4gd1b56+HFe1rZQlP93gMeNlrMmkd9KLeQVKShlkCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zw9fEnOoZeFAV82VlAHROfs2DhT1mAznnEugB9t75Rc=;
 b=SMtkNkrmfq9w6qVsf8B+F3oGVpl9Ui8pL+Zu6Opavv50m6iaRQCLYsBvn6bQtHJJhkVqVOIDtgJkrmv3Mky5iL1KBSpxvoaQilFiMcxzSKPSTFvPW9Gc2kiTUz4YqerCAM8NI0Htq26Bn5bVKs1IJ83ROSEE5fyBZrX4h8lbS7TJWQbrYeV3wjnNVOmpuOjPN3Bwmfa2iFl2G3xmy/iQeFfFRYfqKt69SRPpgdv7EnxFX0rl+UnpyjvyzEbBldov6IFIflRwJ8wd8C0N1ucFNbg/pZjtlrAr7wZDPDHMO1X6g8UysGVTVuSCg5zBK+gycDVUpeDQtkeMdDlC4A0IxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
Received: from BY3PR05MB8531.namprd05.prod.outlook.com (2603:10b6:a03:3ce::6)
 by DM6PR05MB5098.namprd05.prod.outlook.com (2603:10b6:5:75::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.7; Mon, 3 Oct
 2022 21:28:40 +0000
Received: from BY3PR05MB8531.namprd05.prod.outlook.com
 ([fe80::942c:7d1b:6b3d:85b6]) by BY3PR05MB8531.namprd05.prod.outlook.com
 ([fe80::942c:7d1b:6b3d:85b6%7]) with mapi id 15.20.5709.008; Mon, 3 Oct 2022
 21:28:40 +0000
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
Thread-Index: AQHYx28G+J2WSwxm3kmFzqoOhSDYUK3dXFQAgBj77YCABouGgIAAKhGAgAA7TgCAAAYigA==
Date: Mon, 3 Oct 2022 21:28:40 +0000
Message-ID: <AD04C0EF-E3E0-4DE2-A812-B05382D6F7C2@vmware.com>
References: <9FEC6622-780D-41E6-B7CA-8D39EDB2C093@vmware.com>
 <87zgf3pfd1.fsf@redhat.com> <B64FD502-E794-4E94-A267-D690476C57EE@vmware.com>
 <87tu4l9cfm.fsf@redhat.com> <04F550C5-786A-4B8E-9A88-EBFBD8872F16@vmware.com>
 <42CFC548-F8FE-4BD9-89AB-198B2B3F1091@zytor.com>
In-Reply-To: <42CFC548-F8FE-4BD9-89AB-198B2B3F1091@zytor.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY3PR05MB8531:EE_|DM6PR05MB5098:EE_
x-ms-office365-filtering-correlation-id: 72cd9929-8a82-4b42-8be7-08daa5863d7a
x-ld-processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tnFanJPohSoePytddyFCICLAU5UCXtmRioLvACI55Lor7zciBPZ9/1NdW+XWDO7RHDh3qnYRn0RYr8QS3xUXOaDwjYI9pDeM/rBMNNl4ZeJ9A+jrSil8I4aMYuw6iran/lL/9tvHThmPf/qSrklTIf6iuOfHSK9p5AeEKMXICgDfSyx3wBualqXqAXuRfjTU1xpJQAMCT2rfaxKewhz87JzLyYazvaAIybB0Gdqa6MxCsOnNhCvjT7aI86zjbPJTYrFd80Trb7vliWXSV5r8OsBye7piAJcrbFEvfhuUUC15EstMTrtY/rubTpeHzZrpRMDd+7W2rIogl67ZuzpKO0xvcPllUW/6UhdQIi533FJ0whRR1XRyhBihnVftZHIlpBB7vb15EYIt668N3E/wBDzgJFPta7HpJHai09JhhUEQ43HtBExbGrJhHLCk8x8wtDpflr+89VA6PiBMn7XHEYveEgZICm7d3ebtpIjCsoIxRJPnmVBRStgKgcBfuzUaNuokOBZN64d2HfHZqvogZiRppe63PQSLAbxPFyLYOMn5cG3DzDe7uDgqAo34CoHMlkm+ExknubRx1NUptdM6CzYozLG3CyK/KSrZ2ehGx702jRoHfSOC3YvwsI/AVQzgIKRvRxUOAj3OsnE4ZuVHdR7PqKhNnqwLozsSrmdr8KgWwlek3wVF+fFJ7ri1FBwqibp+4sdlz1cjUw40QZnusZ/+0lZu22TRznok/UtlnWWeYvh3hld3op4InwCS7PDudYYT3MunSmprSDaszO4uUKWNt+bjp/gHTh8xJmNk3mwRKs9Ei/fXTC9T8paFQtNhI23LKa7y8AHut4wXmgAgG8o/jN4SUdYpBYunjLVN8eA=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY3PR05MB8531.namprd05.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(346002)(136003)(396003)(366004)(451199015)(38100700002)(122000001)(33656002)(38070700005)(36756003)(86362001)(6506007)(71200400001)(41300700001)(26005)(5660300002)(4326008)(8676002)(6512007)(53546011)(8936002)(64756008)(7416002)(6916009)(316002)(66556008)(66476007)(76116006)(54906003)(66946007)(66446008)(478600001)(83380400001)(6486002)(2906002)(186003)(2616005)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N0FQZ3VJeDBnaHVWV0MwTUlFZ3BGUHRJcUdGTHNpQ3U1eE5kQjQ0a1pyMEcz?=
 =?utf-8?B?SElTNWZTQW9xdzBpWG0zVS9TYUpXTlZCRWFaaU54c2orOTRyOStTUE5ZSkw3?=
 =?utf-8?B?NmY5ZklyL0E5MG4wWGxuMmlIMDhSSGNyQmRjV2NVWnhpaXB4ZVN2RGhhWmtm?=
 =?utf-8?B?OFZha3hzbkZFeUpFb0JnVXBVSS9XdFp1eGtGWEVWNFZxWnNXU1hQWFpFY1Qx?=
 =?utf-8?B?VEU3ZytkdGZSbnJnN2x0SFhtS1pvYnNxcnVnS3dKcHBMUjJLWktlRmszN3J6?=
 =?utf-8?B?Ty9IeUtvWC9tanBrdHZDSW9KUmg2Y2FQYThxRytYN1FweWZzUk9YTjR2VVlx?=
 =?utf-8?B?WjF6cmNTS0x0Wk9KNFQ4QXZjTzdWek9HQ3pBODZkZG1nMmNWK3dmc3hIRENq?=
 =?utf-8?B?alJMZ1JsNXBmempzWTFhVldvdklxR3Vhd1RyTE0wdVRaZUpDWU5Xa1RBTmxW?=
 =?utf-8?B?V3NrQStsNERwdmJKdGNKSFdmaWw0QW03T0NyVlkvblpCQzNPR1Z4THBrSlVo?=
 =?utf-8?B?ZXJVamloR29VTzlNRVlBTG1jZGlrK2NuODJsRUorbGVUOGx4NW04bkNKQXNR?=
 =?utf-8?B?U1RPS1pTWXB2RVNUbkVST2RZVkpYQW5WLzNLYTZQZzBJMnQ3RHpkcFloZmJV?=
 =?utf-8?B?c0E2alpsell3WWxJMG5nU1NGbTNLZ3g4bVRBVkxDWWY2RkRNaVY3MUpabmNT?=
 =?utf-8?B?R3lTZ3NRM1MrMjFvaEVVcXRiN3gwVUpsa0sxWGtyRHEwK3U3MDJyR1hwUTJI?=
 =?utf-8?B?QkxLb1ozb2NtY2RRWEtLeEViNHdKTjhXWC9XYjNXa2w0NU5hWmJqNHdnWEdE?=
 =?utf-8?B?YmkrNXBuRVZON1hqeENrbnkzbEFqb3RuY0NENGVJNEZMS09BNTRldk1GeDdP?=
 =?utf-8?B?dWp3M3ZwdUphMDEydVZlQlZIVnRydWJ5VmdvL3VuWFB2cHBTNWZZcDlMb0Fw?=
 =?utf-8?B?VS96UTV6T0dXbTlwc3Jua0VhTlNMTzZka0VHTnVPb0tYMjVPNlFMMTJkWklO?=
 =?utf-8?B?ek1zdmRmZVJsN1VrQ08rRGhPOE1UNG1FUytET2dtYk9TTk5rZTFzQU1SUE5w?=
 =?utf-8?B?UlVGN0VxeFhYOSsyejVOdUNvcnJSc0UzbDdzVEJOYjJ4R3pPaDR1blIrdzZI?=
 =?utf-8?B?MmlOM3pBa1RYckt4bzY0KzF0a3o2UVIzT0hQRDFvdzFuVGF3Sk9iWW1QR01N?=
 =?utf-8?B?WnIvdVhkR1NYcFl0RHFLZEMrTGs2MW9JLytscWtIdmR0ZnhvRTdRcWtHYm5Q?=
 =?utf-8?B?Z3BjL2FvNkxNOHpQZTYwaFRmM0tveW4zT0Q4aU5VN2VWNm4rRzN4WUVBaHFa?=
 =?utf-8?B?VnBYOW81akpFZzZBK3J4WERjcnhqbGQ1aXFlTVVCU2hob2tzbHNWVXhXb094?=
 =?utf-8?B?NlVTV2VYQkErcWxaYmNsQ0lSSWVJNkZPdTNqTk9EOVgreEpuQXZzUlhLYy81?=
 =?utf-8?B?OEp1UTlKZUZCU0FOOVVHOEpRQnVYZm1mV29hOHhXQk9haHlEN2tTOEtZRnZB?=
 =?utf-8?B?SHYxMlptemJFclUwb3M2ZzIrTkVvc0FlVlUwekdRS3k3Q3JUZjdqYlZiMTdK?=
 =?utf-8?B?ZTJEakkzelNoem1wcXBDbVMxcnUvRGhOT081YzBCd1ZpYm40VDE3UUVmaHJi?=
 =?utf-8?B?SWRnTlNhRm9XRzdrUzVGUDJvWDNiUUdKV0pMSEF0aVNYbzg5L0o2RGZxdE0x?=
 =?utf-8?B?dkVZN25aOFhpSitXK2d4dWJOVGkrSkNFN01HUnRsbi8zOUdWRCtSWUlvQTVB?=
 =?utf-8?B?dXVrRHFjSjVpckYzQ1BaWU5jcXFvRlhVelhBT3c0V0hGSXA1WG5haDRiN3c0?=
 =?utf-8?B?SUI3WkVIU2FnZXJXNHZ2UVJBM0hBbFJjeTJyTU40cFlqMDVQVkpHK2c1VXor?=
 =?utf-8?B?OUlZenE2Yytlb0pPZGxiMDJvcTgxQVpSemVLQzJiNXFUUUViK3R2ZWt5ZWE4?=
 =?utf-8?B?YUlnTE1KNnR0NUMrWjFDckcvYkU0WTRpRXRZWHE2M0VneHUwU1dIZ2RCaTBK?=
 =?utf-8?B?SVo5OG9GR2lBSXZHTngvVVJkWHZOQTdscWtERU5HcUEyZVdzUnl3V3UyNmUy?=
 =?utf-8?B?SXllWmlpRVFkUWlqVHJqKzBZcCsxMW5JYmluS1ZJQ3haV1pnU1Q2K01jTFNH?=
 =?utf-8?Q?bWfe7MwPlORs4W3hise5UaANb?=
Content-Type: text/plain; charset="UTF-8"
Content-ID: <10DBB0F4E3015E4FADD93889218F2547@namprd05.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY3PR05MB8531.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72cd9929-8a82-4b42-8be7-08daa5863d7a
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2022 21:28:40.1676
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v8YAGeIDx3nMpzt8RA+oD/cKtQXqSKyjJ7koJdre6pIQTblAHZgmuE5rpBGkhTzYRTO5VpWnIx7pTk5AbBwRIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR05MB5098
X-Original-Sender: namit@vmware.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@vmware.com header.s=selector2 header.b=CiVfhXyj;       arc=pass
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

On Oct 3, 2022, at 2:06 PM, H. Peter Anvin <hpa@zytor.com> wrote:

> =E2=9A=A0 External Email
>=20
> On October 3, 2022 10:34:15 AM PDT, Nadav Amit <namit@vmware.com> wrote:
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
>>=20
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
>>=20
>> IOW, how about doing something along the lines of (not tested):
>>=20
>>=20
>> -- >8 --
>>=20
>> Subject: [PATCH] x86/PCI: Prefer MMIO over PIO on VMware hypervisor
>>=20
>> ---
>> arch/x86/include/asm/cpufeatures.h | 1 +
>> arch/x86/kernel/cpu/common.c       | 2 ++
>> arch/x86/kernel/cpu/vmware.c       | 2 ++
>> arch/x86/pci/common.c              | 6 ++++--
>> 4 files changed, 9 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/arch/x86/include/asm/cpufeatures.h b/arch/x86/include/asm/c=
pufeatures.h
>> index ef4775c6db01..216b6f357b6d 100644
>> --- a/arch/x86/include/asm/cpufeatures.h
>> +++ b/arch/x86/include/asm/cpufeatures.h
>> @@ -460,5 +460,6 @@
>> #define X86_BUG_MMIO_UNKNOWN          X86_BUG(26) /* CPU is too old and =
its MMIO Stale Data status is unknown */
>> #define X86_BUG_RETBLEED              X86_BUG(27) /* CPU is affected by =
RETBleed */
>> #define X86_BUG_EIBRS_PBRSB           X86_BUG(28) /* EIBRS is vulnerable=
 to Post Barrier RSB Predictions */
>> +#define X86_BUG_ECAM_MMIO             X86_BUG(29) /* ECAM MMIO is buggy=
 and PIO is preferable */
>>=20
>> #endif /* _ASM_X86_CPUFEATURES_H */
>> diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
>> index 3e508f239098..c94175fa304b 100644
>> --- a/arch/x86/kernel/cpu/common.c
>> +++ b/arch/x86/kernel/cpu/common.c
>> @@ -1299,6 +1299,8 @@ static void __init cpu_set_bug_bits(struct cpuinfo=
_x86 *c)
>> {
>>      u64 ia32_cap =3D x86_read_arch_cap_msr();
>>=20
>> +      setup_force_cpu_bug(X86_BUG_ECAM_MMIO);
>> +
>>      /* Set ITLB_MULTIHIT bug if cpu is not in the whitelist and not mit=
igated */
>>      if (!cpu_matches(cpu_vuln_whitelist, NO_ITLB_MULTIHIT) &&
>>          !(ia32_cap & ARCH_CAP_PSCHANGE_MC_NO))
>> diff --git a/arch/x86/kernel/cpu/vmware.c b/arch/x86/kernel/cpu/vmware.c
>> index 02039ec3597d..8903776284a6 100644
>> --- a/arch/x86/kernel/cpu/vmware.c
>> +++ b/arch/x86/kernel/cpu/vmware.c
>> @@ -385,6 +385,8 @@ static void __init vmware_set_capabilities(void)
>>              setup_force_cpu_cap(X86_FEATURE_VMCALL);
>>      else if (vmware_hypercall_mode =3D=3D CPUID_VMWARE_FEATURES_ECX_VMM=
CALL)
>>              setup_force_cpu_cap(X86_FEATURE_VMW_VMMCALL);
>> +
>> +      setup_clear_cpu_cap(X86_BUG_ECAM_MMIO);
>> }
>>=20
>> static void __init vmware_platform_setup(void)
>> diff --git a/arch/x86/pci/common.c b/arch/x86/pci/common.c
>> index ddb798603201..bc81cf4c1014 100644
>> --- a/arch/x86/pci/common.c
>> +++ b/arch/x86/pci/common.c
>> @@ -40,7 +40,8 @@ const struct pci_raw_ops *__read_mostly raw_pci_ext_op=
s;
>> int raw_pci_read(unsigned int domain, unsigned int bus, unsigned int dev=
fn,
>>                                              int reg, int len, u32 *val)
>> {
>> -      if (domain =3D=3D 0 && reg < 256 && raw_pci_ops)
>> +      if (domain =3D=3D 0 && reg < 256 && raw_pci_ops &&
>> +          (boot_cpu_has_bug(X86_BUG_ECAM_MMIO) || !raw_pci_ext_ops))
>>              return raw_pci_ops->read(domain, bus, devfn, reg, len, val)=
;
>>      if (raw_pci_ext_ops)
>>              return raw_pci_ext_ops->read(domain, bus, devfn, reg, len, =
val);
>> @@ -50,7 +51,8 @@ int raw_pci_read(unsigned int domain, unsigned int bus=
, unsigned int devfn,
>> int raw_pci_write(unsigned int domain, unsigned int bus, unsigned int de=
vfn,
>>                                              int reg, int len, u32 val)
>> {
>> -      if (domain =3D=3D 0 && reg < 256 && raw_pci_ops)
>> +      if (domain =3D=3D 0 && reg < 256 && raw_pci_ops &&
>> +          (boot_cpu_has_bug(X86_BUG_ECAM_MMIO) || !raw_pci_ext_ops))
>>              return raw_pci_ops->write(domain, bus, devfn, reg, len, val=
);
>>      if (raw_pci_ext_ops)
>>              return raw_pci_ext_ops->write(domain, bus, devfn, reg, len,=
 val);
>=20
> Also... any reason we can't just set raw_pci_ops =3D=3D raw_ext_pci_ops f=
or the case when the latter is preferred, and dispense with the conditional=
s in the use path? Similarly, raw_ext_pci_ops could be pointed to error rou=
tines instead of left at NULL.

I understood from Ajay that the initialization of raw_ext_pci_ops can be
done after the hypervisor initialization takes place, so doing what exactly
what you proposed by is not possible. It can probably be resolved, but I do
not think the end result would be simpler or cleaner. I think that the =E2=
=80=9Cbug=E2=80=9D
solution really conveys the behavior.

IIUC performance would not be noticeable affected by 2 more conditional
branches.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/AD04C0EF-E3E0-4DE2-A812-B05382D6F7C2%40vmware.com.
