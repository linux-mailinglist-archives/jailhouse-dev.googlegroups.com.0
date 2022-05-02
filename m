Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBKUEYCJQMGQEPRD7EAQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43e.google.com (mail-wr1-x43e.google.com [IPv6:2a00:1450:4864:20::43e])
	by mail.lfdr.de (Postfix) with ESMTPS id F021C5173CE
	for <lists+jailhouse-dev@lfdr.de>; Mon,  2 May 2022 18:09:15 +0200 (CEST)
Received: by mail-wr1-x43e.google.com with SMTP id s14-20020adfa28e000000b0020ac7532f08sf5442470wra.15
        for <lists+jailhouse-dev@lfdr.de>; Mon, 02 May 2022 09:09:15 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1651507755; cv=pass;
        d=google.com; s=arc-20160816;
        b=jHbDv9G0wYnKMHYWe8lkkL8PX0JIim1ELMHkwdlPMpLBEagr17YCOZfQd6VEvsd/k6
         yqDSBl2Q+OwPRei83uJBNwF8h/EoPevycbFw118bbImQaKSVC/RxMO/7ZK0gdJfMw8D0
         k2xqVQgCFQC17YD9pvytJTBbhgRUbcnWB7DHublHpmak2oo5cXrTT1WAbU+UgFG4u8+v
         Tz19eVRw3Ro8GyKpxh8/85h+uQnTFKdoVV7qAVr3k6dbccydu0A9NzynJu1kwB9ZuyRp
         UCxmH/0b5M0wAInMDhfLFhrS00MBKRlyCAnyxeVFQcWY4HMbH2OPzG/t3yLVLJ1IxTjt
         MEvw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:dkim-signature;
        bh=Z4YUoniDlT0DubZrJ3+ZWlkca0UQcwTjsT4oCOH4BXk=;
        b=FzgwXTSHHanv/MP7DPMsKO4ULnnLz6i5IgSZb1o7pbeO9UA+46844PQL72TL9+LqEb
         prONg3FYB/k/g/05R/2jm6hvsrq6ipDAyRFLHntCJ4B6dH4IYopkhZlbFOrYEFo166Z2
         HZZ73KxH+KKtefpRosFc+YvjurKgWu7Kag+BeMOIWbsdKDTXWtMZv8TGK4LLgBQ4LBQP
         5ynLzMEbi4Q17fZ3/3FNIxSdFoNWa4zhFXBKJ6kiWZbZl0dyhF2HZx0AtQOI07s5rKKg
         P92lXz/idM7sQBIDbVE3ZtMAv782YrfGbPAV/p5OuEoUMKbP+zU7dOhDY9Y3ewDFbRLa
         wtSQ==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=Hiql+lPC;
       arc=pass (i=1);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe05::628 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Z4YUoniDlT0DubZrJ3+ZWlkca0UQcwTjsT4oCOH4BXk=;
        b=nSLF0OqNQ46H8wof6BOjOJDzzhgs98H0mtMuN2qnKV0a2mJ4X9ehF3Ggk/1VGHrgdv
         rqSCrZJglSSDmy0Cg7RTghg1LHuUMT8itfO9sM1NFlBms6KwJdTvhvK0kYw/6EsJ9iOS
         PznaPnDIZ9OUMLlzSLl/9PZQkt0KWAuUcmW7eq0Z8kC2+DDdqShh0WC4XXmhvbV6Y0rd
         VWSoIY4W/qRkMrkSTQJyxMH7Z+vrGT4gc8BFAvdFPlu4Z9ez0FmVcunFPU+akNFpBloH
         H+EqZCY8mh0NnB5RusVzLIVwnmfxUndiG2KAuuTz8n68GiTeOQo2flQNoUK3zxHbfW10
         rIVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=Z4YUoniDlT0DubZrJ3+ZWlkca0UQcwTjsT4oCOH4BXk=;
        b=6JHJBpaVIiCe/v621Hcn9jIz8Qr3a2ulOcsb//AXggm1kCJ86FaQauiFN6kbb6PkTL
         MYwepniFrDNGIIBBj2+WNZuSSNhuNWP4bMJ77tyH8+JCEi8x3sj37eG+XiR5ODec/5hj
         D3GY0MNADWua3Mwpo0jNzEo4bue8ntuKgxkEGaCKuzCnhz5pxNCZt6bivZoz43wa0rRG
         eh6AU4bekyeO2lY7zCFjpOnhCiO9khN06hJCD0gsUJjbyElbFGvPbirky/IIqeKYW0+5
         2CmyFO1oaop4dLsXfbQImHf31b2MBHqtwvXZr4pgKhdI6iKC2uCQVuMjp0Cd9pt5SJTo
         tXGg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531KebhZn40G2ZAB8q7gJGzvqVlxuaBOOlZru7MEeXvD0tn/Xa9b
	VXPfBTfW/Lf4pxg6wpIT970=
