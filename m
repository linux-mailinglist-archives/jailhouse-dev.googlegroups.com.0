Return-Path: <jailhouse-dev+bncBDBIZ3EL3UDRBXPPXOEQMGQEGGJAHOI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ua1-x93f.google.com (mail-ua1-x93f.google.com [IPv6:2607:f8b0:4864:20::93f])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4A53FD1EA
	for <lists+jailhouse-dev@lfdr.de>; Wed,  1 Sep 2021 05:47:47 +0200 (CEST)
Received: by mail-ua1-x93f.google.com with SMTP id y30-20020ab05e9e000000b002acb1511d72sf299865uag.12
        for <lists+jailhouse-dev@lfdr.de>; Tue, 31 Aug 2021 20:47:47 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1630468061; cv=pass;
        d=google.com; s=arc-20160816;
        b=i66Nlevc3Sv2qB8p+CbUkEKmeLa5R14AC9JOJAgxtHQHOkGR7teK0MhMbsxotNYUag
         QY8THLDr2VNCOIlWRWx9CP9I4JglLXFR3zgppW7FgOwwePL+WjI34e00i6T022EGXUxm
         mYJmgZq0GwarEuShFwpZGmCUEjKTsIdQjAtML5MXg/rj5R/HtSUnHS7BCJsAINmWvEvi
         tb4ZHwq6KvR+RoluhCs02ASnowApPXU/koZYWMxnEQfTLUp+IgJTCh+p1hBydQwQvRjx
         keQbz5Pz+046bPeYdKLyei1uAB0Nptgmc56CX2ilhZlwpn7Cm5lvRPt4JABUj6YvrzZ5
         mXNg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:cc:to:from:sender:dkim-signature;
        bh=scCfJ+S50iGIbbdQ3X1A950GuOFrTDt+dH6yefYc32M=;
        b=GAGaobwulsMYhGvWKE22dbGnIEm4Aln5WohmVEe5CrWJoLYsXdIf1IrDJuVgcT9zEB
         fOsEPrm8musRFEWbRVhbE01H/2Nwz/isIsxP5P8VZZP6yCzAlZWfFyTZc2UlMVD4BtbM
         vm3cmXpKrr9ZGYu/LT5EmJNJyIC48pvf5z8ektmzeCRgGiT0ONElE+pT4O7PZ2Pzwl+6
         zNmRfapiWngjazcbC9oAz4wRNZPynRhXt+pCxv3XxBGBYz5+H1nbxoaOGhZTWlUfb7Aa
         LBVz4DSP6d3m2s1Y7eBXtHX8mylp/M1WJUYrn+1rYgdHAu6cVCYjalAvQ8WM2YXXvv0K
         aS0Q==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=qyDZCe6L;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of zhiqiang.hou@nxp.com designates 40.107.20.55 as permitted sender) smtp.mailfrom=zhiqiang.hou@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:cc:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :content-transfer-encoding:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=scCfJ+S50iGIbbdQ3X1A950GuOFrTDt+dH6yefYc32M=;
        b=LTHnzWKB+pSJBsu57pa81KKSPMtY6fCHo64VvZEQa9GA9nSvaedZxw9g8fGzcPJi7g
         1FROKBesbuf0MasXt9NZMbfDUjp7M/MztqaQaEvZYHGd4EZ/Gp9WsKr3QDz/4YWBm5wQ
         PDq+nWMC1Eus5ulx4gQsC5r3N4di/z12QUPzW4QFSeJEUuGSMPL4dsAMN4udeZaPSFEr
         LH0RI2vI8Hgl9y3jR+lMzwpU9fpf2NYojGvcFeELdJv6+VQ/HQ3sVBUAE84FA7o8Lt5q
         +KrBedEzb3EuGCz0KbjiJtXvB4BxbIE/r2rMhGS0o0BKTjKyNwIgKPspSSLyIiwlgZ5p
         bICQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:thread-topic
         :thread-index:date:message-id:references:in-reply-to:accept-language
         :content-language:content-transfer-encoding:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=scCfJ+S50iGIbbdQ3X1A950GuOFrTDt+dH6yefYc32M=;
        b=nCpDRdW195FsIU3b2892QFyevXBK1Xp8T6yFXrXTuCjScYIR86QtS/vspmlumbbTGf
         rowQ8F+WxmpjCzP1PtlzvpFw0PHzzDPl/398SMnxQb894AYzGUT1xQi9itxhopgGZZM3
         qxsd3enQHXHPQOkmEqVpOuZO0nfY7auvMT8Q3ihz3Y10YOxjCT+sJli1BR6ggeGVTaT1
         Gpkk8RzTDLjCN4A1tJWuPmA3Guu7qJCQgmZ5ZVicoaqmriXPQM0HBf+oTQ1xjHKQQqT0
         mbcTMM0739iWkvwzp0Jqs7weUz5j/qAlkEssu6jjoOkRCneoC91iNGHVGeAdXW0faqpr
         QuAw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530OsXUDd9k1trgpcsWN7XxjjLpFrb9jOgKyUxoMeoR3yGRm1uPK
	QNz5CW7lYk3Lh+LxhCaogi0=
