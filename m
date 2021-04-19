Return-Path: <jailhouse-dev+bncBDGILGE54ELBBQWT62BQMGQEH6XRLJI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53a.google.com (mail-ed1-x53a.google.com [IPv6:2a00:1450:4864:20::53a])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6AA3647C0
	for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Apr 2021 18:03:15 +0200 (CEST)
Received: by mail-ed1-x53a.google.com with SMTP id bf25-20020a0564021a59b0290385169cebf8sf4048640edb.8
        for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Apr 2021 09:03:15 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1618848195; cv=pass;
        d=google.com; s=arc-20160816;
        b=OETmj7QGDkoVEwT/CEeU8/VkbrBwKJHyINWUrt0QLxqKauD98aiV+AUJlCWpW5u0tS
         yXrGYfnEj4qzU0Y9F7+URCgr1VIPPt+wQ7puxFo7pyyq4aYlWpEmcn7sVJtcMpTdBas0
         uVpQysKauqbSf2mPfdDuDGVjMyZQXSt1en/B8kbGKbJbE0aioAx0XbzPPTyJliphRb/j
         RMuJZFF8lipGawVnh4JTK7GZb7G0S6uklYm0fPgSplZI23gTiMleSUFXz+ZtMMKWmCPM
         hnwkn4gWIkaIDVcah0/LsGwpSNtL8k82/ypM2JLAwCKhChLW7QBnI+NS0bxtKC3whnVO
         Uf3Q==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:to:from:sender:dkim-signature;
        bh=qmU8mQfIJ3OGsX2yT0GlgSnoxYV0xQP3FUS61+djucc=;
        b=HQ65hfjSClB3D4nuX1YZ2k9S4diHq3rrnUdDn7fe1Zl+j3nB1mfTcF6Yl1czDAxQjw
         JXGWNq3P5TrbWrWee0FV2uEsiOJQoK5X/omEDy1ylGmLr2zD4ncURKsZJ+QIbbRG2m/n
         HaZp3kZxFRlNi26hPXkmdsff56xEqVRki+7YnrnnSpPIGTc6YuU3EX66w7PXU+KaIUYu
         cQSBa10JKyoIjXr3ErDCYGoRcXPjqrP5E6POgaSz4fV7OM8A66qcIlEk24BG0OCksrUm
         e/YBCC6cke+QpI3G51RV18cGV7uN9CqKrcAXzOQZtVMDSo9QEz6BMX4Dq4by8qYRJaOE
         TA8g==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@prodrive-technologies.com header.s=selector1 header.b=VlMoCYFt;
       arc=pass (i=1 spf=pass spfdomain=prodrive-technologies.com dkim=pass dkdomain=prodrive-technologies.com dmarc=pass fromdomain=prodrive-technologies.com);
       spf=pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com designates 40.107.5.109 as permitted sender) smtp.mailfrom=bram.hooimeijer@prodrive-technologies.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=prodrive-technologies.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :content-transfer-encoding:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=qmU8mQfIJ3OGsX2yT0GlgSnoxYV0xQP3FUS61+djucc=;
        b=WEU37JOdG/XfyxbObBCKzUKYS/pOjFZfaJbQmbXCDouYeqIMJe4rySpyQ3qbTde9Gc
         uwbOE4sNA5j8BnO2pAgZqcieNZY2PGWgpAr37lSd9WOFpZI2anxYC0q9Y5ve0q+AWbUM
         39ePBIS5+6+lH4BSvD7tnaM+iIpMXGPBSk9U402O/NXvXvmgljgko5no8Qqkr+d+JLF/
         RdWowGokZ4DWgrk/yTtheJCXjDzqG7/AUELk2y7Q4N5pnBYv5FZT0PBRVNfMv9dTYQrk
         IAlRrXrk4qpKo+lnhD4QNMWUJsvflQ+hXimqSWAUw8e0ltiz+sK350dDKWosj/MkeCTw
         DHlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:references:in-reply-to:accept-language
         :content-language:content-transfer-encoding:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=qmU8mQfIJ3OGsX2yT0GlgSnoxYV0xQP3FUS61+djucc=;
        b=Iv35iZGhENHJHXdFJXWHBXyoHA5sEJ/CRwnAIrNoy68pWKKNUBuz/nIg5YVmB7kmpP
         W7uYOhfLbxIoXA6se025OU7mxEf4ELLNbuBgndB0YPRssEKU8E/1WlS0yhGS+gK0ZpmM
         4ASrknlnZA43QVTNVSZoDGHRTG0TJKvpiV/UyppZct1A4pextt+G9Rakk+6FuGQN712Q
         qI4OmwqbePGeDYUYugCakenxqXcqacdds3iCGw1tAJlCOa5QutgQLUplL1Qtp8HOT+es
         6Kz/Dq6N4XHhY45400XCBh4gl70yR5m6gvknJ6xxSG/F7vzmZLRbqiyGlDMhhHfwTOta
         pRKA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5334PAr1w385lyIT+GijYopmlchZTst6Q4m+jqoJgfrzDFikqePH
	8xLaqnNeEstXt0mlAp5Axs4=
