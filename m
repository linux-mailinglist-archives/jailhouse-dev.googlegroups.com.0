Return-Path: <jailhouse-dev+bncBC44VTVY2UERBIOIZSGQMGQEMD3M63Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13a.google.com (mail-lf1-x13a.google.com [IPv6:2a00:1450:4864:20::13a])
	by mail.lfdr.de (Postfix) with ESMTPS id 884A446FE41
	for <lists+jailhouse-dev@lfdr.de>; Fri, 10 Dec 2021 10:55:46 +0100 (CET)
Received: by mail-lf1-x13a.google.com with SMTP id w11-20020a05651234cb00b0041f93ca5812sf1949004lfr.21
        for <lists+jailhouse-dev@lfdr.de>; Fri, 10 Dec 2021 01:55:46 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1639130146; cv=pass;
        d=google.com; s=arc-20160816;
        b=NwIOWq3YlcdL7UXjGzMoUQMtJT1o5TuT0tllzVZ7tKoQf2/5px/xXUoPxmNDxrFMAw
         WJw7CUZUMMl8WK5ekVk+M6EIv71gof2bjMTFSZWyz/FcP6HiCW/bblEn8/R7YT77u7MV
         v17OMkURQnKtE3CvLseTILlFgdG5MxpjzsGuZc7D34VRdwmXxyja6q6gps12raKx9NXX
         IK40yFp7A6gbrGtEAp7TDagGX827OMmSN6ufqPOF0lICNV/C4RrSrZbVwq0oCQOLNGpW
         KU2nJzwRBjAp4zlNL3FLPqiljxSL3I8h+1k769xVwKDc6coNKQrfOfTBETzLV7QD2IsX
         ejhA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-id:user-agent
         :content-language:accept-language:in-reply-to:references:message-id
         :date:thread-index:thread-topic:subject:to:from:sender
         :dkim-signature;
        bh=O2nZ0lrQ/1LedJX0GKUmvG44tcvXz+pSSK2vUV2Rd2Q=;
        b=iIx8P7mf28aswjqP6xzmccclxzGlq5BZ6M52BXkPcKDq59otQUyuPRR+fFbZgDVP+T
         eihaAOdufkZ5dBDgw40q2qc2QgCI53CH4FMSCBqZz0cWWriCiyK4ovL8fY4MmtoIPH7N
         ZyRdDDLzuU0jWV/UAKc5SezXhQ+N2W2jE+2O5alZu26NS61y+pdH0KA9m30zG7jar9bF
         7Mp3WpUu1CLGS2V2fFtgrto6d485jc8TqgJZmRvHKBIHyDXLast83ojeHxxSAvM/ZMNb
         crEtya+N82jYYEF2urS2gN0pzllMs6yOwXqRHeb/X9A4b7uXbr1p/LQZj0IQf32A0y6B
         hyWQ==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=bkPT+Pl0;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of florian.bezdeka@siemens.com designates 40.107.7.40 as permitted sender) smtp.mailfrom=florian.bezdeka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language:user-agent
         :content-id:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=O2nZ0lrQ/1LedJX0GKUmvG44tcvXz+pSSK2vUV2Rd2Q=;
        b=RzeBQQByIdKN07rl3x4IEY+FOFhphxBlCO2XqdYjAjJFUu7JIYTS2011LcitPPnKsJ
         mXbpguC0w+hlsfpy1MxoBdkzHxlmXNbStdBvwS2A+o2KUR5EmiQOc404BVO8sc57BsZW
         CNNCADHJ0Sx9/5jo9+nBnXRpw6Nt46Gfg4eeBih/Eia2PKcdxQE06XvApmGPaqhDRkD4
         eK0dBoJDAjvjPX9Y5Yz214lW4GgJ6ypCKI+hX/ceYqww+GCRxxxAEaY6UBnU1kYDoFm0
         FILUKX7UT16DXt6MYzx2VwdGFHFGDiFR3wGgq2A8u9wc+CF+ntMjBqp5bBUo8qsk5T4w
         be8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:references:in-reply-to:accept-language
         :content-language:user-agent:content-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=O2nZ0lrQ/1LedJX0GKUmvG44tcvXz+pSSK2vUV2Rd2Q=;
        b=fMk2ANM4O/4cn1gQS8K9JVL/UiNvoQdqgf1PradI95llPbIhjhDPylzyVTJ/4OxqUM
         0GmsuGWM564GoE8L5L+spg8APgzJ7x2daMG78FRdkujxnBcvQYxtPjoUeA/OqAnSKFFZ
         t7SRGAMT8dsUBI1kWjQhYFb8vuD/PK3hq2PO4b7FikIuowtF6rYvU6AzcbNt4Esq8ZvW
         1k5QtcSCywPCNwYyFJPav2yzyspvyX2a9jmn/qskZj1DW7NFMZM1HmYcWShCPBf3JIla
         ryN23LM2qNXxjD9vrwIYePfXPx8uAi/8LJmGbT/tkJfxqivb//tMRQZkxxcMZ3ox2VKM
         DWQw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531AP26PRcb0oYtAoFVn/IGFtyyp2BvjFIjEArRXqEdWX2YRlZZ4
	Crv8gHYj4nHorSm1vsC9NA4=
