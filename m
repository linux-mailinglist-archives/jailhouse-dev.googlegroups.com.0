Return-Path: <jailhouse-dev+bncBDBIZ3EL3UDRB3XRWKEQMGQEHPRRNIQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x140.google.com (mail-lf1-x140.google.com [IPv6:2a00:1450:4864:20::140])
	by mail.lfdr.de (Postfix) with ESMTPS id C4ADA3FB424
	for <lists+jailhouse-dev@lfdr.de>; Mon, 30 Aug 2021 12:54:39 +0200 (CEST)
Received: by mail-lf1-x140.google.com with SMTP id c24-20020a056512239800b003cec11473d2sf2982566lfv.4
        for <lists+jailhouse-dev@lfdr.de>; Mon, 30 Aug 2021 03:54:39 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1630320879; cv=pass;
        d=google.com; s=arc-20160816;
        b=DonDab8bo2JKMvqMlUeuTNAIxlQ4qoRN+UrfNuQFOjxZ9tWBBSxGN7d5JohAM52Uc4
         INMruh3jqLsAiQuj2I07CokTQPRUBzm0XzcAGNJxccHvkcLJ86SFfw6XBrL5EZs6PSUw
         7aQFc8DJgGSUstMHcBSjH59BvnUeWX5nPGkPgrgdnxWoxDd0KQFpVyr5QPgRh6n212w0
         B0c5CGByqCf2UDh+h++rm2rQvee5uTDe3X0ti1qluGTQm76Ix6JYS+wy1cQIBHLQQvhc
         FukOU4PCCSMNmkht3kB1cXx8dbucR1/M8lKZXxTZFQfqq9gNIO5rjDT657v+Z4cFraRS
         axSg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:cc:to:from:sender:dkim-signature;
        bh=HqNYlyyJ/UgTKY8DHU+Yu3v91TR6Pl/TF9QHzzp0wSg=;
        b=hDV1Rn+A8QcDEsPPqONTwOvb9RmV/d6zEINAETD4hRFic7nvydqeQtViAIXrErrB0E
         mRLgkNwktMCA4wsQfi72bcdU8DzfYTMWagOB9MowL/Q4m4ETKr4KMUBJSNTqoO8X2l/O
         yKGotPSm6Zj9Yslp6wUD5tD9IvYoSxKPAIskFp5T5fISn59EnP66hIzmAV1+lkVoboQT
         WQcpbs5HQp1q0yeOt9i26OCZ/y5V9jThigkVOI2V0MSRwEwuO11fG6ctwSHTAJ9b3oGr
         pZ4NLplG3rHftegGKR6Ugl7k8ursgdQDKrV9vms2UN7jb6geVnPyBL0VvvwDDQdP3wbT
         qOlg==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=c2eeRTGD;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of zhiqiang.hou@nxp.com designates 40.107.4.42 as permitted sender) smtp.mailfrom=zhiqiang.hou@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:cc:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :content-transfer-encoding:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=HqNYlyyJ/UgTKY8DHU+Yu3v91TR6Pl/TF9QHzzp0wSg=;
        b=jd2t7IqkrvBl2nZWjag3vy8XPWM88rVQ085pSWaviPKafl6BnxqlasxCKOje1LJgQi
         8kAIgNhcM6XiLtVhO4JR7xe2+3HHQDVG5pmFdx02julXiTaFngJ9HKJyWw0qTcKEiEzj
         +6LeOAgltvoqz4RbtsQpQjkwi7UrNB82b2KDnRLoklvUcSYGVgENeVAim8A/U3cIm/es
         cZKIbrwV/SCKVkTYiWO3yrL01QGx+pzpJbvQQja5AJe8pLol6V/I7Vq0sVz28KvHWm5P
         wIDihkbqlCyCMj6z3m2YfumnQQ/AMpueTcaBM/d1ymbOQfeGiYmGYjNd9fCw/UOTKv8a
         NvnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:thread-topic
         :thread-index:date:message-id:references:in-reply-to:accept-language
         :content-language:content-transfer-encoding:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=HqNYlyyJ/UgTKY8DHU+Yu3v91TR6Pl/TF9QHzzp0wSg=;
        b=e6tJKkk36P2rejd7+IXjXM3s4MshBlWZMWOH0mRBfb3wx2g1QyRXlVTeh146rCQq0i
         i6QWgJoeA5TcdqpQk35LCNZPoA+CerlpFe3rVkCcJ1rJAedHQasvnvoBjaisFBw0w584
         5UdP5DB+ofwZwI9ILu6lhcXoP9/wff+wIKkBJ6NGe1v+fYYr94zZF+3t75fU1nZWa2Gs
         Ly/anHUNwHeKE2xYgiPnCRSnHjzVESdJhiKAEUlhBvkC4ov7O3rDmD86K+R0Kt6px0yu
         gwVjyGS7Mn/z0k6KxFw8+5T8vCge7ejNf2R1QdQZg0tr55xCafqWfSgxd48xYbwi/FxL
         Rejg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530zVR2PBqUtJvD1RJ+tDSapqXd9dsEiOFK/1QVZYPlCKpLGe/pt
	66qLFhTwQRluBwLsovSEYH0=