X-Google-Smtp-Source: ABdhPJz2aF2ocx8bGlQG5SdAv7iSwp+eMuIlGWrjDUhvt1Ce6yluHyBWGeIvJqisptaOg5sQECxu9Q==
X-Received: by 2002:a05:600c:4f90:b0:392:8de8:9deb with SMTP id n16-20020a05600c4f9000b003928de89debmr11789768wmq.166.1651507755159;
        Mon, 02 May 2022 09:09:15 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6000:1567:b0:20c:5e04:8d9e with SMTP id
 7-20020a056000156700b0020c5e048d9els2689242wrz.1.gmail; Mon, 02 May 2022
 09:09:13 -0700 (PDT)
X-Received: by 2002:adf:fe47:0:b0:20a:c899:829f with SMTP id m7-20020adffe47000000b0020ac899829fmr10060988wrs.165.1651507753469;
        Mon, 02 May 2022 09:09:13 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1651507753; cv=pass;
        d=google.com; s=arc-20160816;
        b=PE0Ne7BrLK9CLHOTuu+fKZUXD32U/LJxGlhAjBRcn0MsqBIUFUy+aK37jRv+QSpnrd
         oCO24MKtW9r5RPyYAG1JTe5Mbgrjo+R6KfYFnwtvshoocWRHq07N7RgNXz3ResL3hLRZ
         Yv8wfupCev5LA0gS44oZ4VHqsQWDyecOvj49NXJb8BItnC28wDKz0/byy11hTiBwVwxN
         NVe4nRFbkp/eANPLl8TrsTCI28q0GWUPyHw+9aS2mvxPxpoEA4uZg+8wV1FZgN1aIs2g
         PXPIB2DPjmNzrHlUwN5TYoXb3P0dJRlq90x8lNshtxKe3go6sFbY7kaW07sdyettLkQl
         QszA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=4qBgL80sS53w3S8NmC7qtfCl+8R1/UgXa0UYGILEo8s=;
        b=TuAbQYCr3zXDVDaGgrKvpbXPUeGc1LlHpArWE2crpIhQBX4C7gDfZfWc7p+veZk1RD
         mcD+7ZemLOHiKc9Oq/svK32ud7mpkc9QfPfw0NRHD+KVkZoQxu7flo7c/LY8PcyozpTa
         knJzqnub49FXUyg2VPYO3lW0sk+T7IPXYWaWfwLSpiuWnIup0uybt1H3SKx6thEEAJh/
         6RLzh8su7l84EgVLNHcGi5X8WHjR57CGosBdqhNP6jc407gFMFdl1guK9iJEc6nf12pY
         x6HF2SyYYDDVxgLOrHpcOvZr7Kgkq4p5aTI6sOApy+4+bz3dD4NkZQFjcDioOTlqRg+z
         WlzA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=Hiql+lPC;
       arc=pass (i=1);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe05::628 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (mail-he1eur02on0628.outbound.protection.outlook.com. [2a01:111:f400:fe05::628])
        by gmr-mx.google.com with ESMTPS id ay34-20020a05600c1e2200b00393eb6edf83si441073wmb.0.2022.05.02.09.09.13
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 02 May 2022 09:09:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe05::628 as permitted sender) client-ip=2a01:111:f400:fe05::628;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eXn5lMJN5zLKkWw2wZ0pZ7cqZFHCaM3G7ABjY/BGNUtpgfuhu5RtSArl3BaKtUqD72hZaXj1Q9Pa7FztVYP4dOoI27AHdx+7oz1BgsDfAupQUtyl9/XgT+6z8ToAraj9eyKho8Bt2vDOkj6s0CzNiuUA13973PneW3bE8lzcdm2isaLoV6P0ZBbtoBNOmJZRkJTjIaTbWmDuXWIyynbeKUyicoFhUp1XZlUdF2NPolQhn/K+VXrOjUHA1TTGcyaLTBuutjdqJbmKZizNuDC5nc2qj99tDQkbE4qh+nIt8qdzXaamog9YpAxxQ6Ey2X5TVu/yLmxNbJYL8tB9ZtatLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4qBgL80sS53w3S8NmC7qtfCl+8R1/UgXa0UYGILEo8s=;
 b=Ez0URDomNtIY00iRokM3yoYXcZ7eTHM2W+0XOopUOrQ4pSaLLTXCJz39ULFu/2yEX1CFoRx1rTKsEjk7qZ4kphqExyu876djFo6EnVm/0b70sN5QU1E4LKDtx6Igi+jmdReWbk1WdvGXZPlNOt7LFNf7RYOndgEmWWKS96/E87D9pbQPBB1INrTCjIpdihstPIW3kHl6Y2fgsUP8Tb5XXtEhKUud8WfxUE7RRSvGuYvsonlckuDZhJVqXADfL7u7lZt7XYfE6mLDe5PYMgp1hlAfeCbUbGTEzYiYC/dvmuY+u8y3nz7Iue5Q3WTEjzqRLK2mzI/eHZWw3ojLrgzgTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 194.138.21.73) smtp.rcpttodomain=oth-regensburg.de
 smtp.mailfrom=siemens.com; dmarc=temperror action=none
 header.from=siemens.com; dkim=none (message not signed); arc=none
