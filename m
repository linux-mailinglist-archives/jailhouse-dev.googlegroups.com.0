Return-Path: <jailhouse-dev+bncBC44VTVY2UERB5M5WKHAMGQEYLNTSPA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23f.google.com (mail-lj1-x23f.google.com [IPv6:2a00:1450:4864:20::23f])
	by mail.lfdr.de (Postfix) with ESMTPS id 583A248151F
	for <lists+jailhouse-dev@lfdr.de>; Wed, 29 Dec 2021 17:38:14 +0100 (CET)
Received: by mail-lj1-x23f.google.com with SMTP id e7-20020a05651c090700b0022d70efe931sf7487667ljq.10
        for <lists+jailhouse-dev@lfdr.de>; Wed, 29 Dec 2021 08:38:14 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1640795894; cv=pass;
        d=google.com; s=arc-20160816;
        b=JLV6bYEcELzu2Eg46G3oR6pZ6gpCLOEGh2EkHvKZm8MErxoHP7+V8S8Z+gO39KQd9s
         qQ9yL5acka4a9nOnPHS4WP06uo4UFSvUSSqKUKxAIA14pHfMDiA3tUJSe0B1dAe3qbRA
         5LUOQ0ytGEp4HM5mTgNJfHAcCWPYc3t1nnzyotftl7k3SIyjTabFgRFpCSGb537Txxu7
         lUKUXWM6XXM+nroz5bSXqWQOoEu+hLnhIB2ylz0d/NLrd0kXV8hDhkPvCZVAYFhptJ6l
         yORrUQCNO9E+WCtuya+MYugMrYkLMqyJZRtuMz5RtIrObyrjs6NozLaqlw9Ha48CbSk+
         IJVg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version
         :content-transfer-encoding:content-id:user-agent:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:sender:dkim-signature;
        bh=A12s9bDrnPn8rq4oKGJ5yGETbHVkWibWSW6Mu35cNCQ=;
        b=tshqhRZQDaQ5Z1avNEslJMsf9az75N5BDnuzGYogzYr1dfgOJHiU/fuSek2qMjgx2O
         Em2rJ02h7ywMpbnR0D9X/AEdHA7peuoGNeqDytG8lwLHYlTfekzeoI5tPirOtloSGvTL
         AP5rGzoR0/AzfQQEXMM23Q428PWFV/isQKgKL5/3KupSu6Pjb/MD+mQgb3O6kPhv5846
         XUwe+RdgxgXjypeYy3H9tkQ4ha6EeN6VRpMublfeeEwaI0saZJOmBEk9QWlwBNa7d95P
         pp9/i1ZWzLPFnTsEAN3lrXhlLn8TC5QfGyFEhR8PpHQCbLlLQvVuLk+HHrIeY+290Ygh
         L2Yw==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=mr1cPC2M;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of florian.bezdeka@siemens.com designates 40.107.20.74 as permitted sender) smtp.mailfrom=florian.bezdeka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language:user-agent
         :content-id:content-transfer-encoding:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=A12s9bDrnPn8rq4oKGJ5yGETbHVkWibWSW6Mu35cNCQ=;
        b=UKkPH35sai90JouN+hPHts+boIbnpewj3NbbzOZrK5eWLpqdEa6x+U1NtuafYTYJxv
         gi7X41V9Q+AGSZvhmi//Vot+5P05Qa+CvotlSyw7/tPq+i8YULACea/CQuRhwE7ynnls
         9IDMll7b4H4qLjpNkHds0ZBtKfjzwOll7vM8/cTdZ86Zed3zFF+gRA00avafpE8J3Vfl
         jCuQyo5jovq0hmGN6lAu+FLAXmRg5Qw1b27rUQzdthbGIYVmFOEq4sEGuG3TJI+UufXh
         Y9KM6er32fB5aVxF1YnwYO1zGGJkvkJae+kuGGtnKR8TbeQpJO4hfofA9M8DLhGJgZ/N
         G+5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:references:in-reply-to:accept-language
         :content-language:user-agent:content-id:content-transfer-encoding
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=A12s9bDrnPn8rq4oKGJ5yGETbHVkWibWSW6Mu35cNCQ=;
        b=IULgAeXIg+u+FLqJ/zl2b5kxHtfkNxl7XGUYgJH+R2tvjq99MyJcYneep3UhQxIUte
         sz1iQcoOvpLYz7C3MyhjI/PJUYnt7GqIHf8W3Acqqrbs13i85hIXEu98zbXo4I/Uip1k
         LgjHXMXeZvBB7ThsfULwLA1MdXZOJbdaO4VO8AhQMOB6ChviC+cNNG+dmV6Kmi83IW/o
         tTJ/lL66ov30qk9OgQSjtPE5w2E8MEyt6Tm937MoT/vapr2F18xTVqsh6P9vhPNZFJoG
         wVdeo0vBHa103QV85hiOdeBWq5PBZihgbSwSUaEQGf4xPh+uJKzw/nbnN6iq4M7vWLha
         cTNA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532ges8p/X6PidvvisQlNPbKuWBR+cF4jFFNg4eIx5/XUPhl+ZjO
	x8hXJ5+GSc2uaVGcPmCkBnw=