X-Google-Smtp-Source: ABdhPJysdqqjYHFiPyLgAttRmDsqCsCcbPfHtqrBMOQN26N35KS7CtffRExFGRU1RlrkaU7/Vog+YA==
X-Received: by 2002:a17:906:3385:: with SMTP id v5mr22885153eja.539.1618848195096;
        Mon, 19 Apr 2021 09:03:15 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aa7:db59:: with SMTP id n25ls1939634edt.1.gmail; Mon, 19 Apr
 2021 09:03:14 -0700 (PDT)
X-Received: by 2002:a05:6402:354d:: with SMTP id f13mr26775492edd.228.1618848194031;
        Mon, 19 Apr 2021 09:03:14 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1618848194; cv=pass;
        d=google.com; s=arc-20160816;
        b=ZH4JcgFMgzRD+m9o02WPe81fF6K8yMQT7TAjGtqHzsyCygSUPfgP0PTqnp9t2SMXe2
         xjWXw7Y9nrFEoB+HCu5vlBX2XPECRp4ox49swInuohlSc15/ppk+qm/G3hiyW7k/UxtS
         e5cre3JPw19K1ZeLYShu9l7js/C0m5Gd47u1Lw/Eflh+8rwru0HJ8BTucS6OqL7/245p
         DHe4Jxm44tiFEVZIbuUNjsG919AqhHwH82QYjbloAeUDvbBmhnwEFTMfkWycVJqb1ESy
         BmLP9WReE+ZNBII4ATOyNu5BMVvVDsUp1TafRfcXg+qMl8smP+8AtPeR0OLqcnd9000Y
         X/hA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:dkim-signature;
        bh=uOi4xTwHRfuuTwsg44wv29a0jeSattdxrJ81ZWqk7gw=;
        b=sPmdaKK2x8AQ80IYzIVpwoBP9BAiqOubIbZ1FzWy49F1f9BlB0Vw358po6WGWGPhJC
         MqHeSafBIlhFPV/LqV0HrM21KgWPqhBmuEyufe4BgFl2u6hqPcm4S5i8Sj4sVEaz8cJx
         tx3GI0u6cIs/d5xGVJpoa5oDDyh4xp3Chj9LchQ4LAC0xb6GTwB7zztetZp82vEWmMmt
         W5JXvAN7hy7cOmXQOZ4cJODMmHoQFyoApmHKHOY1TujpuQW4wj65vqM6+fzT1PeYUBg+
         UMSPTvpVlbgkA5HAfutZmlcfyhx4+oRFWHDhNPgdJKpMbqgOGibHSuhgXW7f9eYyUB6g
         qftQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@prodrive-technologies.com header.s=selector1 header.b=VlMoCYFt;
       arc=pass (i=1 spf=pass spfdomain=prodrive-technologies.com dkim=pass dkdomain=prodrive-technologies.com dmarc=pass fromdomain=prodrive-technologies.com);
       spf=pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com designates 40.107.5.109 as permitted sender) smtp.mailfrom=bram.hooimeijer@prodrive-technologies.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=prodrive-technologies.com
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (mail-eopbgr50109.outbound.protection.outlook.com. [40.107.5.109])
        by gmr-mx.google.com with ESMTPS id r21si1115047ejo.0.2021.04.19.09.03.13
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Apr 2021 09:03:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com designates 40.107.5.109 as permitted sender) client-ip=40.107.5.109;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ue0Cna1a8rNbWaYvhoVgPsLK7yJ4L5cqB2dPLo1rJX8DLjXjdFXfBfeID4GNd5gdi913RNxGGfFYAvQyzhLot+kK3/KziyCg/89Uhkz7vl3gl18iGY5bAFFxyVq/2Pl/YqlFRudIaN9f+HkD3WVAwP1TRacsMX51p5wVOO4jDCCLt+f78grhdsv7pG+myWkiWVP0d8C+GwJ7Vs92DR1iInf7ckoNLbSrhnV1DaOCexEh+vly5dhrtMHrYyiusGN1zCAXez86U8EL8huj2wLKbyxaMAifvlm0mEFjUxR4ShuV9Bl/0NCMPeRhjxdApK7/u3gao1GLLYKxSnX7+0V1TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uOi4xTwHRfuuTwsg44wv29a0jeSattdxrJ81ZWqk7gw=;
 b=Nye255rOH3ZbOLfvOqQtDh0N68iOkMMqqvXxEeWUDIq9dh5PwnO7Rc+jLeccPBSyP41YVlDKEtQxf9cFnX7ZJti+hb2gQaFl84uqnXPW5vw/u3yqVeJPC2c6sji1SdBqsqX7U3+Nu8DszftXShT04OCCE/jenGIyVL2xdkbOU+N9owV/cZk0HMjTOgJlx5/f9DRN/bT2snls9SyJBR7SpHdsSRmaX9d3nE4SwQm/W8RN1llfbHIB6/QHuko+zbHRTEZtYmFB4ArAe/OY8Ng0S6v0Fd4sMxjfXirOa8j7gN3LI37JuibUbogBJYklhaqZ1HhaTTixeY3twC9pprZVsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prodrive-technologies.com; dmarc=pass action=none
 header.from=prodrive-technologies.com; dkim=pass
 header.d=prodrive-technologies.com; arc=none