X-Google-Smtp-Source: ABdhPJwy/R+9lmUGSjV10S1Zq8A9LLcmtdz1EZFDEnBqOVKT+kybZZAavkXzlbOzAcA6W8H2bBZ8VQ==
X-Received: by 2002:a19:f603:: with SMTP id x3mr11460790lfe.222.1639130145969;
        Fri, 10 Dec 2021 01:55:45 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:1320:: with SMTP id x32ls246166lfu.2.gmail; Fri, 10
 Dec 2021 01:55:45 -0800 (PST)
X-Received: by 2002:ac2:5316:: with SMTP id c22mr1354991lfh.477.1639130144998;
        Fri, 10 Dec 2021 01:55:44 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1639130144; cv=pass;
        d=google.com; s=arc-20160816;
        b=wwV1ucshjjT5DvJLSogzVGfvlxogFLalqbcAFdWkj8d9E/OyZlqiRaBUyZUWzB2SZT
         wtLxYGOs+xocEL0WasaLW5N6u8XOsTHe7p2mkQfF3pjRuw+X36h7nIJgt4kcZeohTSSR
         oOf3ZaKE3pDUX7NPGztJRFC78R7x6cKClBLKU4aSICeWMq6/kp0LU9tgU07ZN6CPEYoL
         jMW4gVgNTV3csi/eooD0LyaLAQW0TDJTeY32kzy/0DSPSQPqmIWlKXl07125H2ap6DdC
         B22Da1c640Ln2jn9LXCwzhMS8mtosSfh5I9cGYXtzqtbrRurw8ATnr06q73HwuSkZHst
         mIug==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-id:user-agent
         :content-language:accept-language:in-reply-to:references:message-id
         :date:thread-index:thread-topic:subject:to:from:dkim-signature;
        bh=SFW4Y7ATth543kFzB7L5arq5fHiyJ7VBvAf+NFCC4gI=;
        b=WDe4TMJGJy4zAA7Y6IvhOAMzYA+EDLi5ru4ih/0Tv+9MGsJY5qYRA86a3YFa2dwhTh
         Ex3wOamMa+9+qjo+hdK5S0GzOJ7SwGBue8OjORWzvoOzPonVP4icfw2aJqOa5Q0rVjW6
         gk3AHiNcwO5AuzDZ3/eO6KliCuknfwBKjhvOyM/aAQi7hmeuYEAlXM6839n4IWom+9Ai
         IHKbxqVuCVl1UHe0wqOJIbne6RGDxorMS/r6CwbRbiHlfT7gu+q1yeI7S+zaBtrs8hRY
         Cj235WjlD/qVO3DLzEfPB0DinTTYCbIm5l01c7pv1j9h9Xx7Jbm3Jya92RbLG2u/Owrp
         I73w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=bkPT+Pl0;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of florian.bezdeka@siemens.com designates 40.107.7.40 as permitted sender) smtp.mailfrom=florian.bezdeka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-eopbgr70040.outbound.protection.outlook.com. [40.107.7.40])
        by gmr-mx.google.com with ESMTPS id d8si144677lfv.13.2021.12.10.01.55.44
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 10 Dec 2021 01:55:44 -0800 (PST)
Received-SPF: pass (google.com: domain of florian.bezdeka@siemens.com designates 40.107.7.40 as permitted sender) client-ip=40.107.7.40;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KdG7uenTc9MTPM9uDxDCtyGSFLoCtOTTR6P9qJnJwZGie2SSsFXZSJLSJxWwhYDPLLL3E3AKTYQtHwIQPY70CPKuFDqHyG8AU6W8sMWgLtJNlyBwM40XWita5tTo8GPJGauuo9+qmim4i6A3X31wbwFaK0SAoSwvWgPZ8+7FtY83gs9bN6PugbpZ3uNOiz0TQQytdE3w/rcxcpkRBSBjsahD0hXVOiW6N89rbmHHQvI+Vy0ySivkSnP6TKLbiucLu9mWbqpD9Jl8v1YBhVg+Pe6u7z2Ip4Seh7hqqI3tCXX5TtQjHsCP04J3lJV60fEEYI8DRKFm8mIGVVAeaNHL5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SFW4Y7ATth543kFzB7L5arq5fHiyJ7VBvAf+NFCC4gI=;
 b=bE2n0t3LPVwyXzZryQzdnLFgc5JODA/ae5HNqv5+wQlfZJR2VpIIWN220VA2lFQeGJyZ8SPasmLrqk/KQp6J/70Kt0U6w47SEG594dDb7zf3KvRsLuMBvqNK6yHlHwcfpRHmaHM0eNixw+BlvCYUS3xX66UaA/fiH7wUPCYnXE+bvuM0UCHMjyC2EyxL5cqFcO0xnZoa8wDzkst5JNTjLMr6LLSmKxytxpODiMQ/lo4h/2heT8+Vz8dNaV8nOIWq2VoTPRH8Iu8wEVWabnJOOK8DLlXcB0JkZb3dwuaP1FUUbrFbW7knVpmleCFEwlMHsOvp/ibQsWdmhoMVQZHqPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