X-Google-Smtp-Source: ABdhPJyjGaiHdUYF8CKIaTksxvtzgqrY9SM/JPele885fcN5jP3FPTpom7pkdlqiJR6jd4ZUipGB5g==
X-Received: by 2002:a2e:a28e:: with SMTP id k14mr22952872lja.488.1640795893706;
        Wed, 29 Dec 2021 08:38:13 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:a0d5:: with SMTP id f21ls1318887ljm.2.gmail; Wed, 29 Dec
 2021 08:38:12 -0800 (PST)
X-Received: by 2002:a2e:96c2:: with SMTP id d2mr16434926ljj.440.1640795892778;
        Wed, 29 Dec 2021 08:38:12 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1640795892; cv=pass;
        d=google.com; s=arc-20160816;
        b=WR7Do69gY4c4E/1Oroeq7TEcbv+lNLMDD4eWTJ808e/GACQ2jPcItuJH5ghQcq6ko9
         hbvNYgjGD+u09GPWE3n+5MP1SupeX1yyiBBhO+0Z8SfwIh32YR27oPMKn0DQD8lTmQhO
         r+rNmfkzP4NqLyXcjq6hP531Ett2HuwIUwOhJyWfaI/Dc8MwmThsb9l2cAG5UAZtTiOw
         Tqbo6gstT4n/RAeOYm+C6y5mLggINRwZ92RLpV/z8KvWtcWWL2/xIenQD17dKVkKiEmk
         SzbsRl9OLcPWDG7lLRstPE3Xfi289X6hDpajtqBaqk44ckxd5Y6ezrcuuWdRpZhby4cG
         ghpg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-id:user-agent
         :content-language:accept-language:in-reply-to:references:message-id
         :date:thread-index:thread-topic:subject:to:from:dkim-signature;
        bh=dfN2ykozFSP78aA/89+6ThYKLhmrhasMbu2zGXqh3bg=;
        b=szrabAOzSxI2V9nncbG8Auj8nHSPhU6bQd/yz5AFdi62kpCGWiXmt304rh2nsH7yTO
         UEPTjVqsllIo7OVVmdRJ2xNi61ZzAvDHmoKH0SNq8kxDWudufCI4wvKP5Dp1Ug7gBhER
         B10TYK2zbtiorvDCO+z5T9PRtPigHGsciiDyXHwhtssG+jZl/v9ab0ukPGcBGN3juD1/
         +dNH7gBYrPgWiQScSusX46AaNPY3Yc8ij7IYbpND7QTQpNaXwK0PsjqCLERlko2IIYPt
         cKqKuI4bWn4rLDuJzIOHqhJIJeumBNcsdc9XXO8BwOUGDMpkegmmNtESx+5MTirmWjw9
         dcgQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=mr1cPC2M;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of florian.bezdeka@siemens.com designates 40.107.20.74 as permitted sender) smtp.mailfrom=florian.bezdeka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2074.outbound.protection.outlook.com. [40.107.20.74])
        by gmr-mx.google.com with ESMTPS id k19si1039519lfv.12.2021.12.29.08.38.12
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 29 Dec 2021 08:38:12 -0800 (PST)
Received-SPF: pass (google.com: domain of florian.bezdeka@siemens.com designates 40.107.20.74 as permitted sender) client-ip=40.107.20.74;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QOXGx3tAiiSDl9w+WRksl5uPrBQSvTz1bD90hzqa8FAlidqu/jm6ZomMBnb8VNK8UZdrGdq5kmZ8Hr/d8RcRCu6ErMq+tSlBz0N9wA/5i4XR/rwZVM3QR0xepDv3ptBGEQBw46KlISbQSC9D8FyLp9H0cGGjUnYRUizKO1MjHvkGFnK22j+y2so2n66C66JJh9bhrqu0RRG9YSNObZfeTi3fYzmEXz1F80PK0N5Fwk8yyts9wwS/IWgbTfubNQLlQbVOL0Yb2qyVwb51Ma8G8cgoKIIS7nhhzYavkz4lh6j4GS1YPvEyVWa2LhlTEB9X9tCobmTr+pp27/Yf4lxzrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dfN2ykozFSP78aA/89+6ThYKLhmrhasMbu2zGXqh3bg=;
 b=Z5suVY6+BtaMiBERWSIpQt466kK4jhIxLo6yq44j+wzoRwccCtZXkgcYYUcQxLqp1FLK9JUSu4PUdNOMl9u3JO6ZoavLSY8S00S3ttjq3ZhTIsRxpaMQhpCCSoTMuBfvpM2f5ub45iZfnm8/fGVj01pdsR+EeUVcTlpw3PHysoLcFBU/TAQ4VyCGoKxhTmcJyRIIKCHfv38TxO8Sq2K6JrPXYRcLqv9inQyRZnCY646wbpk2AsnYXYBXxwmn8g6l13pIzK3Fi3WChS70QIwuaxq7AUTNr7Usoug+fKXWKeHoX9sib6KXb3oFgjq/H6cHdS6HehXC9SEKh7UuGO79Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