X-Google-Smtp-Source: ABdhPJyjpLC+Jtn1PRNsIqArU9Gwgh4yne8FYUTmz7Hc2e3mRUhANByVNF3VyEgUvGH/OUGR1q2h8Q==
X-Received: by 2002:a05:651c:88d:: with SMTP id d13mr20845001ljq.238.1630320879231;
        Mon, 30 Aug 2021 03:54:39 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9109:: with SMTP id m9ls2959214ljg.2.gmail; Mon, 30 Aug
 2021 03:54:37 -0700 (PDT)
X-Received: by 2002:a2e:804c:: with SMTP id p12mr19882065ljg.118.1630320877858;
        Mon, 30 Aug 2021 03:54:37 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1630320877; cv=pass;
        d=google.com; s=arc-20160816;
        b=hN6ZiUIbwVRf6cWC48OZnjeq4tMWVNdbLL6z20m2biGcwKRNZgk5+32c+YrI8ahwHl
         On1Zx4VEE3eYTo0vwrs5cX2KOYpUO2x+DAHbgipH38TdTo9c1WQlOzFn6Iq/Ddj1Ag65
         fq6bT34H5754hn1ZES4UrbEPo4kllni4GqklqqD+fsFXZmoEklW6rfTI7mCrDJ62YwuK
         5hBs8anBa7Crc1NxQZVgoURvleY0JLruB+3Uvk2xc2BpYObIIAt79Ll9evyFO4swi8NX
         6lRLOiqCr9glAVnZG0XgnORZzEZ6lXGnZhaZf4X1ZycTBY1CKCEoyZehpNWFXoKneR4A
         XuVA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:dkim-signature;
        bh=1r4JPEfpV+srNFDyaClX/glqhHgasKW25rDcRW9Bpic=;
        b=N2U+/+aMEiCNrPV8NdHn+LuzzkXKPDmoDFNeC2HLIy7pQ3u23+yrzHHvB+x1b4H9HO
         p9WKhHc6zM9rWHZk5EHMWP41A+ilOzz+tQB0rtWaYNJ8K0Y4+DGf7MhQMjnR201Uu6iR
         51u6Bqg8Z+xwlX/sUvn/rs6WxVR6qd0HOUcPp/bYZhpYV1ortaZXOJWF1UFxjsIZWfMz
         OJYLXwCdJss1SQ+zwrSQY5xXNPuuRoJvcN5hap6H5enTwJhlT7H8d+8O7Cjw9LeZ7Wiz
         x6a8iYA232UKNFWFs+k0Wze8ws02G3q2u7K1IcFBwsBZ+K5kCtwb+Re7UagwmNJ38DhA
         NN+Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=c2eeRTGD;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of zhiqiang.hou@nxp.com designates 40.107.4.42 as permitted sender) smtp.mailfrom=zhiqiang.hou@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR03-DB5-obe.outbound.protection.outlook.com ([40.107.4.42])
        by gmr-mx.google.com with ESMTPS id h20si614632lfv.7.2021.08.30.03.54.37
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 30 Aug 2021 03:54:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhiqiang.hou@nxp.com designates 40.107.4.42 as permitted sender) client-ip=40.107.4.42;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ngn9gzHOd1kdr67K2GFMKm7oQqoDCoJiLJc6n/S+AqlvNuf5FO9CeTaDJoG9QvXH+SxRZ2U3qDOvFI3TmmRe1joaCmCW21iRJNejo1wyomQMR/G3Dxf3KIrkx8EYHs8B7IXu34+62MOzKv1582lPh7U4A3IREp66HoCwkPb9uwK08Qz4zsiISzfKdc37a2GIQpCfI6wSo1nAgDaGJDcAFSOEHKRwf8UtL1ICCE84G/impqKM8zKTD7Baph/uX73AYi4jUO+uz34K0dz+XCT1RDPDS3iDUDKSzvefKZSnUGxjVF9N7lTcFnWfbT+LbJfqJwK88tvuvQu9BlUsCFl3/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1r4JPEfpV+srNFDyaClX/glqhHgasKW25rDcRW9Bpic=;
 b=lIxPNO6Y0ooF5KWQJMSFGfgbhDiz++SumpUstKcHdPAGjwkDCuS+FZt7DTJhcGLORz1KI1kr8YxFrhDphbsmfAhpqda5ufqOU63Ir6dwQOUQ0kBNPaL8G+FtI2tspolRUBQKrBI3IFisk9BwkOMCGqWD71el/v1vqTOTy90BbfzkzeNuZ3Mqq6ZRaIXIfNvOwqUD3t70T9j39AFLps8NpKIPWgvDduaAaV0SoP3+TiYjs/pGmmZPim6/IhR12aojAQMfsdmWG5ps9Xi+Tjxh/Be1cUh0JUBA8RHYOSm+aRclp1xC8yrg5/1FtSvlXEtnqre0V36D2e+suxVjmjjgMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from HE1PR0402MB3371.eurprd04.prod.outlook.com (2603:10a6:7:85::27)
 by HE1PR04MB2954.eurprd04.prod.outlook.com (2603:10a6:7:1d::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.24; Mon, 30 Aug
 2021 10:54:31 +0000
Received: from HE1PR0402MB3371.eurprd04.prod.outlook.com
 ([fe80::8d8a:89d:e110:3c3b]) by HE1PR0402MB3371.eurprd04.prod.outlook.com
 ([fe80::8d8a:89d:e110:3c3b%6]) with mapi id 15.20.4457.024; Mon, 30 Aug 2021
 10:54:31 +0000
From: "Z.Q. Hou" <zhiqiang.hou@nxp.com>
To: Jan Kiszka <jan.kiszka@siemens.com>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>
CC: Jiafei Pan <jiafei.pan@nxp.com>, Rui Sousa <rui.sousa@nxp.com>
Subject: RE: [PATCH] arm: irqchip: Fix the mask according to access address
 and size
Thread-Topic: [PATCH] arm: irqchip: Fix the mask according to access address
 and size
Thread-Index: AQHXmxbhYfr68tdfjkGRS5idFHzolauG+uuAgAAZduCABHlagIAAUF/g
Date: Mon, 30 Aug 2021 10:54:31 +0000
Message-ID: <HE1PR0402MB3371C1CDCCD9EA8CC8938FC684CB9@HE1PR0402MB3371.eurprd04.prod.outlook.com>
References: <20210827075116.6208-1-Zhiqiang.Hou@nxp.com>
 <2d3cfe41-3c51-34f8-8130-f6b86720d835@siemens.com>
 <HE1PR0402MB337191DE611BA6CC480C104D84CB9@HE1PR0402MB3371.eurprd04.prod.outlook.com>
 <dd785b10-ac8d-f483-7483-f8830ed6147f@siemens.com>
In-Reply-To: <dd785b10-ac8d-f483-7483-f8830ed6147f@siemens.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3f9b2eca-88f3-4ebc-3c8d-08d96ba48bff
x-ms-traffictypediagnostic: HE1PR04MB2954:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HE1PR04MB2954D37C361F70B5F62B438284CB9@HE1PR04MB2954.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gjhvCwGgxKWb7ggYpP4gFC/vhgpDjFxjLExX+oSBSqjZ6ErfRto/cPiQ8YF8KQkNbwES2k2UCJa+AjypHuiw4oX6+X/6zs9FN2ggWHlUouKg1+ihZGVDERcbD+E3RcrhLTGY9hP2V4UNvaeW/174nOP/WlgH+jzo33fVayN0qrL8ke2npeRh7ibQgIG7hB2+3Wb2BZ/cZk5BnzF2OirIsAbecgPnxIBkeWZpSoxC6+4vVeBO9MfCPMeLI/W7Bl4XXC1FdUOM7fzKv1xbGTU4G3L7WPiSgpFvUgHZt7LF/WjbZpVSUo5vDFb3CYJZ/jPhg/bOpru/bLU3A0LtF/oH45W9pzXkCKAjXs6U3g9nZkfWVV4g0puXQSSgNgRdEFGt61UgCUbg3olh1LP8d5GsFQJCWC6rIUP3mnWW25kmmtKTi7jlRJrY4M68jtoZD6O2iRwujLQPVCf1e9mDzGuLu2QU6s2X5CacCuzrhv46SpDZnU83ZlxIf7cLCu0QxZ71ifF2FBAoxRTCUZJAtDAn0IqBViTn0QnNFlNpPjWBcD3m493uLhd3UVrbdcXx6JC0ToAjYcoP2iMnfuvUNm8WzPtIzyOI4spIw3NmSUxnG7TL9GA+j34jDdIqizSd+dCyu1a+ElYOpw29PF2q9nTsdEEhXgq0ePe243lAqkun4Dv0nmu3B3eEANOYEYQOOY8zoWaZYBaG4Jth7uTcHVyshw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR0402MB3371.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(376002)(39860400002)(136003)(396003)(84040400005)(71200400001)(26005)(76116006)(122000001)(8936002)(64756008)(66446008)(52536014)(316002)(38070700005)(66946007)(110136005)(66556008)(66476007)(4326008)(54906003)(186003)(38100700002)(6506007)(53546011)(83380400001)(2906002)(5660300002)(55016002)(8676002)(33656002)(86362001)(9686003)(478600001)(7696005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aCtkV2c1ZzlmNjRnYlRZaERHM3VacDdiTm1vc2JYTmdTT1Y3SmEvbHpOR2Ur?=
 =?utf-8?B?OG1tTHpZT1VmMzVybmRRNnU2cG5jU240VGtRTE1na2JIWmxaL0h1MlkrLyty?=
 =?utf-8?B?UVNleWpqYk9GaTZ2NXJvS1N6WXRqdThNTTVjbXVjSzJKYU0xR3dEMy8vNU82?=
 =?utf-8?B?Tk9YUllOVnBIOXhhdEF6dllJQVU2cEZicHdvU0FUOEtrODdtaGdnRFFOT1Zt?=
 =?utf-8?B?RFNiU3A5NkZLVVJ5enVMZFNaT0pzaFN0aHZ6K21JWFJDa2ZKUFBtSkh3akRR?=
 =?utf-8?B?RExYamg5ZWtVeWJpMXFVRTRpYlRiUjJUVmRGZVA4dXZpZkNrcVVySDZhTERU?=
 =?utf-8?B?V3FSR08wRkZLdVJKN2ovRm40WjIrMkJtaTBDTlAzQTRLVUwycWc3aGxiL0Y5?=
 =?utf-8?B?OUh1WFJvTm9Pb0xDaHgzSlRoVVhPUE4wTTJnalBmOGpVYW9GVFFZbUV5QWgr?=
 =?utf-8?B?M2Z4eU54Y0FuTlNaNXhMRStmUmZnMzRWSW5PWlpWQUc5N053d2lKSENMMUZz?=
 =?utf-8?B?QlFPM2tvK2lOb1gydjV0ZzFJdTV2MytaUWx0YXZDTDdYRm1jVjA4RlZSb0xP?=
 =?utf-8?B?R2l0Mkt1ZzkrSDZSbjVuSDFNSWRBM2Z5U25xSmowYmkzVC82ZUlQbnJiaUVi?=
 =?utf-8?B?OERSeGtjL1dVMWkxMGZzdDJvQ0Eralo0QytCSVM3NWdQZTkvZ1B6T3pZRnVX?=
 =?utf-8?B?c3B3Mks5N1pHd2g2YTlFY1VYZCtjMHNrR0RDWGFieGp5ZjFScXJIVCtsaGNR?=
 =?utf-8?B?TDd0b25Pa3phOUVJQzBPRStibmsraWttclpsaGFtY1UvR2pTbTYyZENiYTla?=
 =?utf-8?B?dzhsemt0WmNpdFdNWVUzdk5lQjd0ZURzZFQxM3ZpQmNkWnFPZDAydXJ5UGJy?=
 =?utf-8?B?SCs1cTh6M2VJaWNCU1kwUlF4cytPU1VndisrTy9CSmlPVjlmR05CUE5DeG1y?=
 =?utf-8?B?REpTU0FMME9JSXZwelZ0MzRXZ0kxMmRzNXgyeWVQQUs4bzBvWnhoZUk2RFFl?=
 =?utf-8?B?Y2pOMDNjcjhubnltcGoyUERpazlXWkpkV0VlbVdOOHJ0cHg2ZXlNK1VhS1lu?=
 =?utf-8?B?UjJOTEI1VE9MSFlZRVFocWVNdUxYMUZhQ1ZvbWFWeFZGNmE1V012WW1jZmp3?=
 =?utf-8?B?dWtnK0o5SHBuR0xGbiswWU5RaVJoN2IxRXNrRmV3WnA2LzJWZDRudmJGWUJr?=
 =?utf-8?B?T0Y1cjc0UUN5TXpSc3ZBOEgzMWtSQ1FqYlc3akxkNUhydldVaW1qcVdiKzk5?=
 =?utf-8?B?T0dybXB0Mmt1YS9NQW1NcjFqVEt6VXVXU0NPdG9FOXcvNWx5ZjY0dHlhd29M?=
 =?utf-8?B?Q1lZZkozU2RONnd3cnlGVWw4Qi9ZMitCaTMxNTZ2WFYyWHY5VXZrTlI0TWVC?=
 =?utf-8?B?blpiTkNPak1ZVkdzVjU0cU9rNVVBTGVjNm1QUW1GRDBRWDF1S2p0eDlpWjdB?=
 =?utf-8?B?Y2dvaDgwbjBrc0lLVG44bTNvSVV2czU1WDJlZ1NNMDBtMTVrNVJuWlAwT1JG?=
 =?utf-8?B?dklUOFFveEQwSWNFRTdkWXlHSHJmWkJ0YUFsSjZFUlNCUGhSd1J0UTlqU0V5?=
 =?utf-8?B?Y3BQZ1VFZldvUjZJbHhoaS9xK1A4VC9Od0NBWjluV3Q0WFNnOG1vWkdSNmtn?=
 =?utf-8?B?ckl5K2RBTXpycFJUTGl3S01jcXQyemc1TU9VYjkvd1BmT1ZvajlHUHAvVGN4?=
 =?utf-8?B?TVoyMzQrblViUTV3Q0g1b3JEVnhNUFdXeng1MnVoYnhaejUxOThrcklHZlZl?=
 =?utf-8?Q?thrZEnE+yKtYZ3wXS+6/UuIYKIt1HHsE0Nh0JU/?=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR0402MB3371.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f9b2eca-88f3-4ebc-3c8d-08d96ba48bff
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2021 10:54:31.6235
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2jJnC1BN8e8BOubTmW2rCYYkstgc7aZorJL+GhiHpN0vPM3f7/vNWvWqwpuEtgSp6WK7hhVhHdzkULhBSUBg1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR04MB2954
X-Original-Sender: zhiqiang.hou@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=c2eeRTGD;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of
 zhiqiang.hou@nxp.com designates 40.107.4.42 as permitted sender)
 smtp.mailfrom=zhiqiang.hou@nxp.com;       dmarc=pass (p=NONE sp=NONE
 dis=NONE) header.from=nxp.com
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



> -----Original Message-----
> From: Jan Kiszka [mailto:jan.kiszka@siemens.com]
> Sent: 2021=E5=B9=B48=E6=9C=8830=E6=97=A5 13:43
> To: Z.Q. Hou <zhiqiang.hou@nxp.com>; jailhouse-dev@googlegroups.com
> Subject: Re: [PATCH] arm: irqchip: Fix the mask according to access addre=
ss and
> size
>=20
> On 30.08.21 05:02, Z.Q. Hou wrote:
> > Hi Jan,
> >
> >> -----Original Message-----
> >> From: Jan Kiszka [mailto:jan.kiszka@siemens.com]
> >> Sent: 2021=E5=B9=B48=E6=9C=8827=E6=97=A5 15:53
> >> To: Z.Q. Hou <zhiqiang.hou@nxp.com>; jailhouse-dev@googlegroups.com
> >> Subject: Re: [PATCH] arm: irqchip: Fix the mask according to access
> >> address and size
> >>
> >> On 27.08.21 09:51, Zhiqiang Hou wrote:
> >>> From: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> >>>
> >>> In function restrict_bitmask_access(), the current access_mask is
> >>> implicitly assuming that it always access the whole register, but
> >>> some registers are byte-accessible, the Guest may get/set wrong
> >>> value when it issue a byte or halfword access to these registers.
> >>
> >> Can you be more specific in the affected scenarios? At least one
> >> example would be good.
> >
> > Let take GICD_IPRIORITYR as an example, which is a byte-accessible regi=
ster.
> > Thinking the SPI INTID 33 is assigned to an inmate cell, and Guest want=
s to set
> the priority of 33 by byte-accessing.
> >
> > Assuming:
> > GICD_IPRIORITY8 original value: 0x00000000 Guest set value: 0xa0
> >
> > Then the current logic like:
> > The access_mask is calculated as 0xff00, GICD_IPRIORITY8 read back valu=
e is
> 0x00. Then 0x00 & ~(0xff00) get 0x00, 0x00 | (0xa0 & 0xff00) get 0x00, th=
en
> finally 0x00 will be written back.
> >
> > With this fix, the access_mask will become (0xff00 >> 8) & 0xff =3D 0xf=
f, so finally
> the 0xa0 will be written back.
> >
>=20
> OK, indeed a good point. We missed the byte-accessability of GICD_IPRIORI=
TYR.
>=20
> But this reveals more: We perform a read-modify-write cycle on behalf of =
the cell
> with the cell's idea of access width. That is potentially unsafe.

Can you help understand why there is still potential unsafe with this fix p=
atch?

>=20
> Handling of GICD_ITARGETSR has to resolve the same issue, and it does tha=
t by
> converting the request unconditionally into a word-access. I think we sho=
uld do
> the same here as well.

I think this fix way is more simple than converting to word-access uncondit=
ionally, as this fix way only tweaks the access_mask, while the word-access=
 way need to tweak both the addr and value.

Thanks,
Zhiqiang

>=20
> gic_handle_dist_access should provide a requested access_mask to
> restrict_bitmask_access. That will be size and address derived for GICD_I=
PRIORITYR
> and all-1s for the other registers. Then restrict_bitmask_access would cu=
t this
> down (rather than building it up) based on the access rights of the cell.
> restrict_bitmask_access would furthermore ignore any accesses that are no=
t
> word-sized, thus gic_handle_dist_access should convert the GICD_IPRIORITY=
R into
> a word access, just like gicv2_handle_irq_target does.
>=20
> Jan
>=20
> --
> Siemens AG, T RDA IOT
> Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/HE1PR0402MB3371C1CDCCD9EA8CC8938FC684CB9%40HE1PR0402MB3371.eu=
rprd04.prod.outlook.com.