Received: from AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:49::10)
 by AM0PR10MB2401.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:db::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.20; Fri, 10 Dec
 2021 09:55:43 +0000
Received: from AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::1be:f6bc:5764:7fbf]) by AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::1be:f6bc:5764:7fbf%6]) with mapi id 15.20.4755.026; Fri, 10 Dec 2021
 09:55:43 +0000
From: "Bezdeka, Florian" <florian.bezdeka@siemens.com>
To: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>,
	"mustafa13e09940@gmail.com" <mustafa13e09940@gmail.com>
Subject: Re: NAT bridge
Thread-Topic: NAT bridge
Thread-Index: AQHX7au/vU9SnFS39E6o6OuxlJ1X2KwrfNgA
Date: Fri, 10 Dec 2021 09:55:43 +0000
Message-ID: <7c009dfd324b083434cc24fb828dbe8d73fe022b.camel@siemens.com>
References: <0e3feaf8-c623-4ba6-8925-e648c946f148n@googlegroups.com>
In-Reply-To: <0e3feaf8-c623-4ba6-8925-e648c946f148n@googlegroups.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.42.1 (3.42.1-1.fc35)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 637ec955-8dc8-4e58-c35e-08d9bbc33b59
x-ms-traffictypediagnostic: AM0PR10MB2401:EE_
x-microsoft-antispam-prvs: <AM0PR10MB2401DCB44843CE9BD644A96BF6719@AM0PR10MB2401.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EfOY8a2h9t0WLZQwgEJTWKn8JtLn0URbPVWTvKTvQOBSVdDbBxqmDQJBHmC3uMld078qrWE9FGYoBP0Pk6Ah/cxdx+uY3aBuMbcg5Aiuzt4rFi4SHsc/mDNPEfBJKhsocCbo84WA9FOlxTudqgebS0SEfGhcpvB7Lq/UI1l4nUxR6oxk4kJre3F5AewlQ+o9eZVE8EPQzqy3OrirMv8IiMB0W41YPF/9JPHm/DSEsUWV1/Hj8R3/98j/OCipz4mNf87x/RuJ8N6DqcXQqL+DYgDd9zm3YW2x+uVRyx89htpU5gky5QiUaGiWm1ALdz9CU5tmJgT1n4TmzQkKSToN8ErAJea6y8g9ToeZtGQNvrUeqGKthhDZV1I6AdLSiFrf/87zZg7sg/KWqxhkt3fWdziyUmsHtm2vh95FGvSS4+iBWNgGrumc+nbNu7vVzhRoTt9RIegishmnu6kEVpoCVXP6a6XcIKpQC40YwtGwEVZV+EZOtGF2r7BJ6a0a9dBUMqp+0ggE/fHxXW6IaKTi82/H5mkNoX0XXL/JZN4COOxY5TNZ88DSK9n/KxlgMEcOTYDs7HA5lGThWmuMS0ak34hoGxKlIMysa80aDrV9mYHXbTFglnF6wtX88aETQy4jyhxrkFnujPJAnQ8zIqXeBYT9FR41p9rAXU2R8E4aP9LmSoRWZaoHvjHGQpkXNKLWMbZhkpOa5ec31c4Rm8UAXA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(83380400001)(66556008)(76116006)(86362001)(186003)(38070700005)(64756008)(3480700007)(66446008)(8936002)(122000001)(66946007)(8676002)(36756003)(91956017)(5660300002)(38100700002)(66476007)(4001150100001)(4744005)(7116003)(82960400001)(316002)(6486002)(6512007)(6506007)(508600001)(2906002)(2616005)(110136005)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?alVsdDFpV3RBTGZLakNXbHdYTGY2K3hGSWZ1TWI2T2F4MDlSMkFZZ3FNcDhI?=
 =?utf-8?B?YkMrVWpWN1dVQlI4KzBtMVlzblFMaVdnN1NyemlKUFdwaU5HWWZMZDRPRVFz?=
 =?utf-8?B?UlB6RFh5YXpjSzRBWjgvOEdmaUIxSTRYTWZ4ZVNaZ1VtQnU5aWcvWGd5VFFt?=
 =?utf-8?B?eHkzT2RMam9nWWlHc09KcmJ0WnZQR2ppU09uN1hTaVZWNVAxVEVsMDRZZ0w3?=
 =?utf-8?B?UkFBZU0vbzZlaXVtZlhNTU82S01QY0g4SXhrampWRXR0MmFDT09xN1ZGK1V0?=
 =?utf-8?B?THpBczN6ZFQyTUtCUHA4Q1EvdFZxSTNhVUhadHcwcnR6eDNINEs1akg1Y0tV?=
 =?utf-8?B?Q1owSGdhVXh5cThITStHem9WRUZxZ2pLRG8rc0R5OW9HbFNNTGVWQnRHaXdV?=
 =?utf-8?B?MmFXUHcxZXRMNkd4UW1mMGxtWjI2cjdJQVpXdU9YZ1VvY09yeGdhMWd3N3Z4?=
 =?utf-8?B?eXZrR3BUZmZ5UE5lTlBNbUtNNjNNb3VacVlRa0g5MmVJK0ZsYjRuTm5KZFBq?=
 =?utf-8?B?SGNCaTFLeThxRFhicE9BKzBnd3hSZVZESXFqclBUdEFNb3doN3U0MUxyazg5?=
 =?utf-8?B?RTNMQjdkNjA3WjZESHNZdVgyWGoxUjEzdkdZRmlWSUNheURHSnMvQ2VlNHhY?=
 =?utf-8?B?NUJGV2gvTTJCdk1oVUlSOCtVOW14ZllPVzdoT0JhQVFQbEFOSTExaDUrZmlM?=
 =?utf-8?B?V2JhTEg3dUt3Mi80RklQUE9CL28wS3RxMFBORTgwM04va2tnWFgvMW1mdXcw?=
 =?utf-8?B?QUFuRjFreThRSjZ6eDhxd1JNY0drRGhPL29QN3ltcFkvV216cW1sUEIyZmVa?=
 =?utf-8?B?ejdKUFRPQ3crZ1o1K0dibkxDWkg5SVNKL2doakgzY3haZnBTWGFBcFNoWDdj?=
 =?utf-8?B?eThIQThuaUcwZW82NXI4RlNQZjdkTFZnQzYrN055dDBIeWNoOTZJZTdTUGlE?=
 =?utf-8?B?eXVqZGc3S1ZRN2F2RWxqSG9meXlFcGI3MzdVOVVVZ0UwRVZ1WVk0cEN2ZkxF?=
 =?utf-8?B?YWxlSkNaTkpXQ0MzS01EZHBGWDNiTFQ5VEpzeXNuUXNDdjdMbW1ZNk9mcGh3?=
 =?utf-8?B?dTJ6S1VhUWdWa1l0U2NpTFBBMmNwMXBtc3dqVllSaElsZS83aStQVGtkVkZI?=
 =?utf-8?B?TlZxNkVQVHVXbmtKSnNFWi80VGRLVWRuT2REZ3lVcGtMZHRKcmJtdXowS3ZW?=
 =?utf-8?B?TnFFZFFHMStOSVIxYVBTK2xxWXpCbDlDeGpmbWpKNjVqYi9RV3FncStQNUxr?=
 =?utf-8?B?NTBNb3pxTzdPY0wvbXVaWW5GVVhORjQyYk1Rd0ZiZ1VFZWdMRlQxSjNweHgz?=
 =?utf-8?B?T1R4elVOczI5ZnFUVjd3T3hSREhyV2pia0pIMXpVREhEeStmRTQvaVRLYkZn?=
 =?utf-8?B?NHIwckZhTVZPVFRzRytQZ1Z4RUp6Z2FWSzRRVUVzbEdaUUwyOHlMc0tPZUor?=
 =?utf-8?B?d3EwVWFnTG03SXljdjJFbDdkUTcxN2RHNmh4YlIyNzFqSFUyMU84a3V5VjlH?=
 =?utf-8?B?WlRMVTR1eVh2Uml5ZjBoVmZsZHF4U1BkaU5RRGREUE1RdXVYaG1vVWUyVkZ0?=
 =?utf-8?B?SXhyWE14Wmt4UDZOeVJLeERYaUY3VXgwczlwMkliT29XQzBnWTZtVFNXNEps?=
 =?utf-8?B?VXVpL1RpdXA0WmxlMXZmOHZWRmc2R0xuWC9ram1ISU84eXpMVktEVGZkSm9C?=
 =?utf-8?B?d0d0VTNDbHNyRENUR21WR1VnUmd5RktBRy9hcWVtbVBIMUF2WDJ5OTRrTFVk?=
 =?utf-8?B?TStaenFRZUhOVXBGRHdVbzRBQllHZEhQZ2ZXbS9sSW50L0JiT2hCUUpSNitI?=
 =?utf-8?B?aGUwaUZiTTVBVUZoKzQvSTUzMU8vbkJZUFJHWXFXd1FCUXpnYytoUjhMVXht?=
 =?utf-8?B?bnM5SElzMGI0eGpmQjRVUEtwNk1GWXR1b3lHQ1FPTHI1WTJ4RHJEYm9CNHNN?=
 =?utf-8?B?Ykg4ZG1IVlRzRzBObXg5N2xZZllRRFd1YWsvUElrTkJNcVEyZGR5bFhSdjZE?=
 =?utf-8?B?RzFYSk9Qc2pHVHhXZjFEbGRPOXdubUFwdUYySmt2d1l2ZHVCYnQrWityQklY?=
 =?utf-8?B?cHJFek51SW5oYTZuaTFwa0lYdHBFd3BuUUJwVFU0S1AyOVBxZzA3RVpESGFu?=
 =?utf-8?B?Nlc4bXV2OGpzSUhVdDJFTjZVZG9JUHZydTFDcE9wSVdxNGp4M0g3T3VlaW03?=
 =?utf-8?B?UXRmNHJxL1NWSkZsQmJlbmlSa0RPU29LUlRzZ1QzWGQxYUc3akNMWWhvb2V4?=
 =?utf-8?B?UkFoN0hDVk4ybWMybnhmMDNBVmJKMlAwakZSWDh6ekVxUFI1bnQwRjQ2aHE4?=
 =?utf-8?B?bm5QcVJWbG1IajUxMWQzQTlHYjMvNUlqenkyVE4va3JpUzJsTktidWtjY3J6?=
 =?utf-8?Q?OtQZy1FP4ggN4sb0=3D?=