Received: from AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:49::10)
 by AM0PR10MB3700.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:156::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.22; Wed, 29 Dec
 2021 16:38:11 +0000
Received: from AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::cd44:8985:dbe5:dc0]) by AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::cd44:8985:dbe5:dc0%4]) with mapi id 15.20.4823.024; Wed, 29 Dec 2021
 16:38:11 +0000
From: "Bezdeka, Florian" <florian.bezdeka@siemens.com>
To: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>,
	"huangjiajun145041@gmail.com" <huangjiajun145041@gmail.com>
Subject: Re: FATAL: Unhandled VM-Exit, reason 2
Thread-Topic: FATAL: Unhandled VM-Exit, reason 2
Thread-Index: AQHX9zll1kEOxXgNtECZVvZtiJyBGKw+juAAgAAEf4CAAANwgIAGZAmAgAFCIwCAAAQigIADbnUAgAAG6QA=
Date: Wed, 29 Dec 2021 16:38:11 +0000
Message-ID: <89194c06905f238053f114816f57f23100437bae.camel@siemens.com>
References: <AQHX9zll1kEOxXgNtECZVvZtiJyBGKw+juAAgAAEf4CAAANwgA==>
	 <AQHX9zll1kEOxXgNtECZVvZtiJyBGKw+juAA>
	 <db157b8a-dadc-440b-9385-1278ef5d7097n@googlegroups.com>
	 <64fa037aefed1d130bc0d3a49ccc3d09d5b504bc.camel@siemens.com>
	 <2be13d89-1023-411b-ba9e-1d10044824e5n@googlegroups.com>
	 <f76e76b332af3cef7a46e9048e96d6b50aa50fa0.camel@siemens.com>
	 <c7eaa08e-ae92-4c5c-a57c-7ddac379242cn@googlegroups.com>
	 <514e2fa3-9e58-5b79-038c-fe4ac21e803e@siemens.com>
	 <f25df50a-e947-002b-5528-8d9793318aa6@siemens.com>
	 <e3f8d47c-8a22-4abc-8977-e17641a404f9n@googlegroups.com>