Received: from AS8PR02MB6663.eurprd02.prod.outlook.com (2603:10a6:20b:257::14)
 by AM6PR02MB5415.eurprd02.prod.outlook.com (2603:10a6:20b:ea::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Mon, 19 Apr
 2021 16:03:12 +0000
Received: from AS8PR02MB6663.eurprd02.prod.outlook.com
 ([fe80::69b5:15e2:476c:e151]) by AS8PR02MB6663.eurprd02.prod.outlook.com
 ([fe80::69b5:15e2:476c:e151%3]) with mapi id 15.20.4042.024; Mon, 19 Apr 2021
 16:03:12 +0000
From: Bram Hooimeijer <bram.hooimeijer@prodrive-technologies.com>
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Jailhouse
	<jailhouse-dev@googlegroups.com>
Subject: RE: [PATCH 1/1] x86/mem.c: Fix allocation bug
Thread-Topic: [PATCH 1/1] x86/mem.c: Fix allocation bug
Thread-Index: Adc1FaPJ8g7YWRLmT/i09VAO3wxJ3gAHE4sAAACqeQAAAARSoA==
Date: Mon, 19 Apr 2021 16:03:12 +0000
Message-ID: <AS8PR02MB666320D586D371E642EEC562B6499@AS8PR02MB6663.eurprd02.prod.outlook.com>
References: <AS8PR02MB6663B55522C63851C338E6A8B6499@AS8PR02MB6663.eurprd02.prod.outlook.com>
 <08a134a0-778b-6b78-1b24-9214ecde5f3b@oth-regensburg.de>
 <31b95b80-a2da-09cc-a6bc-a89f51bb0a1e@oth-regensburg.de>
In-Reply-To: <31b95b80-a2da-09cc-a6bc-a89f51bb0a1e@oth-regensburg.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [213.127.64.7]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 195ab659-39ff-4b91-9be3-08d9034ca243
x-ms-traffictypediagnostic: AM6PR02MB5415:
x-microsoft-antispam-prvs: <AM6PR02MB5415B12697442AA3FBDC5BC9B6499@AM6PR02MB5415.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ixE/7VKMUx+DM8lc0+QaXLAsX06b/deZBWA/jqPDgzmAaK7j9FEyC0JJaJP3zY9xpc0aK6W4ckLxooyN5UBsyT3TbLnnoa97yheZ+FgwiR6ZD8hSZcDPyXTNrdTgAsGi+QgByzEUrRzMCHua9hB1WsHIiy/lcOg3gZgOf3qkQu9pzhx6BpD728UyIJSY1CmEi2icXi3YjIprkslRrnTVS7E/Ocx6c+6429hgLTq2fWD9R7jgmSZ0+vqAXo4Kf/b+LcYstZxzvLIoFj7WMRnd3E0WOiEFp75v2NjnbmHyR0JARWmm2dPnS7y382Tk+wBg+jrFB2ec9fGGREKQlFGLYsjh+XwXFti5UnZolBFW9/Kg00ukgdpIYa84bCEr9Ot2rAOBB/UaMLmEuG7WQwwsOl+CJVQxGrwCcl79yIWnLvMQdsSn6j5WtSj4bCPNmjkM3BrWlVb3gFZ6WF0hUm6uCCJnQZ1jPZpEXhLItB5GKuVrwT6mRYa4N9pSW0lA0zRkGNacMYexNi1DqlUwNBT7kNNnQ+ZzVIr1zYSKePigrbNfsQGTqyOfwIvn0PM+23B94gfkt8ZvK8pKgFYsqNnl2yUlK5HCcaJytjjHH/0SqlI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR02MB6663.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(136003)(39840400004)(346002)(366004)(66556008)(64756008)(8936002)(66446008)(66476007)(38100700002)(110136005)(53546011)(122000001)(186003)(76116006)(66946007)(7696005)(6506007)(55016002)(2906002)(478600001)(8676002)(71200400001)(26005)(33656002)(5660300002)(316002)(44832011)(52536014)(9686003)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?TGpGRlYrOUFrb1MxUXhrOTA1KzVncFZkS0FpUVlRRWI1SFAzVEgwZDMwK2F5?=
 =?utf-8?B?RVd0Y004eDMvTUtROG1BUy9xQStXbDNoQlN3QXhQRnB3RXpqdkV1UHJWa0Ni?=
 =?utf-8?B?OXdMNWtWdkxjb2JhZUdtdTlrdEhaNFNPand2Wjd1cTZMSHpxOFV0aG5JKzlj?=
 =?utf-8?B?UW96aCsxRHZoZGJhLy9idFRmZDBBaEFpVlhvSkJjU1A1bXlVdS9aODZPOWVM?=
 =?utf-8?B?MWpZeHFVaHZIZTB1cEtVRlRPSEFycXlqNC9HSUtSenl4aDVPQ2MvKzQrTzFJ?=
 =?utf-8?B?M0UzaGg1amg5QnJPa2d3Qzd3R0xEczhVdEdRZkxJcVRGZzU2SGhTZU5CbzRB?=
 =?utf-8?B?ZWRSY0ExZDZtMVhOY3pZcjgwbDV5OHl5aFpqa1A5ZWRra0Vvcjl3NkxvMGlw?=
 =?utf-8?B?d0MwcC9pcXJmdTN0RjFUdGVFRGdTdDVCNHZGYm9iakg4c29acEllMWs4bElX?=
 =?utf-8?B?OWJqK3FQNyttcGpScXEwdjZzeVFndndIQ2tGVEVOZ2xzZEtDMUlMOFBsc0Fh?=
 =?utf-8?B?OXdCdkFnQlU1YW1PbVR0ekpzSEtpbElPRU9OUm1Pc0xXMnBzRk5zS2xQR0ZP?=
 =?utf-8?B?Z2dQU0RycmtPc3VzMWdrMWFXdG8xdCtkNHFIeTdhZnlCaVlIOTJrRUR2YkpZ?=
 =?utf-8?B?M1BwaGRvZjZIN2Q1TXBmTk16VzlyWmRXMFZ3ZHAraWVCcVA2UFQ2Z25rQmNT?=
 =?utf-8?B?TnRuaC80WURKUHBnb3pNbTVFeDVkSm9KL015dVZlQklQczRkZ1pDU0cyZUxM?=
 =?utf-8?B?K2tWWTlvNExlM2VBVnNhbXVQL29tNGtPSGhiaWc3VEtzV1RSdE5tbUZOWXNP?=
 =?utf-8?B?UVdnOWNUb1pGZ0JaTDBhZDNLVzJhdmkxZmtsWkV4K2pqL3FqVVZFc1FuWVpY?=
 =?utf-8?B?dCt0cmViMUlvUFdCVmZEVnVVRk96Sk8rNlRWaGd5TldESU0xNXJnYU0zTmNI?=
 =?utf-8?B?aVVyUkZvRmR4QVVVZC9EMkRaQUYzUXB1cTl1Yzd0RUhHTjRPbHRFRWt1VUMx?=
 =?utf-8?B?TlJxVGNNMklGam94NU5DcU42SlM2YVU3aTJmNk1LamFObC9UWFh1bVhNOFh3?=
 =?utf-8?B?d1pQVm93WUxNdnptQmczVGtGcjdpdjVpWG1UUWlNcEVYb2ZFMWlndTJXeDlu?=
 =?utf-8?B?WHQwbmlOYnZvQUJ1OU1wd1FzVStJeGx6NjZoeFVCS1Q3eUlMbGVhTFJzTUZp?=
 =?utf-8?B?ZG12dlc2UGcwR25rcW96S1ZXTnFBcnQvQWxtb3hTV2NRWEpXbVE4U3hvdDF5?=
 =?utf-8?B?cXRKeS8xZHZSWUx5cXJXOU11ZDRiZTU5SVp1eGUwTXd1VXlMQkllZXlhU2hw?=
 =?utf-8?B?ZTZNK3NOWXZNOFZweGhVbVBPZzVMcWx0cTBmbHZWTXcvMlk3TlFwYlJhK2Jp?=
 =?utf-8?B?ZzlsZHg2cERUc3FVTFJFREZBMFEyUml6Vlh1aGVieVg1ckd5cWxYTVlJTHVJ?=
 =?utf-8?B?cVRwUWl4Mi9pR1hTZUpZN2MrY1F2Z09uLzJ2dGg1NHlWdkpQVC9tbTh5T1VY?=
 =?utf-8?B?WC9sY2M1NWxydmZpQ2hWYVYrQ3NyR0xwelFsdWJRRWxteFVzRStXMm9PYWtX?=
 =?utf-8?B?bVV3U0VFcDI1cVcremlWYVJuS013bStteVBSNTNOazhiR2NqazBRVlN3SllC?=
 =?utf-8?B?Wnp2anQvNjhaRFhuYml1a0RhbHg5YmI1Smlmb0xndmdIc1BJZGQ2bG42ZStG?=
 =?utf-8?B?SllPRVFhaTdsVEJNN3c2S2ZWL0VHMGRuRUtjUHhYTUFMMUJSTklNYXpCNS81?=
 =?utf-8?Q?RbmRZVoW+IeuMfi/eQ=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: prodrive-technologies.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR02MB6663.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 195ab659-39ff-4b91-9be3-08d9034ca243
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2021 16:03:12.3835
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 612607c9-5af7-4e7f-8976-faf1ae77be60
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nlkFIDcUH3bRM5gEMLrsKTM6uBMCv3kavWxDtCzOW4Sy08w2X1cI06Y7631K5VKuHaPfPdjrYo3HWFUBoYciN+K/1XC48WLeus6kTfIfHnjmYZglRCt9UMrLLyp43PkT1t28G+v9hlOQykEaM/7aEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR02MB5415
X-Original-Sender: bram.hooimeijer@prodrive-technologies.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@prodrive-technologies.com header.s=selector1 header.b=VlMoCYFt;
       arc=pass (i=1 spf=pass spfdomain=prodrive-technologies.com dkim=pass
 dkdomain=prodrive-technologies.com dmarc=pass fromdomain=prodrive-technologies.com);
       spf=pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com
 designates 40.107.5.109 as permitted sender) smtp.mailfrom=bram.hooimeijer@prodrive-technologies.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=prodrive-technologies.com
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