Content-Type: text/plain; charset="UTF-8"
Content-ID: <A92B1E72BA535F4994755D6807A4085E@EURPRD10.PROD.OUTLOOK.COM>
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 637ec955-8dc8-4e58-c35e-08d9bbc33b59
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2021 09:55:43.7161
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tjugG4UX6ZEUXJoOqUkdWv235qp9+PKukcBAeceorOFfo4B0Cmurgpiiy+WzT1GoRJjbrOrmaZM2Y0YoWj4yeT+cxE60+oIm6GbxrQf89fg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB2401
X-Original-Sender: florian.bezdeka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=selector2 header.b=bkPT+Pl0;       arc=pass
 (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass
 fromdomain=siemens.com);       spf=pass (google.com: domain of
 florian.bezdeka@siemens.com designates 40.107.7.40 as permitted sender)
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

On Fri, 2021-12-10 at 01:53 -0800, Moustafa Nofal wrote:
> Hello, 
> I am using the latest jailhouse-image for Raspberry Pi4(RT version).
> I
> am trying to create a bridge between wlan0 and jailhouse NIC, I
> learnt
> that the Ethernet eth0 is used as physical jailhouse NIC. So, 
> 1- Edited defconfig
> CONFIG_IP_NF_IPTABLES=y 
> CONFIG_BRIDGE=Y

Sounds like CONFIG_IP_NF_NAT is missing. Just a guess...

> 
> 2- installed dhcpcd5, dnsmasq and iptables.
> 3- I always get this error, while using iptables:
> can't initialize iptables table `nat': Table does not exist (do you
> need to insmod?) Perhaps iptables or your kernel needs to be
> upgraded.
> 
> I understand that this is not Jailhouse specific, but I tried the
> same way in a different kernel image and it was working fine.
> 
> Regards, 
> Moustafa Noufale

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/7c009dfd324b083434cc24fb828dbe8d73fe022b.camel%40siemens.com.