X-Google-Smtp-Source: ABdhPJxp1FiivPEHk7BpNeCFhWjxTWhdEUwkcg9k2e30Bwzc3iuEhM++n29QU7NQ+KHZ88NK1z5TEg==
X-Received: by 2002:a05:6102:ccd:: with SMTP id g13mr21190613vst.10.1630468061615;
        Tue, 31 Aug 2021 20:47:41 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a67:6046:: with SMTP id u67ls225560vsb.2.gmail; Tue, 31 Aug
 2021 20:47:41 -0700 (PDT)
X-Received: by 2002:a67:df85:: with SMTP id x5mr23170489vsk.3.1630468060977;
        Tue, 31 Aug 2021 20:47:40 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1630468060; cv=pass;
        d=google.com; s=arc-20160816;
        b=gi3jt02sdGMH3t2+XSbsnLyBPxY/9Q1E037lf8xG792b3NepJwRHPXK9DT2KaUFz7E
         n22bBuaZmzLJ12x/I8jX3CEbCGFNsyw+PTlYTXxuBa1F+Mg05m9m/w53InHV8pnhUPCi
         ulGQzx6VxCNIinOO+DzJRS3MVea+ZxQC9tMMB0kSVK1SSimMqDufm0S2VukirojY3aXW
         WwfyLFzwuDqCT5F/E/95PvxosphBxLTmjlOCeN0lSvF8RAHVH1hFSCj2T8vxKIA+co7c
         flqBUav5ncb2+nlQzoveFjSzHERiOmn5911bSkxgUumat8vWJWdy9s9xIClkt7GY5WrV
         gu4w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:dkim-signature;
        bh=tMgjnDXyKS13xIaZ24EiwfUX9eg/iqcb9ZdsYAJflxg=;
        b=BMEJOwsVERmtkLCV689sR/UytpUlYqwD0VyDxZ5s4O041D6DadbslpYqvpq7L1MxfS
         kgqL4pP8rOQtB0z42d32vCVZ5/1B6YPX8oJyR7hFpBNelLx1C7JU1nDP/IkPrKckMLEZ
         5THuYCTII6R2MN/L8i4/1lBq28OOROApHOtZ5K51aBcxdIq/Hxzm6YOGWDIGVcFd5d//
         FMZNLlQrQjQgZGTSMQ5gy0nIkLtmI1FSHldJotGxn/fsnNmYImslMnbLNReYqaYoxNXb
         9eFNwf5WIEwrh+gVVankWRVxI5WLUgfvtBVev6vTfC28iQ7oVAB6KqhL+Uk4dXEcuwvg
         KQmg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=qyDZCe6L;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of zhiqiang.hou@nxp.com designates 40.107.20.55 as permitted sender) smtp.mailfrom=zhiqiang.hou@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2055.outbound.protection.outlook.com. [40.107.20.55])
        by gmr-mx.google.com with ESMTPS id m15si1469116uab.1.2021.08.31.20.47.40
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 31 Aug 2021 20:47:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhiqiang.hou@nxp.com designates 40.107.20.55 as permitted sender) client-ip=40.107.20.55;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PxUWp6ktaOv8RLsyB8mY4fKP+tIOwzV1s+7ZL6wE57IgnAUQ1O8XbILdfpC2eCUs0B8eBAnW4enhZt++0AJh1HBJM3ELDG7Lo6iUN2zazRyscTvHGR0LhvhFZeOqb+gwVJb0rCfMVpClDBMgd4yzPRRt6WSMFSO28S4Msm3YnYLOq90mp6CL7IIr7Evu1YoTsMazAPnXeXYHv0TbHx314SO9u18C3MSnuEOM4iw+SdoiXo9ZEMwCWnLfkgbktsZ6xxw3aaSXY8+ymm7ilVxcyoUmkl2Vm6mk/+NJ1M5xSTj3gkNkQZoWwQFlDn66btLevHDtgI5K0RlJ+/UyMAVbzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tMgjnDXyKS13xIaZ24EiwfUX9eg/iqcb9ZdsYAJflxg=;
 b=II6WxxEYnV60dm/BU0o/IsT/f+IFvysO6MqGpkyKef6uiU/4f7reXhz4rxf7hnMozIY1z+zDz+5kuHuXHYpOUJ6NhJ5l1biWDoXFqYV7eqq94Hw7P7T2DKqFB3knHD81ixz5sRYHm/tkiHFdYR0vQ97LmAGsy7wneQQ2PSFfypnUML8pkzd65jKE3rYHeFt3g2oFP6cGS0+ACpe9bwyq6pPRHmFn9Ds+m8G3X8xFn4NvpBzrieM5JPsV6knUd7QbKOlZdcci7KzEmqbQsrgodXXAHwxvN9CbEGJdYo7tOFKZCPAu/qp5MGPEHb4tZuu97VQDOqbZPMSLi0Tw8T1oHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from HE1PR0402MB3371.eurprd04.prod.outlook.com (2603:10a6:7:85::27)
 by HE1PR0401MB2380.eurprd04.prod.outlook.com (2603:10a6:3:25::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20; Wed, 1 Sep
 2021 03:47:37 +0000
Received: from HE1PR0402MB3371.eurprd04.prod.outlook.com
 ([fe80::8d8a:89d:e110:3c3b]) by HE1PR0402MB3371.eurprd04.prod.outlook.com
 ([fe80::8d8a:89d:e110:3c3b%6]) with mapi id 15.20.4457.024; Wed, 1 Sep 2021
 03:47:37 +0000
From: "Z.Q. Hou" <zhiqiang.hou@nxp.com>
To: Jan Kiszka <jan.kiszka@siemens.com>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>
CC: Jiafei Pan <jiafei.pan@nxp.com>, Rui Sousa <rui.sousa@nxp.com>
Subject: RE: [PATCH] arm: irqchip: Fix the mask according to access address
 and size
Thread-Topic: [PATCH] arm: irqchip: Fix the mask according to access address
 and size
Thread-Index: AQHXmxbhYfr68tdfjkGRS5idFHzolauG+uuAgAAZduCABHlagIAAUF/ggAAZuwCAARBj4IAAMEqAgAAWFqCAAE9MgIAA4w4g
Date: Wed, 1 Sep 2021 03:47:36 +0000
Message-ID: <HE1PR0402MB33713AC7844D1B67AC8B67F384CD9@HE1PR0402MB3371.eurprd04.prod.outlook.com>
References: <20210827075116.6208-1-Zhiqiang.Hou@nxp.com>
 <2d3cfe41-3c51-34f8-8130-f6b86720d835@siemens.com>
 <HE1PR0402MB337191DE611BA6CC480C104D84CB9@HE1PR0402MB3371.eurprd04.prod.outlook.com>
 <dd785b10-ac8d-f483-7483-f8830ed6147f@siemens.com>
 <HE1PR0402MB3371C1CDCCD9EA8CC8938FC684CB9@HE1PR0402MB3371.eurprd04.prod.outlook.com>
 <9ecc5d87-c7b4-ce84-6621-f88cf05fbeff@siemens.com>
 <HE1PR0402MB337140548025A20E651BB4AA84CC9@HE1PR0402MB3371.eurprd04.prod.outlook.com>
 <4d107c19-ba44-c5db-9452-1552e0b66c93@siemens.com>
 <HE1PR0402MB337106827ECC0CE4ED356C1784CC9@HE1PR0402MB3371.eurprd04.prod.outlook.com>
 <2b88eb53-8258-2d0b-d0d1-71c24bf372cb@siemens.com>
In-Reply-To: <2b88eb53-8258-2d0b-d0d1-71c24bf372cb@siemens.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5c742f24-e3aa-455d-bf15-08d96cfb3d51
x-ms-traffictypediagnostic: HE1PR0401MB2380:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HE1PR0401MB23801A52BDE1B725770E986B84CD9@HE1PR0401MB2380.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RnEIUSUb15lndHAsGQrtJebhQLN6XErBNmSNKOm4zPmlLXUtuzGT92hKxNXoS1fY4Re1LewaBv+MLZWbLw3t5rzBfz2TjnLfC1fbMwet1XDr8lCURO/2gJ1La50DnrWGE8Pxw0+Zxwbo/h2WB8GP94+J5+uWPgQnB9V0uchvlIbW4Ah0esTN64xojcpXYOslAkOBNo8fKKhivU4APvQ6V1pOjia0m4etWHh2oFd7le4FVuJQAodXXJk5cGBKo315LUPG9L9rqQ1KA59HNbEaApAkPOXvmJcrLlDYTnrqdz/VTA/IY3HmUMXvuj/kNeweMT9CWz7Ec7EiNZh5hUUAF8ClWcHwM5NW72Hf66mTj3zuadPyiJseKPep8AxL2uxSQo+KY8/i1eN3D60A/UOP3urKAO1scXDQIf6myXBfnOjXRzNgjkIj7jQDl3UKmKf3bM8C/mb63B39neVIBvg2UztgtK4Xhh3rrwzgybvqz2+F8Bp2sOpkFskeEM141Qk8wHh7r353SnafUkr3Xvr+OxrD28RmIt+oQR5S8nGhfJXjjaSqI1D04N0UHwkvi9ugeLr8PulU91dH1xWjLADJOkO5wZeOG/xSjM+5sajfz1UoUhmOzNM7cVlIX8uVLigCL2L5z7bWDTx9m2hreUUlQpOYX7Yq7ZQgbBl5gyM0eTZs/5emfMlAn0kNkpQQ9Y7DWB65Q9LI1aqqUBMBPC9wwg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR0402MB3371.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(376002)(366004)(136003)(346002)(84040400005)(66476007)(83380400001)(478600001)(52536014)(55016002)(76116006)(66556008)(316002)(38100700002)(8936002)(66446008)(122000001)(64756008)(66946007)(110136005)(7696005)(86362001)(33656002)(186003)(8676002)(54906003)(26005)(53546011)(4326008)(71200400001)(6506007)(9686003)(5660300002)(2906002)(38070700005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q0Faam53QktqcmF1OGQ4TXlobmZ6WHUxc2VFbDUyT3JlQkJTSzdwMkRxLzdJ?=
 =?utf-8?B?OVBxMHRMR2RPcGYwbE5Ra0JnQ3ExL3Zod01PTDZzS3VRSjN1WnhQVkZRMTYy?=
 =?utf-8?B?YmRzaU1IeDlwUmtBOEpNeElYQjBrSk1yRjRSd0lqMnZSVW5wNnY5eDJiLzN2?=
 =?utf-8?B?azBkMU0zK3NjVWhyZGNoZEJaaXVhM1cxS2J2MERacFJGMVEwVmMrM3Z3U1Ey?=
 =?utf-8?B?YnJ4NUFNUWt4SjJsSVQ3ekk4SUhsTHc5NlVUVzVQSlRhZGY0c2daSm1UQXZP?=
 =?utf-8?B?bDdOUXo0UzlYdUU2ZEVYQWZzcHdFQ0NjcWZPNzlmUzNXdVZIdUJGS0pLV1Zk?=
 =?utf-8?B?R0ZFckdvOXRjWlJRSk5ZUjJBQkFCcnI1NDRGS1ZZWjBuWlVMaUQwWDhzc1gv?=
 =?utf-8?B?eklaMU5uTmlqdTMrNC9jTnVlQzdqTVFsRDY2cnlqVnJNTUV1UzJieW5mdFd2?=
 =?utf-8?B?cnladkp0OE5pejVmcHM2R0FTZ1RTWm9XWnVueVRVMG1KYUgyWm9RSjJTc3VH?=
 =?utf-8?B?d3NjYUwrQ3lqdThXdllsWTNrWk5JSnN4Y0pmaWdrbzloZ1QwVzV3MWt4ODhr?=
 =?utf-8?B?aWp0clRkNmhuaVNST2kyZzhLNTNWTTZWaCsvaHRMd29tbUhSN2ZKQThudWsx?=
 =?utf-8?B?M1puSXNNRzVCZ3FDaFFlZDhHcEtuT2NXdjgvSzB6c3V0VWpVUDRtZkhUNEF2?=
 =?utf-8?B?MHpQMlZRRjlhdmE1OVR1bS9FVG5UNzJxZC95MVJPYWFieUQwOW95c3AweEkw?=
 =?utf-8?B?SkdHYm5pTituRm4wNWJMT0hVVkdSdkFoWndhQWEwUkc0c1pqUUNETi9SWlJX?=
 =?utf-8?B?YTlCaXg3LzFGU3RjbUg5dU9TaEgvb2FpMm5rVnExQ0VwRkljUmw5L204T0VI?=
 =?utf-8?B?c1FvUTJ2N0c1eHZKRUdwcm1mNEdKNkFyNklyNlhHVXdQOHRsUk9wSjBSczFG?=
 =?utf-8?B?Z3d3b2phdC82aHp3R0t2MTVzRXFaMHVxRFkxVjdtdkJOeFlCZkxNUFMyNUMx?=
 =?utf-8?B?aVFZUkJYTk5WOTNZdUsrWmRiMnpqVFVxa1NNY0dIOTFvYTNkbU5PRjF0cktP?=
 =?utf-8?B?TWI0MVhsU1RncUFQVzYvd2YxeWFIcG1MWXlaR1hTdWs1Z1FuQzRyR3ZYdjIz?=
 =?utf-8?B?aXBNSEFyUVcxUEw2anJPUWtLTTNJakRiODg0VGc5SGFRblRYcEwwcUo5VFZS?=
 =?utf-8?B?dUVBV2hOdlpkcUJTdExHdERyclpzUVh4RkVoZ3BFc3hRZis5dHRQbGFoWVls?=
 =?utf-8?B?eXVmOHl2NDF3NEhXTkt6YW5KOVpMK0lGSmhLRWJIQ3B5YUZZVVdEbmNwNU9u?=
 =?utf-8?B?UTd0ZENrcGFFNWlPTXJaMkNsdmNEdzArV2J0aVFZaGxqelZIQkFuM0FTelBT?=
 =?utf-8?B?Wm5QWFI2cHdSaWVRNkRIM3ppVldLbDBzNnlGYzF3elVWdSt6b3VyM0ZJdVRN?=
 =?utf-8?B?QmtSNEtjY0sxMWRqNjFJRWFIaE0xWjNHUjhhbm0wTGp4Nlp3cmp6S1BQU3Zx?=
 =?utf-8?B?QzJ0eTAwRTFyME9QYTlLZU5MTFdVcThIYVlBNTlGNkU5YlNYRng3emxlSEMv?=
 =?utf-8?B?empHb0dKL0xxZytLY1JrL0FqTFQyME50M2NmM0JUc2lJSmE1RkZ2eEMyS0tC?=
 =?utf-8?B?MjRwWUNmZkJRUW9BMmJQS0RLaXZQQ1htNFhYUmNLZnBUNHVPY3pyeDNKSEFh?=
 =?utf-8?B?ZkhvNnBxZDlxK1YyTnB3QytkWnFDRVc4UHZsT0NPOUxoK2Q2b2xWczBSWklK?=
 =?utf-8?Q?YrXBKQMZveKx9uO9ErI76n9h8/j/pkp0dElOya1?=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR0402MB3371.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c742f24-e3aa-455d-bf15-08d96cfb3d51
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2021 03:47:36.9425
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N3jO7slgFZ1fChM9efeZhNG9Pe/MG4Qh6PAqVIZaiLXeDwdE9UVqqKRr2B/xr/ZFdZ8BOsZXdERcGqwbhYVHoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0401MB2380
X-Original-Sender: zhiqiang.hou@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=qyDZCe6L;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of
 zhiqiang.hou@nxp.com designates 40.107.20.55 as permitted sender)
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
> From: Jan Kiszka <jan.kiszka@siemens.com>
> Sent: 2021=E5=B9=B48=E6=9C=8831=E6=97=A5 21:14
> To: Z.Q. Hou <zhiqiang.hou@nxp.com>; jailhouse-dev@googlegroups.com
> Cc: Jiafei Pan <jiafei.pan@nxp.com>; Rui Sousa <rui.sousa@nxp.com>
> Subject: Re: [PATCH] arm: irqchip: Fix the mask according to access addre=
ss
> and size
>=20
> On 31.08.21 10:48, Z.Q. Hou wrote:
> >
> >
> >> -----Original Message-----
> >> From: Jan Kiszka <jan.kiszka@siemens.com>
> >> Sent: 2021=E5=B9=B48=E6=9C=8831=E6=97=A5 15:11
> >> To: Z.Q. Hou <zhiqiang.hou@nxp.com>;
> jailhouse-dev@googlegroups.com
> >> Cc: Jiafei Pan <jiafei.pan@nxp.com>; Rui Sousa <rui.sousa@nxp.com>
> >> Subject: Re: [PATCH] arm: irqchip: Fix the mask according to access
> >> address and size
> >>
> >> On 31.08.21 08:55, Z.Q. Hou wrote:
> >>>
> >>>
> >>>> -----Original Message-----
> >>>> From: Jan Kiszka <jan.kiszka@siemens.com>
> >>>> Sent: 2021=E5=B9=B48=E6=9C=8830=E6=97=A5 20:03
> >>>> To: Z.Q. Hou <zhiqiang.hou@nxp.com>;
> >> jailhouse-dev@googlegroups.com
> >>>> Cc: Jiafei Pan <jiafei.pan@nxp.com>; Rui Sousa <rui.sousa@nxp.com>
> >>>> Subject: Re: [PATCH] arm: irqchip: Fix the mask according to access
> >>>> address and size
> >>>>
> >>>> On 30.08.21 12:54, Z.Q. Hou wrote:
> >>>>>
> >>>>>
> >>>>>> -----Original Message-----
> >>>>>> From: Jan Kiszka [mailto:jan.kiszka@siemens.com]
> >>>>>> Sent: 2021=E5=B9=B48=E6=9C=8830=E6=97=A5 13:43
> >>>>>> To: Z.Q. Hou <zhiqiang.hou@nxp.com>;
> >>>> jailhouse-dev@googlegroups.com
> >>>>>> Subject: Re: [PATCH] arm: irqchip: Fix the mask according to
> >>>>>> access address and size
> >>>>>>
> >>>>>> On 30.08.21 05:02, Z.Q. Hou wrote:
> >>>>>>> Hi Jan,
> >>>>>>>
> >>>>>>>> -----Original Message-----
> >>>>>>>> From: Jan Kiszka [mailto:jan.kiszka@siemens.com]
> >>>>>>>> Sent: 2021=E5=B9=B48=E6=9C=8827=E6=97=A5 15:53
> >>>>>>>> To: Z.Q. Hou <zhiqiang.hou@nxp.com>;
> >>>> jailhouse-dev@googlegroups.com
> >>>>>>>> Subject: Re: [PATCH] arm: irqchip: Fix the mask according to
> >>>>>>>> access address and size
> >>>>>>>>
> >>>>>>>> On 27.08.21 09:51, Zhiqiang Hou wrote:
> >>>>>>>>> From: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> >>>>>>>>>
> >>>>>>>>> In function restrict_bitmask_access(), the current access_mask
> >>>>>>>>> is implicitly assuming that it always access the whole
> >>>>>>>>> register, but some registers are byte-accessible, the Guest
> >>>>>>>>> may get/set wrong value when it issue a byte or halfword
> >>>>>>>>> access to these
> >> registers.
> >>>>>>>>
> >>>>>>>> Can you be more specific in the affected scenarios? At least
> >>>>>>>> one example would be good.
> >>>>>>>
> >>>>>>> Let take GICD_IPRIORITYR as an example, which is a
> >>>>>>> byte-accessible
> >>>> register.
> >>>>>>> Thinking the SPI INTID 33 is assigned to an inmate cell, and
> >>>>>>> Guest wants to set
> >>>>>> the priority of 33 by byte-accessing.
> >>>>>>>
> >>>>>>> Assuming:
> >>>>>>> GICD_IPRIORITY8 original value: 0x00000000 Guest set value: 0xa0
> >>>>>>>
> >>>>>>> Then the current logic like:
> >>>>>>> The access_mask is calculated as 0xff00, GICD_IPRIORITY8 read
> >>>>>>> back value is
> >>>>>> 0x00. Then 0x00 & ~(0xff00) get 0x00, 0x00 | (0xa0 & 0xff00) get
> >>>>>> 0x00, then finally 0x00 will be written back.
> >>>>>>>
> >>>>>>> With this fix, the access_mask will become (0xff00 >> 8) & 0xff
> >>>>>>> =3D 0xff, so finally
> >>>>>> the 0xa0 will be written back.
> >>>>>>>
> >>>>>>
> >>>>>> OK, indeed a good point. We missed the byte-accessability of
> >>>> GICD_IPRIORITYR.
> >>>>>>
> >>>>>> But this reveals more: We perform a read-modify-write cycle on
> >>>>>> behalf of the cell with the cell's idea of access width. That is
> >>>>>> potentially
> >> unsafe.
> >>>>>
> >>>>> Can you help understand why there is still potential unsafe with
> >>>>> this fix
> >>>> patch?
> >>>>>
> >>>>
> >>>> The patch is fine for GICD_IPRIORITYR, so is accepting all accesses
> >>>> for that register. The problem is with other registers that do not
> >>>> support byte accesses.
> >>>
> >>> Don't worry, according to the programmer guide the Guest code must
> >>> not
> >> access those registers with Byte-width; even if there is someone do
> >> that by mistake, it will trigger an exception before the access is tra=
pped
> to EL2.
> >>>
> >>
> >> I do worry: We trap the access to EL2 because the memory region is
> >> not backed by memory in the first stage translation. And then EL2
> >> will issue that request and panic.
> >
> > You're correct, I did some experiments, the byte-width access to
> non-byte-accessible register is also trapped to EL2.
> > But what I'm not understanding is the byte-width write access finally
> trigger a SError (ESR_EL1: 0xbf000002) to the Guest instead of a exceptio=
n
> to EL2, and the Jailhouse does not crash. Do you know the reason of the
> result?
> >
>=20
> No, not really. I'm architecturally not fluent in that details, and in th=
at state I
> would have expected a crash at EL2 as well. Maybe someone else is listeni=
ng
> with more detailed knowledge. Or we are in an implementation-specific
> behavior region here, and your mileage can vary from SoC to SoC.

I did the experiments on imx8mp with A53 cores and GIC-500, and looked into=
 the TRM of GIC-500, it says: " Byte or halfword accesses to registers that=
 do not permit those access sizes are not successful and return a SLVERR re=
sponse." According to A53 TRM, the SLVERR is consistent with experimental r=
esults ESR 0xbf000002.

The last point I'm wondering is, the actual access instruction is issued fr=
om EL2, but finally this SError is taken to EL1? This doesn't adhere to the=
 armv8 exception model that an exception can never be taken to a lower EL. =
How to explain this?
I did one more experiment that in restrict_bitmask_access() check the acces=
s size, doesn't perform the access if it's not word-width. The result is th=
e byte-access to the not permitted registers doesn't cause SError, so it co=
nfirms that the SError is indeed caused by the EL2 access instruction.

Thanks,
Zhiqiang

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
jailhouse-dev/HE1PR0402MB33713AC7844D1B67AC8B67F384CD9%40HE1PR0402MB3371.eu=
rprd04.prod.outlook.com.