>=20
> On 19/04/2021 17:37, Ralf Ramsauer wrote:
> > Hi Bram,
> >
> > On 19/04/2021 14:17, Bram Hooimeijer wrote:
> >> When creating a new page table, the table should be filled with
> >> zeroes to prevent decoding invalid entries as valid in the future.
> >> Given that in the inmate memory space no assumptions can be made on
> >> the contents of unallocated heapspace, zeroing needs to be done explic=
itly.
> >
> > Don't we already zero pages when reloading a guest? (I'm not sure)
> > IOW: Did you really experience dirty pages?
>=20
> Just cross-checked: Looks like we don't zero inmate memory on cell reload=
.
> Now I wonder why I never experienced a similar bug=E2=80=A6 But we haven'=
t many
> inmates that make excessive use of the heap.

I was just writing that I got to the same conclusion. Before sending in the=
 patch,=20
I was seriously considering what I overlooked, given that I never ran into =
this=20
before either, even when doing memory latency experiments. This occasion it=
=20
was a single MMIO address, and thus I didn't move the heap_pos to an addres=
s=20
beyond the communication region, if that might influence something. I guess=
 not,
and sheer luck is involved so far.

>=20
> >
> > Anyway, if we don't, then we should think if we should zero them. The
> > question is, if it is acceptable to leave artefacts of previously
> > running inmates in memory.
>=20
> I think we should rather implement a zalloc() wrapper around alloc(), whi=
ch
> gives us guarantees to return zeroed pages. We have some other spots in
> libinmate where we could substitute alloc/memset-sequences in libinmate, =
e.g.
> in lib/arm-common/mem.c and lib/x86/smp.c.