In-Reply-To: <e3f8d47c-8a22-4abc-8977-e17641a404f9n@googlegroups.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.42.2 (3.42.2-1.fc35)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d9eb2a61-d57f-4d77-27db-08d9cae99a4d
x-ms-traffictypediagnostic: AM0PR10MB3700:EE_
x-microsoft-antispam-prvs: <AM0PR10MB3700387407A7450507661F22F6449@AM0PR10MB3700.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VsgPxioDlePrIb/aqx1RcpIQcd2wuTOUdbVYlXoZLspahOmWf66aK/z+X2VKgWVUqZyQN5ROYLPVkfXaL6fDV/3qtb5H13CvLsjfudA3OhnYH5KSoLhKlOLpf7DDBmDT6dyInSRXsxfuf+E4B0XrOK3ur8fQjavHaYad8WrPJm6mMjaSsfY6R0EdgNvXlXG9I900FD07IXdBt1FO4L/7QULonApH8wKxb47YlGW/pZBknuF7SQRlXwl6cg2v3utN8PavOPZVkOhzuhZnq7wUUIFQn1P0IzM7ubiaghluD9RAAVYEBNDXNvbLOqrRfIRG97kXkJ08s7Wt2/Ghx8Cuz7fOGp507fYUeRPvIyHS1JYvMRs6GH7/mLDh8qLyU0fqaeP+CaQ4JYyw07gUry607B7IvW6kKJ8P/DwovxLQusG/mFOV3AAv5KWA/EU2tbf3BrFGJJsLcdGsk0Fbi83977af6kG/eWV5F5wvLY54mSnqXGYqVlFgDjftvXe7ykTDrF2VKAz2hAzKy4ed76aLKMRc14qBMWbHXXvspQNhNgg3DTRucvNv3EVUBtfnlTzxiYVykqYD0s0oDqigit/dTDLiIh3uxGLI1A0dJskxe6VeSNhXyy3489j9mH/vNWthLQeZkI5wOqLSfdgu9YY4GERgphaaE5UBKhvMv3RPPTFEs9HSrZ0Ktd+XjQdxatZ+mpYn6W/YCJDeIB+nZ2yBXs1OVK5N4wB87eRcYFGu1B5LnqLsQmqpaLXFFiM6cBr31My0MWufFI2HsuHLR08zZkU0iMLAqbPlBbYCLazuh0Xw+OcgMGFrlULKSIwxnYeXjfqxCEJoNTBYjl/yBkmB/g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(38070700005)(66946007)(508600001)(6506007)(91956017)(83380400001)(2616005)(6486002)(2906002)(82960400001)(53546011)(4001150100001)(6512007)(86362001)(186003)(5660300002)(8936002)(66556008)(71200400001)(8676002)(36756003)(316002)(110136005)(66446008)(64756008)(66476007)(122000001)(966005)(38100700002)(76116006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZDhjc0pSSUxwMHpEa25JRTVpUjIya3lNWEhTWkVCSDcwTlpZdU51NkRFT3E1?=
 =?utf-8?B?bkpJNlZ4cWtQc2JLRUF6eEprNTVlREZ1THhwL2JtL2E1VEJQM2ZLRUlMZkNa?=
 =?utf-8?B?NmJIbUVoWlRMempvRi9mVlMxRjgyWXVDVlVRdnYzODJyeWo5MzEvTjB3a0Ja?=
 =?utf-8?B?L0xQbHhyQUVlR2ZKdm1RTkdPa29uR2s4eHk5TkR2V3ZZQ1Q4dU5TK3FvM2Jl?=
 =?utf-8?B?K3JLV0sySG1KZWlmVTRvVHFiQ0dvSGdSbWV2ZVhIakhRZUVrOVNsaTc3bEJt?=
 =?utf-8?B?dHUvelU4ZUg0UDViNTh4elZCS0RZR2FVZ2JYaTJCVXY4bXVrdHlhVVVTWWVy?=
 =?utf-8?B?LzNOcGlDeWEwQnpxakx0Q0NzQnd3b213ZnF6ckxlN3Q3cWlOaHdHZlp4bkFI?=
 =?utf-8?B?ZVpRS09maUpldkZOSkhDUUc3K2VnN2tvdlh0c1hwc3JwTHEyOFh3aUNHZ01O?=
 =?utf-8?B?RHRrb05EbkMvS2tiNXdnQ2RPVHQxb2ZnUXkxTEt4VmQ5Yk1WSmZMVmdsVkxh?=
 =?utf-8?B?andSS2IrMmxURCtZYXRhRU1WV2NLeW5xKys0K3NPL0JOVjFia05LeUIxd2JY?=
 =?utf-8?B?SXlGa3JXUGNNcjBCR0dzSG83VFRUYlovU2JVMGI2MVZkUGhpNi9mSnl0NGR2?=
 =?utf-8?B?eTV3N3IzMUpRS0t5UjJWZFBFY3QvdkFoQWlZa0VwZE9kbGpkT21SZGh3MVdq?=
 =?utf-8?B?L3dNQzlOY1FqMVJOM2t6WGt4RlRNdCtlMGc4QzlScjBKMUQydHRWYVl3OGwv?=
 =?utf-8?B?ZFFBYlpseFl6UXJtTzZlRkJGTzdycTBwMGNuWXE5d2NHOHFEK0F3SytsTkRx?=
 =?utf-8?B?TE1VNzA2c1NhdUdqd3YxcG9zNzFMZEludmRNUVI3ZkJCakpvUFNDcG1GcS9T?=
 =?utf-8?B?VmFON1l0QndjclRqeG00eExka0g4RmFLbUZSN1BpenJteE5lSkp5Q2JUbXc3?=
 =?utf-8?B?TzlzbXZCbTl1dFcyV2crOUNwSGdKYUtVeHgrSE03VUY1VnZ1Y0MrNlBLSVQz?=
 =?utf-8?B?WkZuc1h6SjFRYTdBQS9UbW9VcllDYTRhUE9TczdhUmhWQmZPM25ZblBGVW1Q?=
 =?utf-8?B?cnlMeU42U2xucFNMQU9mQ2tuR2JBaCswV2Y1eHFpQUpyZ1dWOVY3TFo1S2Z2?=
 =?utf-8?B?R0k5SlBCdU5RVVczeTFlaiszK3F3T0k4WkJwUGRvb1ZCQk4vZmc2YVJyYUJH?=
 =?utf-8?B?Zmg2RDhZWm5VWWU3QUJJcHJmQTJmQ3gzakFSYUYzSlNSSVlBTGNleXAyMzdY?=
 =?utf-8?B?R2JCQkhDVzN4dk9QNzJPZzYzVEViMENYVzU4VlFqY2x5SHY0TStpQ3hVRGpC?=
 =?utf-8?B?N2Q0Yld1b3pSS3dpR2dFM2FWdU5HZEF4OU5Ma1EwaGxvUmtpNXlPVXpjd0pP?=
 =?utf-8?B?UVowM1Q2M1NYcGpnOFJJanRvL2dUZUpHanpJNUtkZitRSlN3dnBjK1N3SFc0?=
 =?utf-8?B?d3FjdFdIa3RDS28xQklPeW1xcHY2Z1h2RTRpSlBJcVJGM1l2UmRlb0pzZ0tU?=
 =?utf-8?B?VTlXRXNYTkFOYWc3MytyUEpEenlVREtWVlVoSmJpbjlWZWNLSVB4dUR0NW81?=
 =?utf-8?B?TUVNOXMrOE9RdXJaZTdSY291UTFXejNvdy9ja3Y0SXZrS2lubWNyb3p1Zmgx?=
 =?utf-8?B?WjU5WC8wQTRaVXZNeTBvYlUweTgvMFM0eXpQRzZYZ2hRWGlpN3hKVFdXTGRH?=
 =?utf-8?B?ajI3RXJmdTM3MVpINVRyZTEraGtidGo1TkhKSkplcmNOKzAzbVJqdDdRT0pi?=
 =?utf-8?B?NWFHSjBVNlZNMGhnL29QQStrSmQ3UnBIZ3ZoekZVbjF4ZjhQL3JLaXR0a3ZC?=
 =?utf-8?B?TXZvWmZLaTBPQVo0U0N2UXovekVrTmp4c01HZE9NSGtyKzBNbWp0WkhMS1Yz?=
 =?utf-8?B?emVsS0MrU3RGUmkwN0E5cmpHaHo2eGVEeWJvMGZBdjJ6d0VWd0MyUThzR2Fm?=
 =?utf-8?B?QmlZem5obmRDVFRjbGJsY3NlR0tWR1VIYWpQMk5PdUlZTFU0QS90a293U05S?=
 =?utf-8?B?SG1FczZwUkFZSWI3eFBXcExyS2RkWDVhQk95djd5ZUZqazV5a1c1SHB4cWtU?=
 =?utf-8?B?UjR0ZTlqYmkyRlZ6MHJZdXU5Z2xkUXkwc1NERmdheEVzRjU2WnkxU3I4YXRx?=
 =?utf-8?B?NGJNS3NUYUpSaFZvRG9ET0FRVTFSZitBdFFFK202Umw3SlNwV2w4SE5KRnB5?=
 =?utf-8?B?VEF4RzArbDNHYnJJVjJuWlI5UDhQbVJlQWZyaER1NFhPOElOV3BUQ08zOHM0?=
 =?utf-8?B?aXJJS1dkS2FmcXQ2RVZiL21hdXlNOGpZVzQzai84QkZiMEFsdEdYOTVvVmpK?=
 =?utf-8?B?UkQ4NVAyRmMwY3RzeVZJODA4clN0cER5YzZYS2hsRTZJb2NHazQ3WW5kWWpP?=
 =?utf-8?Q?TrT52BUBZmX0pAik=3D?=
Content-Type: text/plain; charset="UTF-8"
Content-ID: <0FC2A173CAAFEC459D084FE30999062F@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d9eb2a61-d57f-4d77-27db-08d9cae99a4d
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Dec 2021 16:38:11.3480
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t6p+d7BfHYesT8wycfUkDQJih2utHvYWeDG/5hZJimKTtFfzrAR15hnDKnhG36p9GYZ/XwjrcGbik1eEZ6UTu4XazHVuCLBtNVDevXvjEbM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3700
X-Original-Sender: florian.bezdeka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=selector2 header.b=mr1cPC2M;       arc=pass
 (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass
 fromdomain=siemens.com);       spf=pass (google.com: domain of
 florian.bezdeka@siemens.com designates 40.107.20.74 as permitted sender)
 smtp.mailfrom=florian.bezdeka@siemens.com;       dmarc=pass (p=NONE sp=NONE
 dis=NONE) header.from=siemens.com
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

On Wed, 2021-12-29 at 08:13 -0800, jiajun huang wrote:
> Hi,
> Unfortunately, after I tried almost all methods, the network still
> cannot be connected. But I can be sure that the ivshmem-net device
> did not receive the interrupt, but the shadow device that also uses
> the ivshmem interface can receive the interrupt normally, and the
> state change of another virtual device is detected.
> I want to know if this is due to the kernel version. Are there any
> kernel branches that you maintain yourself?

Seems I overlooked your linux-net-driver.c. Where does that come from?
I'm normally using Linux from [1] or [2].

[1] https://github.com/siemens/linux/tree/jailhouse-enabling/5.10
[2] https://github.com/siemens/linux/tree/jailhouse-enabling/5.10-rt

I would expect build failures if there is none of the jailhouse-
enabling branches in use, but that might have changed.

Regards,
Florian

> Best wish
> =E5=9C=A82021=E5=B9=B412=E6=9C=8827=E6=97=A5=E6=98=9F=E6=9C=9F=E4=B8=80 U=
TC+8 19:49:29<Florian Bezdeka> =E5=86=99=E9=81=93=EF=BC=9A
> > On 27.12.21 12:34, Florian Bezdeka wrote:
> > > On 26.12.21 17:21, jiajun huang wrote:
> > > > Happy New Year=EF=BC=8C
> > > >=20
> > > > I successfully created root cell and inmate cell on QEMU, and
> > > > nuttx
> > > > running in the inmate cell. At the same time, I added the
> > > > ivshmem-net
> > > > device to the root cell and the intimate cell, and loaded the
> > > > NIC
> > > > driver. Finally, I configured ip 172.16.0.1 and 172.16.0.2 for
> > > > the
> > > > network card. But when I execute ping 172.16.0.2 in the root
> > > > cell, the
> > > > error "From 172.16.0.1 icmp_seq=3D1 Destination Host Unreachable"
> > > > appears.
> > > > The attachment is the driver I used in linux and nuttx
> > > > respectively.The
> > > > network driver uses the virtio interface.=C2=A0I tried to log in th=
e
> > > > driver,
> > > > but I found that the control flow did not enter
> > > > ndo_start_xmit().
> > >=20
> > > Looking at the hypervisor logs, it seems that the memory
> > > configuration
> > > of your virtual interfaces is correct now. The shared memory
> > > between the
> > > cells is detected, the device probing seems successful.
> > >=20
> > > I guess you don't receive interrupts for your virtual devices.
> > > Could you
> > > verify that by looking into /proc/interrupts?
> > >=20
> > > Are we still running on qemu? All your devices have .iommu =3D 0
> > > set, but
> > > the .irqchip configuration looks different (root cell as well as
> > > inmate)
> > > compared to the qemu example that we have.
> > >=20
> >=20
> > As you have configured MSI-X interrupts for the virtual devices,
> > the
> > documentation says:
> >=20
> > You may also need to set the iommu field to match the IOMMU unit
> > that
> > the guest expects based on the bdf value. Try 1 if MSI-X interrupts
> > do
> > not make it when using 0.
> >=20
> > Just give it a try...

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/89194c06905f238053f114816f57f23100437bae.camel%40siemens.com.