Received: from AM7PR04CA0024.eurprd04.prod.outlook.com (2603:10a6:20b:110::34)
 by AS1PR10MB5216.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:4a6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Mon, 2 May
 2022 16:09:12 +0000
Received: from HE1EUR01FT030.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:20b:110:cafe::47) by AM7PR04CA0024.outlook.office365.com
 (2603:10a6:20b:110::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24 via Frontend
 Transport; Mon, 2 May 2022 16:09:12 +0000
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 194.138.21.73) smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=temperror action=none header.from=siemens.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of siemens.com: DNS Timeout)
Received: from hybrid.siemens.com (194.138.21.73) by
 HE1EUR01FT030.mail.protection.outlook.com (10.152.0.170) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5206.12 via Frontend Transport; Mon, 2 May 2022 16:09:11 +0000
Received: from DEMCHDC89XA.ad011.siemens.net (139.25.226.103) by
 DEMCHDC9SNA.ad011.siemens.net (194.138.21.73) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 2 May 2022 18:09:10 +0200
Received: from [139.22.138.143] (139.22.138.143) by
 DEMCHDC89XA.ad011.siemens.net (139.25.226.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 2 May 2022 18:09:10 +0200
Message-ID: <7a0052db-13ef-4b72-f0e2-50832146a374@siemens.com>
Date: Mon, 2 May 2022 18:09:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2] driver: sysfs: Add compatibility for default_groups
Content-Language: en-US
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Jailhouse
	<jailhouse-dev@googlegroups.com>
CC: Stefan Huber <stefan.huber@oth-regensburg.de>
References: <179b997b-4830-fb3b-792d-79c25fb39788@siemens.com>
 <20220427181842.2116064-1-ralf.ramsauer@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
In-Reply-To: <20220427181842.2116064-1-ralf.ramsauer@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [139.22.138.143]
X-ClientProxiedBy: DEMCHDC89XA.ad011.siemens.net (139.25.226.103) To
 DEMCHDC89XA.ad011.siemens.net (139.25.226.103)