I would also prefer zalloc(), as memset clears the area per byte which seem=
s=20
inefficient. Though I expect the store-buffer in the CPU to combine the wri=
tes.

Actually, the alloc/memset sequence in arm-common/mem.c prevents the issue
from arising on Arm platforms, and this patch uses memset just to be consis=
tent=20
with the Arm implementation.=20

I'll send a new proposal.=20

Thanks, Bram=20

>=20
>   Ralf
>=20
> >
> > Thanks
> >   Ralf
> >
> >>
> >> Signed-off-by: Bram Hooimeijer
> >> <bram.hooimeijer@prodrive-technologies.com>
> >> ---
> >>  inmates/lib/x86/mem.c | 2 ++
> >>  1 file changed, 2 insertions(+)
> >>
> >> diff --git a/inmates/lib/x86/mem.c b/inmates/lib/x86/mem.c index
> >> 7e1c8b83..45424ea1 100644
> >> --- a/inmates/lib/x86/mem.c
> >> +++ b/inmates/lib/x86/mem.c
> >> @@ -58,6 +58,7 @@ void map_range(void *start, unsigned long size, enum
> map_type map_type)
> >>                      pt =3D (unsigned long *)(*pt_entry & PAGE_MASK);
> >>              } else {
> >>                      pt =3D alloc(PAGE_SIZE, PAGE_SIZE);
> >> +                    memset(pt, 0, PAGE_SIZE);
> >>                      *pt_entry =3D (unsigned long)pt | PAGE_DEFAULT_FL=
AGS;
> >>              }
> >>
> >> @@ -66,6 +67,7 @@ void map_range(void *start, unsigned long size, enum
> map_type map_type)
> >>                      pt =3D (unsigned long *)(*pt_entry & PAGE_MASK);
> >>              } else {
> >>                      pt =3D alloc(PAGE_SIZE, PAGE_SIZE);
> >> +                    memset(pt, 0, PAGE_SIZE);
> >>                      *pt_entry =3D (unsigned long)pt | PAGE_DEFAULT_FL=
AGS;
> >>              }
> >>
> >>
> >

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/AS8PR02MB666320D586D371E642EEC562B6499%40AS8PR02MB6663.eurprd=
02.prod.outlook.com.
