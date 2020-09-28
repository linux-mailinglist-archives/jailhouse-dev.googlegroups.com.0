Return-Path: <jailhouse-dev+bncBDJ7ZUWTT4DBBRVVZD5QKGQEOUTQHUY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x137.google.com (mail-lf1-x137.google.com [IPv6:2a00:1450:4864:20::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD5027B2EE
	for <lists+jailhouse-dev@lfdr.de>; Mon, 28 Sep 2020 19:17:59 +0200 (CEST)
Received: by mail-lf1-x137.google.com with SMTP id 23sf2194564lfy.15
        for <lists+jailhouse-dev@lfdr.de>; Mon, 28 Sep 2020 10:17:59 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1601313479; cv=pass;
        d=google.com; s=arc-20160816;
        b=NNlLLTiqyoJq3d844ZfUNUosrcIKXd9QvJVxgx6AWRHPAOBsX3DdNCbhJPohV39wlo
         cKFBPcbcoVMRp5IAztwpgemSYDvh9wS5gSvZYy7xtCZzU+4v7bZXP4y9ogv1xsr8zzFe
         qa4GHj8sVpRudmLYAdgTe1hYmowrIm0mwXa17Wogt/0bo0Z/qA61/L0PvXtuZd/NfrYI
         jawtZHyUtXfXJL8sJoDOhvYdv6AJ+9x0q96rl5zdjUokcHXtjCdtv9lu4gtTAGpyqqcK
         4qvPznzFA7bCBMFCq++1o8saVjyBd2UvAeyBmQbvZ5tr9GUhC5JSpqYZBomlhWoHS8uQ
         /9rg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:original-authentication-results
         :mime-version:content-transfer-encoding:content-id:nodisclaimer
         :user-agent:content-language:accept-language:in-reply-to:references
         :message-id:date:thread-index:thread-topic:subject:cc:to:from:sender
         :dkim-signature;
        bh=4qQMDQrSyS+AVFtQ+Lrc0mHKG+l+6l3NQExKPrp1VOc=;
        b=AO/2YeqgoHGivGgETdJjcLjmqXYTn9u0fwcGv3N6+TuNpUwm8FFaE2WAprwpM8YPLO
         ZBRx1E+pIKHVa507N/ybF9x++9EIBNYHqR5HJTg7GhlI2Z+moMDyYI08fUwQ4eMWWC4n
         fAkuC6i4tAWksLUHo3LxrdLUX7wWDeXDZnSFkpE0kRJwn3eaImg2iOhMoOUHGbEiv8Sv
         krMdcPWgJPFhW0IcyZ+TN2OdRMMmBxZJqLVPMevba8ST4klDyOZdUOqYylueaJcGc3lo
         Tz/1SBwISG9cuTXknYeX3AiosYke38wyH1SVKLZCy2Xi7UgMuHUt+m43u48z6SYKU8xE
         9Jzw==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=5XRuB1M8;
       dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=5XRuB1M8;
       arc=pass (i=1 spf=pass spfdomain=arm.com dkim=pass dkdomain=arm.com dmarc=pass fromdomain=arm.com);
       spf=pass (google.com: domain of chase.conklin@arm.com designates 40.107.13.87 as permitted sender) smtp.mailfrom=Chase.Conklin@arm.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language:user-agent
         :nodisclaimer:content-id:content-transfer-encoding:mime-version
         :original-authentication-results:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=4qQMDQrSyS+AVFtQ+Lrc0mHKG+l+6l3NQExKPrp1VOc=;
        b=iMX2VrWnBFBPdKJ891U0+hHihgEfb1eaN6hs9EjlBlz8xjOJKGzbjWZElsArzfXPzJ
         tXKeaM/bWQBtGR6cWS/hozbs1iYb1BlG7jNGBGc581mmx4h51mGYW3oUEBNZvlNh2Kho
         aJdfOPoYlBFrm7A2YMi0cARgeJyCb2JS2fALnZo+ulAc4e8lelsIONJ52rFtOogONi1F
         iizL2yHLpi4D6rYqlsqOfxDDz7CVD97nUEj7wXx+kWrmJfIuGI/2dVNDb8v0a868zDhY
         TPWZJ6M7/tY4AooEjyKg5zKtNI+PpWY04vqVMCgqnHr1bO9iNTenFqqV9qJRaIRPjtE+
         9VAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:thread-topic
         :thread-index:date:message-id:references:in-reply-to:accept-language
         :content-language:user-agent:nodisclaimer:content-id
         :content-transfer-encoding:mime-version
         :original-authentication-results:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=4qQMDQrSyS+AVFtQ+Lrc0mHKG+l+6l3NQExKPrp1VOc=;
        b=pXNF0oF3rOcxdtVPV4njcg5QqHFG6rwGTNM4eQFgsZcS6vl5C2wtNGM/p8l3zvQNwE
         ffhTh+wHPHbM1zuhX9DDK7ZRHkxUpZPMA1R75C9REkxvuX3Da5spKNyR4cXqyJXlqkUy
         VZAZBB2Kz93B3rFck7FaBNXT47YlD1ITLBlzQQ8/16L675oafcQc1ad1TNGg8nctTVvY
         /x6nHqudrLslPVGqRPSeIujkYPc48LVb/0o+HSzbM+ujCP1jM0zvIF/BfNRab66WcZhS
         /JSi6gzlMlLUalyLmYs1Cx9f4Opf0YAmbjWr00KpC+M6VtMD6deDvlPzZiLomgUKWf5C
         bYFg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531eyqDbsk+E8xuF7Pr5I7IwQtXbs0CszdtAfeWwMPdQSMFCdy3E
	ReYbFAOkBQNoGjlYWPif4YE=
X-Google-Smtp-Source: ABdhPJx4lKtL7fCT4FxMpkDaQwsK3UScWNvKepnG55FKqjvOO4GluXgYXj5giV4NMPXhcVdY6r+pgg==
X-Received: by 2002:a2e:9ccd:: with SMTP id g13mr779791ljj.29.1601313478853;
        Mon, 28 Sep 2020 10:17:58 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:5c44:: with SMTP id s4ls1388880lfp.3.gmail; Mon, 28 Sep
 2020 10:17:57 -0700 (PDT)
X-Received: by 2002:a19:520b:: with SMTP id m11mr752044lfb.498.1601313477330;
        Mon, 28 Sep 2020 10:17:57 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601313477; cv=pass;
        d=google.com; s=arc-20160816;
        b=ESUz/kLusDvplT9NZrfGCgyMEnABMnxY3cRr1bD7P0wPZGzT2cpGLSCOoBRdK58wz7
         7K1953ECz3NIIgu7UdhMbLk4GTRnSQoQ73k5Hf3RO/yvN9GiNcsPRyZL5Pkg7vjA7CoI
         2c56ovmjsN7r0XogcQkZOxzdL8KW+ZgCzfpc1AM1IAKNEJJoJTtsh9QugurD3pYawMFZ
         oiMmt9qcr7pX1oaTuNKyNiaUcLOployEgmRolL0407NjdUhTIpThNb+oHjw5qSPZRJZJ
         z8MntfAKz5OdlBQOc+GMVLZdHTXaexj/k/Mf3zF0dI9lMS6lEUVxIVmZd/l44ZEiQcPN
         3fmQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=original-authentication-results:mime-version
         :content-transfer-encoding:content-id:nodisclaimer
         :authentication-results-original:user-agent:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=yGtoQJVqniYIaaG6uocFUkEA5v7HQRbq1yn/AniRKJ0=;
        b=PqXSSUYgl09K8FyFtWmXKPLng25cnXAyxVp4/mg52JFnn2mZ62zvzevQnwsUvAhSI6
         o8S4o9X9jq9lTTWOgL3l6UMKgsWlTO4FJ5meBrBXUmJKz2aFvaCGzFyzL7MrH+4wLHgZ
         NY+oP1/PRgwt5E1TBlAWc+HXYisHbIyJ/RjmWP65IpADmX8feZvT3x35L3wYRi/Wa5lN
         eXSVy/yshqtFJpX1mTPhfA0m1334r5gwops0hfVN1gPh+IYwID8LKfA6mQ8IxgZZ/QEe
         uDbYQ9QN0EJvFqdEDkLJigLBp1F26nIB8QB1i7RfXncxxHsvGNyzTFEG9VtBVVWTj5bl
         tVHg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=5XRuB1M8;
       dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=5XRuB1M8;
       arc=pass (i=1 spf=pass spfdomain=arm.com dkim=pass dkdomain=arm.com dmarc=pass fromdomain=arm.com);
       spf=pass (google.com: domain of chase.conklin@arm.com designates 40.107.13.87 as permitted sender) smtp.mailfrom=Chase.Conklin@arm.com
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-eopbgr130087.outbound.protection.outlook.com. [40.107.13.87])
        by gmr-mx.google.com with ESMTPS id 143si35583lff.10.2020.09.28.10.17.56
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 28 Sep 2020 10:17:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of chase.conklin@arm.com designates 40.107.13.87 as permitted sender) client-ip=40.107.13.87;
Received: from AM5PR0402CA0022.eurprd04.prod.outlook.com
 (2603:10a6:203:90::32) by VI1PR08MB3072.eurprd08.prod.outlook.com
 (2603:10a6:803:47::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20; Mon, 28 Sep
 2020 17:17:54 +0000
Received: from AM5EUR03FT058.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:90:cafe::ba) by AM5PR0402CA0022.outlook.office365.com
 (2603:10a6:203:90::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.21 via Frontend
 Transport; Mon, 28 Sep 2020 17:17:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; googlegroups.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;googlegroups.com; dmarc=bestguesspass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT058.mail.protection.outlook.com (10.152.17.48) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3412.21 via Frontend Transport; Mon, 28 Sep 2020 17:17:54 +0000
Received: ("Tessian outbound 7161e0c2a082:v64"); Mon, 28 Sep 2020 17:17:54 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e322373f47048872
X-CR-MTA-TID: 64aa7808
Received: from bbda7a27d617.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id C81B4D4D-7D1E-4B78-B550-AEAB49104A3F.1;
	Mon, 28 Sep 2020 17:17:48 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bbda7a27d617.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 28 Sep 2020 17:17:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dXjEzVZrnIN9J9TnNp767MvLEprR2aT+0OECasQ/XRBJlMK7OQPM9dNggerCx0M1BIJJYyczwS27QsPu+HDzYxMmreOcvf5OBwAseaHM8T3RX/Y9LPnqsMnguNHUah9Za1GBfQmnHVB6Iq21IjNAuCBGCqPeiy9rWXrA7csKBKNHG6DEcpgE5TcY9VOKgdDqrSXvanLxewdyPG7Smiy95rVaNzOCNmq9iQSrzMCoXQDCMV61tNCrkslqxK0EcM+qFi7vfJCO5lsAhk1pDXtZkFDESCexsjmGtoAzOfz98cLAi3uhT4nO0AwmM7rIuuItcjhRN20Lr5Kft5OBbYu4ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yGtoQJVqniYIaaG6uocFUkEA5v7HQRbq1yn/AniRKJ0=;
 b=TMDXJ1DIFSmWeJYQaa8zeFz6WEdvLK0k+i4THTuPipsGWbuUogw195OHG9aYT6iUIfjJHaksingsG/5xnL64+mfebcl5G68BeQOFFfSMT+wC8cxW7KUD757em1ns7eOTFLsCBigcJPw3e5qfklkaLV+pe8s7R+Nw3c1Zy9uMVaGhCi2DnjNchNSKWmXYreYAHdpDKw4sXV1QU/D15/jiWdOpt82eeu1x2vZOAuV8zHAcDMXo+B2/iTwRDbaqSJnGzuYdNq8W0VhD1dL7uHgtScTM9LCt7ANMISBXvzq40i3QjNC09jGx1pX1a9xBZ+pAFK+x1rN8Ln2+eXzGZhXPVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from DB8PR08MB5481.eurprd08.prod.outlook.com (2603:10a6:10:114::9)
 by DB6PR0801MB1958.eurprd08.prod.outlook.com (2603:10a6:4:73::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.29; Mon, 28 Sep
 2020 17:17:47 +0000
Received: from DB8PR08MB5481.eurprd08.prod.outlook.com
 ([fe80::1986:b83c:8198:ecdc]) by DB8PR08MB5481.eurprd08.prod.outlook.com
 ([fe80::1986:b83c:8198:ecdc%8]) with mapi id 15.20.3412.029; Mon, 28 Sep 2020
 17:17:47 +0000
From: Chase Conklin <Chase.Conklin@arm.com>
To: Jan Kiszka <jan.kiszka@web.de>, Oliver Schwartz <Oliver.Schwartz@gmx.de>
CC: Jailhouse <jailhouse-dev@googlegroups.com>, Mark Rutland
	<Mark.Rutland@arm.com>, Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: Re: arm64-zero-exits trouble
Thread-Topic: arm64-zero-exits trouble
Thread-Index: AQHWiy7nk9iEuDl1n0yhlW5J7twsQ6lpZuEAgAMHjQCAAARJAIAAEkEAgAzzEACAAAY7AIAAApIAgAExNgCAA1pWAA==
Date: Mon, 28 Sep 2020 17:17:47 +0000
Message-ID: <BF1D4C66-E86B-43EB-BCC6-1ED0AECD82AB@arm.com>
References: <91E9F831-4F9A-4444-AD9A-3E5C56D3CA70@gmx.de>
 <e0d4c689-8cc3-afb0-5a75-b57229feba1f@siemens.com>
 <0F31A760-66D4-4430-BE71-6126FCF5AD60@gmx.de>
 <64bb13f6-6ae2-09ce-4c61-4c406a360c05@siemens.com>
 <F1455873-4D81-412E-AE3F-B584773FBB29@gmx.de>
 <ac29332c-0c28-2f3f-2ec2-5b0642fff951@siemens.com>
 <f3ca2e5c-b843-db9a-aa8c-864abd2c54e1@siemens.com>
 <2a039ddc-bd8f-eaf9-2494-7f62efb9aa80@siemens.com>
 <1efb0fb2-8acf-0ebc-00bf-ce059c9ae833@web.de>
In-Reply-To: <1efb0fb2-8acf-0ebc-00bf-ce059c9ae833@web.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/16.41.20091302
x-originating-ip: [72.177.104.243]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b482b87b-7088-4113-85be-08d863d26fe2
x-ms-traffictypediagnostic: DB6PR0801MB1958:|VI1PR08MB3072:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <VI1PR08MB30729AE64D79B1EC7884229CFB350@VI1PR08MB3072.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: gBVfvWC8WCS+Llap1RjLfDZrOJ1HX2XNS7GYw1riiWPR6fEFxC0yM4qMVC8PxaB7pgIatMBoX5LB1M+WFxA/Qkso8uJ7K5JDFci/0BZN5AKn5hQS3qrlzqgNXMQGXgT3Fbac8/7thUZQCsrwiLPYPBlP8Bf1kDRyEyifsf5BAz6XDBtGbrZDj5gxbykWoGR5odplAQ45juNrI4YOyCMFiJDPzKSzgNmkuy8Kl90E2UFKCVhmD3MsBNxaU5KbqiGeu9E/b8u/nt80336Wy/ufCKMUyrRkT0yJGqUgX6hA894fM+EvW+OFcJQQxmT7lp6XAVbUGSo//8k/ptGp2dujRRS74xmRdgfdpV/YJldxkUYEtn+X0N//F7lNEC0b3hPBDA/OJGCOAYoeHnOD8Fzb3lGg4ZTOtKeP0DA5SALAWO28zduzgNTYW/n+ChInriWeAa6lhPxZ39YFTUUVY06Njw==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR08MB5481.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(346002)(39850400004)(136003)(396003)(66446008)(966005)(6506007)(71200400001)(8936002)(36756003)(5660300002)(478600001)(86362001)(83380400001)(6486002)(110136005)(76116006)(66556008)(316002)(4326008)(53546011)(2906002)(54906003)(66946007)(8676002)(66476007)(64756008)(2616005)(6512007)(26005)(186003)(33656002)(91956017);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: sChvYBG7CY3MiFzrdHS65M9UXRNkafkjEjlF6Uxdv1QuXqHBHNHF/F6C7eL3dR1PNnc38mNEPGDt7bJV6WYqPJfnUTjJ/jtiMgxktUFfyTFxmcv+snAiTbdWtTndnCEyuneAqWhvRvCCyrFpvEQtP36sWXNMxQatSlrR+1XCme8L3E1NVmT6fRuSgVFiyDSeWb72aArgf2AZR8S5MkyDiptWjo1E+GIztV348CB5R4CYOcefQiFak67ZkwUlZEI32Q9upKMNlpIHicZT5jI0KHhb+Jf4YQ+qc9PvQ0e7W8hCgSdzuv+8lpB7zzHo3Gx5j35ugj3sLEm5g7ndK8xDA4GF8FvpA93ffidcSeS6HgN/VSEh1EipvARQZM+GCRyTago24uw1sLghVPsvdIbLE+oFFUwKEomypr0mbxwbDuO1zNH3IEqutE+AD6Kqw3axtNSCpet0xrNrl4NLD87jI5b0sJ1uW3UG2su2ZMtWW9y2wfBPTrOgcHcEvZ5HJkbRvBc49S1B93YQEf6t/loNfXv1aFwSNnvw081/tL9pDTWowqrnqZw50Ls1qohor0q8DVFF2LM8Ck7i5gHS09pzQTfBIXwYR7Vv2wfKi706ZfidRCNrU5kNkQMm9TV0HMhmCCZ+WY8moI0xzhYBqZFyzQ==
Content-Type: text/plain; charset="UTF-8"
Content-ID: <2D4F97A8CAC5574C8B5FB3C842C84F36@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1958
Original-Authentication-Results: web.de; dkim=none (message not signed)
 header.d=none;web.de; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 4ed49303-c458-457f-cd44-08d863d26bc1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WsbEDuNPqDhQTWv3iWIOjrJUWJ+nVuGZDOYKSDwBeM52hqodZwZlSLPxoHEam+tkScvEGWiYxkKc6leXbumFTok8AnG8+DXgTafrj6ewh4nedE8XtPSOMMpcVDIWIvQ8MJLYznLLCoekp7/C8ADnSvoTJYC5uXrTyN8rUpNcuwqU/vgPA5FLKP+ynGoLKJr7H/Mw7MaBfmQ64Aw55A3fPXoUjrJ6Svu4riOWSAmrBnpXza+H684iCqZg8K34SvrDfR3YnuhjWeeoEHgosgu986dhjD96Zs7OkLCR2CMWLCc3T1D7YOQPiJFoZMVs33qbGqkIj5z4hzTUlMjxP1VawS5jOryizy+qK9uGeAtwVNdqoAiTfaOCCp14c76ut1KCcsYG8NVu/NvhJjCex+HX8aB9+CkqQfLQlaxk+M4ddR7EQw0n7rkRtYw26QrmQOMcmCm3yLi+VkPKr3n2Nn3SI/MqJMXbPucT0H62AaaJeG6uqdWWvOq9vxHIiXC5GNiMDiehgZawVB44GRj84k1eLw==
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(136003)(39850400004)(376002)(396003)(46966005)(82740400003)(356005)(316002)(47076004)(36906005)(6486002)(81166007)(8936002)(5660300002)(86362001)(966005)(2906002)(6506007)(53546011)(33656002)(186003)(26005)(478600001)(110136005)(6512007)(70586007)(36756003)(82310400003)(4326008)(54906003)(70206006)(107886003)(2616005)(83380400001)(8676002)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2020 17:17:54.3539
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b482b87b-7088-4113-85be-08d863d26fe2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM5EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3072
X-Original-Sender: chase.conklin@arm.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com
 header.b=5XRuB1M8;       dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=5XRuB1M8;       arc=pass
 (i=1 spf=pass spfdomain=arm.com dkim=pass dkdomain=arm.com dmarc=pass
 fromdomain=arm.com);       spf=pass (google.com: domain of
 chase.conklin@arm.com designates 40.107.13.87 as permitted sender) smtp.mailfrom=Chase.Conklin@arm.com
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

On 26.09.20 4:06, Jan Kiszka wrote:
> On 25.09.20 16:53, Jan Kiszka wrote:
>> On 25.09.20 16:44, Jan Kiszka wrote:
>>> On 25.09.20 16:21, Jan Kiszka wrote:
>>>> On 17.09.20 10:36, Oliver Schwartz wrote:
>>>>>
>>>>>
>>>>>> On 17 Sep 2020, at 09:31, Jan Kiszka <jan.kiszka@siemens.com> wrote:
>>>>>>
>>>>>> On 17.09.20 09:16, Oliver Schwartz wrote:
>>>>>>>> On 15 Sep 2020, at 11:00, Jan Kiszka <jan.kiszka@siemens.com <mail=
to:jan.kiszka@siemens.com>> wrote:
>>>>>>>>
>>>>>>>> On 15.09.20 09:07, Oliver Schwartz wrote:
>>>>>>>>> I=E2=80=99m currently trying out the arm64-zero-exits branch and =
got stuck.
>>>>>>>>> System is a Xilinx ZU9EG on a custom board, similar to zcu102. I=
=E2=80=99ve brought ATF up to date and patched it with Jans patch to enable=
 SDEI. If I don=E2=80=99t enable SDEI in ATF everything works as expected (=
with VM exits for interrupts, of course). Jailhouse source is the tip of br=
anch arm64-zero-exits.
>>>>>>>>> If I enable SDEI in ATF, jailhouse works most of the time, except=
 for when it doesn=E2=80=99t. Sometimes, =E2=80=98jailhouse enable=E2=80=99=
 results in:
>>>>>>>>>> Initializing processors:
>>>>>>>>>>  CPU 1... OK
>>>>>>>>>>  CPU 0... /home/oliver/0.12-gitAUTOINC+98061469d0-r0/git/hypervi=
sor/arch/arm64/setup.c:73: returning error -EIO
>>>>>>>>
>>>>>>>> Weird - that the SDEI event enable call.
>>>>>>>>
>>>>>>>>>> FAILED
>>>>>>>>>> JAILHOUSE_ENABLE: Input/output error
>>>>>>>>> I=E2=80=99ve seen this error only when I enable jailhouse through=
 some init script during the boot process, when the system is also busy oth=
erwise. When starting jailhouse on an idle system I haven=E2=80=99t seen th=
is.
>>>>>>>>
>>>>>>>> Possibly a regression of my recent refactoring which I didn't mana=
ge to test yet. Could you try if
>>>>>>>>
>>>>>>>> https://github.com/siemens/jailhouse/commits/e0ef829c85895dc6387d5=
ea11b08aa65a456255f
>>>>>>>>
>>>>>>>> was any better?
>>>>>>>>
>>>>>>>>> Sometimes it may hang later during =E2=80=98jailhouse enable=E2=
=80=99:
>>>>>>>>>> Initializing processors:
>>>>>>>>>>  CPU 1... OK
>>>>>>>>>>  CPU 0... OK
>>>>>>>>>>  CPU 2... OK
>>>>>>>>>>  CPU 3... OK
>>>>>>>>>> Initializing unit: irqchip
>>>>>>>>>> Using SDEI-based management interrupt
>>>>>>>>>> Initializing unit: ARM SMMU v3
>>>>>>>>>> Initializing unit: PVU IOMMU
>>>>>>>>>> Initializing unit: PCI
>>>>>>>>>> Adding virtual PCI device 00:00.0 to cell "root"
>>>>>>>>>> Page pool usage after late setup: mem 67/992, remap 5/131072
>>>>>>>>>> Activating hypervisor
>>>>>>>>>> [    5.847540] The Jailhouse is opening.
>>>>>>>>> Using a JTAG debugger I see that one or more cores are stuck in h=
ypervisor/arch/arm-common/psci.c, line 105.
>>>>>>>>> It may also succeed in stopping one or more CPUs and then hang (a=
gain with one or more cores stuck in psci.c, line 105):
>>>>>>>>>> [    5.810220] The Jailhouse is opening.
>>>>>>>>>> [    5.860054] CPU1: shutdown
>>>>>>>>>> [    5.862677] psci: CPU1 killed.
>>>>>>> Now, with the first problem solved I=E2=80=99ve digged into the sec=
ond one. It=E2=80=99s actually a bit worse than in my initial description: =
If I just do =E2=80=98jailhouse enable=E2=80=99 the system will always hang=
 a few milliseconds after the command completes - the only exception is whe=
n =E2=80=98jailhouse create=E2=80=99 is executed immediately afterwards (wh=
ich creates an inmate that uses 3 of 4 CPU cores, leaving just one for Linu=
x), which succeeds roughly on every second try. I didn=E2=80=99t notice thi=
s initially because I usually start jailhouse with a script that does =E2=
=80=98enable=E2=80=99 and =E2=80=98create=E2=80=99.
>>>>>>> The reason for the hangs seems to be the psci emulation in Jailhous=
e, in particular the CPU_SUSPEND calls. These are issued from my (Xilinx-) =
kernel frequently if Linux has more than one core available. With SDEI disa=
bled the core can be woken up again by some interrupt. With SDEI enabled, t=
he core waits forever on the wfi intstruction. Because a suspended core nev=
er wakes up again the whole system hangs at some point.
>>>>>>> Any ideas why no interrupts are seen anymore in psci? My guess is t=
hat it=E2=80=99s because the inmate (Linux) now has full control over the G=
IC, so it may disable any interrupts before suspending a core, without Jail=
house noticing. If this is the case, it may be necessary to re-enable the I=
RQs before executing wfi. But I=E2=80=99m missing the big picture here - wh=
at interrupt is the core waiting for in the first place? Any other thoughts=
?
>>>>>>
>>>>>> You likely found a bug in the SDEI feature of Jailhouse. The CPU_SUS=
PEND emulation assumes non-SDEI operation, i.e. interception of interrupts =
by the hypervisor, but that is not true in this mode.
>>>>>>
>>>>>> We need a way to wait for interrupts without actually receiving them=
 when they arrive, but rather return to EL1 then. Maybe re-enabling interce=
ption, waiting, and then disabling it again before returning would do the t=
rick. But then I also do not understand yet why https://github.com/bao-proj=
ect/bao-hypervisor/blob/master/src/arch/armv8/psci.c gets away with wfi. Po=
ssibly, they run with interrupts on through the hypervisor, though that wou=
ld not be straightforward either.
>>>>>
>>>>> The good news is that there=E2=80=99s an easy workaround, at least on=
 my system: disabling suspend calls before starting jailhouse
>>>>> (echo 1 >  /sys/devices//system/cpu/cpu<n>/cpuidle/state1/disable).
>>>>>
>>>>
>>>> Seems the reason I was not seeing this so far is that my config [1] wa=
s
>>>> lacking CONFIG_ARM_PSCI_CPUIDLE. Seeing it now as well, let's debug.
>>>>
>>>
>>> My ideas seems to work (quick hack):
>>>
>>> diff --git a/hypervisor/arch/arm-common/psci.c b/hypervisor/arch/arm-co=
mmon/psci.c
>>> index 6a9abf60..3bb3f6a8 100644
>>> --- a/hypervisor/arch/arm-common/psci.c
>>> +++ b/hypervisor/arch/arm-common/psci.c
>>> @@ -101,6 +101,14 @@ long psci_dispatch(struct trap_context *ctx)
>>>
>>>  case PSCI_0_2_FN_CPU_SUSPEND:
>>>  case PSCI_0_2_FN64_CPU_SUSPEND:
>>> +if (sdei_available) {
>>> +unsigned long hcr;
>>> +arm_read_sysreg(HCR_EL2, hcr);
>>> +arm_write_sysreg(HCR_EL2,
>>> + hcr | HCR_IMO_BIT | HCR_FMO_BIT);
>>> +asm volatile("wfi" : : : "memory");
>>> +arm_read_sysreg(HCR_EL2, hcr);
>                           ^^^^^^
> Argh...
>
>>> +} else
>>>  if (!irqchip_has_pending_irqs()) {
>>>  asm volatile("wfi" : : : "memory");
>>>  irqchip_handle_irq();
>>>
>>> Now, if someone with more architectural knowledge than I could explain
>>> why that's the case and if that will work on all platforms, with both
>>> GICv2 and v3 (and maybe even v4), we could convert that into real patch=
.
>>> Trying my luck on the CC list...
>>>
>>
>> N=C3=A4=C3=A4, I was too quick: wfi works, i.e. the hypervisor is woken =
up on
>> pending interrupts, but some more bits than simply clearing IMO/FMO in
>> HCR are needed in order to forward that pending irq event to EL1 when
>> returning to it.
>>
>
> With the above fixed to 'write', it now works fine here.
>
> While trying to understand what goes wrong, I also read what happens in
> the IMO/FMO-disabled case when an interrupt arrives while in EL2: It
> does not count as wakeup event for wfi. Only if IMO/FMO are set (or
> TGE), we are kicked out of wfi. And that's actually independent of the
> GIC model.

Hi Jan,

That matches my understanding.

> What's once again unclear to me is if/where I need isb. Before the wfi?
> Also after restoring HCR_EL2?

Definitely before the wfi. The architecture doesn't guarantee that the
write to HCR_EL2 takes effect prior to a context synchronization event,
so it's architecturally permissible (though perhaps unlikely in
practice) for the wfi to not treat the interrupt as a wfi wake-up event
without an isb between the HCR_EL2 write and wfi.

As it's currently written, I don't think you'll need an isb after the
wfi. Jailhouse never unmasks interrupts, so there's no risk of an
unexpected Current-EL IRQ/FIQ. The return path to the guest doesn't
include any other manipulation of interrupts. As a result, Jailhouse
isn't affected by the setting of IMO/FMO prior to returning to the
guest; the context synchronization event that takes place as part of
the eret is sufficient to ensure the clearing of IMO/FMO take effect for
the guest. Be sure to revisit this code if you choose to make use of the
ExS feature from v8.5.

Chase

>
> Thanks,
> Jan

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/BF1D4C66-E86B-43EB-BCC6-1ED0AECD82AB%40arm.com.