X-TM-AS-Product-Ver: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-AS-Result: No-10--18.149200-8.000000
X-TMASE-MatchedRID: 10+ctCQpgSw5QaOxwNGfvo9bHfxDWoibR9fQDKDdQ3cSEYfcJF0pReqh
	uTPUDQDt0MT4bYTRBTdIPDhB+IjkDYS61Rm39/K/Osi5yp5h1HIFUNcS8I6saGj110VUgQaLAQ8
	mtiWx//qbuvvgpZZI+XjBaILWVRlCrdoLblq9S5ra/g/NGTW3MjZCT0GsTWyEtLDu9qtqKeEL//
	VMxXlyE49VDgDo4aWRulhwTZgE1ULD+KhcGEUzredltIwCeZ1Ejl1W6HbLC+FeYVWU5uHQ/Ayry
	3WoaCBEmyiLZetSf8nJ4y0wP1A6AKEwgORH8p/AjaPj0W1qn0Q7AFczfjr/7NdlOSXWaztc8unh
	Vsd83spScAdqGHjGSqMSTNkmNCDH3hm1KKrrK6o=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--18.149200-8.000000
X-TMASE-Version: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-SNTS-SMTP: A11B76E9B4B6D970CA6DE2BB8035ABEEBB636995E1D1973394EB7F551B1C052C2000:8
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 68573dc2-3715-4324-7239-08da2c56183e
X-MS-TrafficTypeDiagnostic: AS1PR10MB5216:EE_
X-LD-Processed: 38ae3bcd-9579-4fd4-adda-b42e1495d55a,ExtAddr
X-Microsoft-Antispam-PRVS: <AS1PR10MB5216DFDF996887FB7D78F6FC95C19@AS1PR10MB5216.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7u8ayRK57jixvQQs0rUjbbL+tj5AVllc5kE9hl9lCSEHjbiWaiwufNN3w06fnCID4VA3o2gyI3Zh4BnsJ/SDe7uYN3xVruaMV67sGgm0AIQ3QKdnWlY5j8LLKW/eRfj3JzKGKfp8E66iHLHFAOZJeo0BypAD9XcSkHIbJQ8lLhDIbvX0CZS7iHEuzrAnmSYffXvPMegqWoLvza+ZLnRZgZ6qbZ0SHPHWJqlAMP4rpWrMeAmnZJ2pS0mQzuLFlf7Vmv+1fwakZL8nWew6oVKF6aZTpqHJ9YI/M6xDxVHqRoq+kVGqTRA6rkE/x2475v1eKSOoVoZpoPz2klGqxrgf8M3tsd5xisZO0Nlj4Nn1Q9f9CYK3j9UWNhKKbSF2Brpo9eoANzgPbpm1iVHq1OtN4DyP7rYnI4ZIJY0j6dcSxFtjUgh80e0MU4wG1uNoiquRjra6X4E2/82IXnD/qzCCQwxKqNa/nHvcQOTjxLW0IUkd5ropgxr8uOJyxeRBEBsrn5nisg4uR0btXy8UUaD+UlpDhKZCiTtyWnN5ACoGcsAxg5mxVDN26miJS9iqASEbJbqHfy5+M9kEqpX/tfSzmcH1kM11felapj1uE1SJtZaEPIA9p0VdtpmWxmVYpMqKInv3PWkxfBc4YgKu4qrs+kyPOh2tWBxRJp+bqYk407jLAZdb53EmUR8l9cKTjnmb4hQLxej5TZjCn0LO4rn66wdp0eKwQRipm5+PW4F/NKXD5HrYQwm9uVgcGUoDs5imcqLYp6AXek9mM2hq+T6U4Q==
X-Forefront-Antispam-Report: CIP:194.138.21.73;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(2616005)(26005)(8936002)(83380400001)(956004)(47076005)(63370400001)(63350400001)(508600001)(31696002)(31686004)(2906002)(82310400005)(186003)(81166007)(336012)(36756003)(16576012)(316002)(6706004)(110136005)(16526019)(82960400001)(4326008)(40460700003)(53546011)(8676002)(70586007)(70206006)(36860700001)(356005)(44832011)(86362001)(5660300002)(3940600001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2022 16:09:11.1120
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 68573dc2-3715-4324-7239-08da2c56183e
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.73];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: HE1EUR01FT030.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR10MB5216
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=selector2 header.b=Hiql+lPC;       arc=pass
 (i=1);       spf=pass (google.com: domain of jan.kiszka@siemens.com
 designates 2a01:111:f400:fe05::628 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

On 27.04.22 20:18, Ralf Ramsauer wrote:
> Since Linux commit cdb4f26a63c3 ("kobject: kobj_type: remove
> default_attrs"), the deprecated kobj member default_attrs is gone. It is
> replaced by default_groups.
> 
> Add a compatibility layer to support older, as well as latest kernel
> versions.
> 
> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> ---
> 
> Note: only compile-time tested!
> 
>  driver/sysfs.c | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/driver/sysfs.c b/driver/sysfs.c
> index a604afa4..a5a02831 100644
> --- a/driver/sysfs.c
> +++ b/driver/sysfs.c
> @@ -59,6 +59,14 @@ static const struct sysfs_ops cell_sysfs_ops = {
>  };
>  #define kobj_sysfs_ops cell_sysfs_ops
>  #endif /* < 3.14 */
> +
> +#if LINUX_VERSION_CODE < KERNEL_VERSION(5,2,0)
> +#define COMPAT_ATTRIBUTE_GROUPS(x)	/* not used */
> +#define DEFAULT_GROUPS(x)		.default_attrs = x##_attrs
> +#else
> +#define COMPAT_ATTRIBUTE_GROUPS(x)	ATTRIBUTE_GROUPS(x)
> +#define DEFAULT_GROUPS(x)		.default_groups = x##_groups
> +#endif /* < 5.2 */
>  /* End of compatibility section - remove as version become obsolete */
>  
>  static struct kobject *cells_dir;
> @@ -180,10 +188,11 @@ static struct attribute *cell_stats_attrs[] = {
>  #endif
>  	NULL
>  };
> +COMPAT_ATTRIBUTE_GROUPS(cell_stats);
>  
>  static struct kobj_type cell_stats_type = {
>  	.sysfs_ops = &kobj_sysfs_ops,
> -	.default_attrs = cell_stats_attrs,
> +	DEFAULT_GROUPS(cell_stats),
>  };
>  
>  static struct attribute *cpu_stats_attrs[] = {
> @@ -212,10 +221,11 @@ static struct attribute *cpu_stats_attrs[] = {
>  #endif
>  	NULL
>  };
> +COMPAT_ATTRIBUTE_GROUPS(cpu_stats);
>  
>  static struct kobj_type cell_cpu_type = {
>  	.sysfs_ops = &kobj_sysfs_ops,
> -	.default_attrs = cpu_stats_attrs,
> +	DEFAULT_GROUPS(cpu_stats),
>  };
>  
>  static int print_cpumask(char *buf, size_t size, cpumask_t *mask, bool as_list)
> @@ -342,11 +352,12 @@ static struct attribute *cell_attrs[] = {
>  	&cell_cpus_failed_list_attr.attr,
>  	NULL,
>  };
> +COMPAT_ATTRIBUTE_GROUPS(cell);
>  
>  static struct kobj_type cell_type = {
>  	.release = jailhouse_cell_kobj_release,
>  	.sysfs_ops = &kobj_sysfs_ops,
> -	.default_attrs = cell_attrs,
> +	DEFAULT_GROUPS(cell),
>  };
>  
>  static struct cell_cpu *find_cell_cpu(struct cell *cell, unsigned int cpu)

Thanks, applied.

Jan

-- 
Siemens AG, Technology
Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/7a0052db-13ef-4b72-f0e2-50832146a374%40siemens.com.
