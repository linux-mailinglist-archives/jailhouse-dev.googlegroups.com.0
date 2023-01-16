Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBPNUSWPAMGQELONSVKQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x63c.google.com (mail-ej1-x63c.google.com [IPv6:2a00:1450:4864:20::63c])
	by mail.lfdr.de (Postfix) with ESMTPS id C804466C11C
	for <lists+jailhouse-dev@lfdr.de>; Mon, 16 Jan 2023 15:07:58 +0100 (CET)
Received: by mail-ej1-x63c.google.com with SMTP id hs18-20020a1709073e9200b007c0f9ac75f9sf19581608ejc.9
        for <lists+jailhouse-dev@lfdr.de>; Mon, 16 Jan 2023 06:07:58 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1673878078; cv=pass;
        d=google.com; s=arc-20160816;
        b=OO3v4GKS5dk4m+7lM1CNkdRqKbJpLaN2KDnZgLKSQXgzLpoQgfIYlmJYPRFqKI9smo
         M8D1fi9+dq3uqiTWw74ag2/8HOqhR6O+dK0aXL8feJylv0520OLx1nlpeVde+le0Ov6a
         CLVuJIuxgFaPvXMHHdx8eR9tnTTwijXBktfVtOpNkyiYvimu7kqKgc9hmooJsvLKlpRL
         iz0yBuNARx8GmHgcYdxku7I5FxEFrIzDcAJijkDUnCugEDlcMJUCqH6+kAGwud/tx3Hq
         /XIAnKt+8bwf3ZPiHr3fuxGqtpIdwUsdg+B+x8Lu0vYdvsU1lGFanRps7v3Gf7RfyZlC
         1dhQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:in-reply-to:from
         :references:cc:to:content-language:subject:user-agent:date
         :message-id:sender:dkim-signature;
        bh=utt8J8+JQtIweDgxb9W7J127Z6vWKPmUhCWurfMErSs=;
        b=K4bT5ywcNOzoDIPpO+PKMr1zvyexQ/n+rHlXEU72J4s0oWlkFsMiHM0Y3rasu4qmqa
         Ea728JPB6q0ZxYpr9+JGKPBgSGjrx+W55S/hiy/JT5AGXN8Zja69MtZkND6MwczzJb6z
         8nYxH0xKeMw8HQkwfBt/Uk0//zl52fsY9Z/kcgf9ad4xY0FfSBD40YA98ThzRIgjO5W0
         8XcU6kPE0ztPtyh6TiUy+FGn6eQy+NKrx97ZOSKOxgxp7Ah1VFwmv2OV8fY3+eJo7Smn
         Oy754Jn1L+1Cybln4yghLnZK/rB9L1H+TgzRabz448NNPF60HFJV7+crcwltozp1cjiE
         HSig==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=IIb51DCO;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 40.107.13.81 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:date:message-id:sender:from:to
         :cc:subject:date:message-id:reply-to;
        bh=utt8J8+JQtIweDgxb9W7J127Z6vWKPmUhCWurfMErSs=;
        b=VyP0+pRSOxeuypHiobwhbd/NIGoEP3h4N+uB5DIOQHy+NHP6yGbDh/qh4rhity3e0U
         KpsXtcVyzGAFrFDXjtxAZEkMrHPPqw1keEILu9QGCFx9C0n4GnKp1sHHYpL6CZh6BJiK
         Q6FL68WHZ5vk6J/5zflgvu/VhLqKnoJTkhaMoZK2DbFESHkYkv6ZoTc9aCswv/mMdkqi
         xwuTRUazGLfNkGwC7sRCV0uKQAOQIp79tpIlNVJ/086GpjQZ5p+ifuqrVu1kmvk1/LYs
         pqI9bnBF6IVc/bB2HAnXu0eqEJTVNoohcuyrkrxHecDAdYOgD3Di7SJ0Y2KX/FutJiiK
         mrbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:date:message-id:x-gm-message-state:sender:from:to:cc
         :subject:date:message-id:reply-to;
        bh=utt8J8+JQtIweDgxb9W7J127Z6vWKPmUhCWurfMErSs=;
        b=oyB75zgGiUOV4yFaKewEcxvuFYvtE3N8FiTFYrJDmEvSOASBy9EY5Yw47LuJQyIVPS
         lOcWVkpVpvkQkZFw/l8W/dvFSKFCQXa2kznNcu2QHqvCfIOuekDbv2Xw2QIwx7/Bn4j9
         5U/+BZaknYrh277B4SKD7Jx4s0pbg9gjSo1M1epuT1V3GGCxV+eivXTfb04ztcyqHYgU
         1FieAwXylyPC+o8BhqsXPdO3llE87yLRNxp38rjKIV8pb7q1TICGdShq4eP6WHm/QgOL
         uERdY153A8jKzVu47wcjzTEW5CAF+GlGLVU2tceh0R+jBMBlzgtpAAGGunE4U6e9yE6n
         YYZA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AFqh2krxL7jzQ3p8WJQv6NZ1U3BMUUIUtqWRNNkgdcAEgeKp6VzLY1EH
	fEFP6LMguOyCsBooAmV1r0Y=
X-Google-Smtp-Source: AMrXdXsU7pROqQM5x9rw4uYsTPmvNrrPBkgLxjB8GV4Xwk9JboYZ2zBe1e9UYT3xXlGZaxJ6BYbb0g==
X-Received: by 2002:a05:6402:3714:b0:484:af15:bd39 with SMTP id ek20-20020a056402371400b00484af15bd39mr7467684edb.339.1673878078348;
        Mon, 16 Jan 2023 06:07:58 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:94ce:b0:7ae:83f4:3bed with SMTP id
 d14-20020a17090694ce00b007ae83f43bedls7221312ejy.2.-pod-prod-gmail; Mon, 16
 Jan 2023 06:07:56 -0800 (PST)
X-Received: by 2002:a17:907:cc1d:b0:871:d59d:4f54 with SMTP id uo29-20020a170907cc1d00b00871d59d4f54mr1019328ejc.27.1673878076611;
        Mon, 16 Jan 2023 06:07:56 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1673878076; cv=pass;
        d=google.com; s=arc-20160816;
        b=ha8WWnAObvC2WtJVBqQ6xXrjujmLlZ5JI0HQqJtvJ7UxZOwQ5SXPCGlffe3On13OB6
         rVQNnUzfhgI3Ka+07vYZOYJQbWEqdUloHdPEJCmxqeFpu0Z8ief11CnUljwxx3uvtthD
         8qqhT1XPgEWX0sh6U3WjkNzDhEr/rEevZu3kzougwbrvnqhbZP6qTqnHQvyLNIy4nEcQ
         oz2Ouo2k4EEPBdjSVP7vT94QtVoSdkZ1n5h0wWhdmy8KKG4XqLZ8k25DpixW+5LtRTT7
         xhZzJjaXW6WQPdsHkzMj/VeIRigZIFHCIiT1wDKJdVxwlxBOHXbE4gvy5IdnjOd67hU3
         XnDA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:date:message-id
         :dkim-signature;
        bh=tffPhnHqjXSn7jq2F5r4Ff3PLV0oHGbQ8JzMe1lSbS4=;
        b=VWkx5th5OCpwtAV2Qd/NzvWS1mA8SURIL7BpjqmBxYxEEIqVQTARFDj+WRt9g+ZHlg
         G5kZEhqZxaBhDYSwRo1H6KoWgYB+slMa//8auuNe3zUlFAhyu8GUkuXTbO1ZLrXBnFif
         N9VmfmSWzW1TMs4/a7YtkVb4tCw3YU5L+oJlc4i/42AoYye/0jJw5YGKhUTc1mWem8gi
         IkmcXh5O0Nk70HyGCouTe7VaYogD50vBrM8nORw+nrYb5bvMBZ3BV37LVcC7cyRTv4iF
         Wjji1Se0JT68PmQlPWN8a/63rbbysSZL3kTNoNc3TrfXxKbr5EagCtIjN/jCZUFGJvrX
         706Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=IIb51DCO;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 40.107.13.81 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-he1eur01on2081.outbound.protection.outlook.com. [40.107.13.81])
        by gmr-mx.google.com with ESMTPS id gv11-20020a1709072bcb00b0086728259fb3si410359ejc.1.2023.01.16.06.07.56
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Jan 2023 06:07:56 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 40.107.13.81 as permitted sender) client-ip=40.107.13.81;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hoWimT+8WGiwoek1UwmOziPbDOG7wGvW61j2F+9jepTN90+TCevS5WIXk8EY5At+pfSTIzKPtfruUX6Lfb9I+4tFLJeve0cDYJusKktZIHfIXcfWd9XmRKTxh6UkHe7zcVE3hP5WJ/ONUP3ZaYWRaJFyhyAvLBECVcFCO0G1ip4DF1YqMpMDbgB/AKPXiIBNfy/EunQD7rg/+7I1D+cjj3vXCLdoXXX55xiB6n9MX4G7/ppA4UbZVdqehwVt1UwSmGQ+/KZ6Mjq5bZINiisVOqlf5gVhAKqLiKerfkmV4wg8YgI2WYykKY+mwTb7nvODvm8EORfFNALmgY8m2u7y4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tffPhnHqjXSn7jq2F5r4Ff3PLV0oHGbQ8JzMe1lSbS4=;
 b=bPi3rDj8D8n5yypjc7hcb+bVAbL3fGMVhxvppPkqJWwjcKfLxwerDKZUMKvbzzxkC+ZnuZBiseXEh6mnqx/AmbHIf0g0g9qpmHrBss57fop3gVWMewUhQb08VgzSrmkeo0YDIgPaPSkpwSZgSUrWAdKuKa4/A1Q0+SzhclFouU0b/S8iFZM/ScPV5h8/z1+rzM7SCgjG4RTEGeJ/ffNho0vRYMxoFrd3EWLTmvVTRXfVch6dOupl7zScZQihNKqS9BTsu0Ezy8b35Dyocww+67O9ETRo+1ZbAgxhqrJFU92lSdRP8Sw09QDZioCaqdASFmbc7ehnmx71IzV8OkMWbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
Received: from AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:588::19)
 by AS2PR10MB7083.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5e9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Mon, 16 Jan
 2023 14:07:55 +0000
Received: from AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::784b:e95b:b855:dcc5]) by AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::784b:e95b:b855:dcc5%7]) with mapi id 15.20.5986.019; Mon, 16 Jan 2023
 14:07:54 +0000
Message-ID: <a3144999-eb39-c18d-dc67-e38a5c2078af@siemens.com>
Date: Mon, 16 Jan 2023 15:07:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 3/3] pyjailhouse: support automatic architecture
 detection
Content-Language: en-US
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
 jailhouse-dev@googlegroups.com
Cc: Stefan Huber <stefan.huber@oth-regensburg.de>,
 Andrej Utz <andrej.utz@st.oth-regensburg.de>
References: <20230110211444.9897-1-ralf.ramsauer@oth-regensburg.de>
 <20230110211444.9897-3-ralf.ramsauer@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
In-Reply-To: <20230110211444.9897-3-ralf.ramsauer@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: CH0P221CA0031.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:610:11d::13) To AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:588::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR10MB6181:EE_|AS2PR10MB7083:EE_
X-MS-Office365-Filtering-Correlation-Id: a154ff36-f95f-4e0a-ec50-08daf7cb0fdc
X-LD-Processed: 38ae3bcd-9579-4fd4-adda-b42e1495d55a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zgHFKHHPozkiMc/O9004rb/5vC4I9Vs916WPuYhVFg7r6RNaHwelYSIZiaMQrPKUkgCMivpRBP3RFSlSvnNLQKPlwg4cDokJ/UJeZglI2KVGKyDl1UQ0XNoXQgHXCQpmiGYtZVa43oLe9pHOeap6XCpNmyuXeufIEcoHttTUm8a8W1KxKW9lhxz5SvwKld05ZWCjeXvEV38Bpx5B0oAuW17q3h9X/wFvYeQhH59o4Du+kGZlaF0UonPIVqqZC37MkHeNz/HLInN/e74e5aAuAqtHMNiH4nMXeU6nhICRD18xkDa0J48u4xBI7zTeZpy1MXmI1t16IOGdnLzs7aXu4N7q6nHUHo8VHpXUBNYrBR36o8Kh+ezHlOMUdrlyaeNMFXbXGfnEDSLs1Jkl+R/9UmR34C4Y0RDe9hnW9LCf1yvd/FCOHz6+ixZs0Q1b5ixAIw1fmcgwtljxLQb8iuQFiONWsz4j7A0iPrVQ2si9wqtuBdYCr0h6vQCem/UidB0WTvxNsUuC70AAN0JhrhjZIP2gMCGUZ2uRq1ty/WhRVxQ/a2aitX2YFAZ0Q0+0LrzL9JQ5UUlfYSEPl+bGHo+QhXOMB9b9ir0uM0a3Gb/pVmK8XGZGwRC6S7VEWcrHoX0vEP85gNA0nBpCDHqE4ecNXI9oHprdNRDssX8MfN9dELKIMZek3P0McKHBK06khwVXnq5bPhzb44NlCFoWFXP/8vp/4GPAbZp42d6r+lB8sV8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(136003)(346002)(366004)(396003)(451199015)(6506007)(36756003)(6666004)(6512007)(26005)(53546011)(6486002)(82960400001)(186003)(31696002)(86362001)(83380400001)(2616005)(478600001)(38100700002)(5660300002)(8936002)(31686004)(4326008)(2906002)(316002)(66946007)(66476007)(8676002)(66556008)(44832011)(54906003)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TnNDMGxXNWpua1gvTE04Wmg4M3V2dGlOakN1NWZvRFgyMGtLaExFNlpJdXdy?=
 =?utf-8?B?dDIrRjA1SU1vNU11ay96blpzOVEwdUtLTnBTQlNBcjYzNmtIVnVUcEV0TWQ5?=
 =?utf-8?B?WnNZL0JiYUpwb0lMdnpvR3BUWXEvSUUreGF2b00vSWIzanB3RjB5MU1CSDBF?=
 =?utf-8?B?QWtMb25Ja1hzN3ozWVc4OE5sTkxsQmZ0aTRkYUhzY05RQys4aWVuekVHeURF?=
 =?utf-8?B?R25ybG9hM1hXdUVYc1RaNGR4bGFXaEZBSzNKUTJFVlBhT3dubjZGU0JBdkVN?=
 =?utf-8?B?dWZ2Vk14VmtLejc4TkVWZGpjM0VUOGxTTVRpN1Rnc0E1M3VhNXdaWmxaOFZ6?=
 =?utf-8?B?cW9KNmNqbzZkUnhSanlKWmU4VHNXcXlFbEtCRjZhOTNEUW5FTFlPL0lrYjg5?=
 =?utf-8?B?U1M3ZGdTUm9WVXgvdEpGNFJiR3dKWjZZbWVVaXdCV2c1VXVtdE0rakNSWFRz?=
 =?utf-8?B?Zndid1E2aTFRcHZFeUYzbU81NzlBa2lVazhvZ3hjNXZsTUk5elpZTSt0QlZm?=
 =?utf-8?B?Y0JKVEVuS0RlUk92eWpCSE5vQXM4YVJyOStwZ0VheXpLWHRTazBvd05YVkEz?=
 =?utf-8?B?Ym9PY21SeGgzZEJOWjF0L1pyTGIxWEJhbTdhVW9NODZEWlRaRGhNU0o0M285?=
 =?utf-8?B?YXRCN1JNWW4xZHBpdEdEUmxOc1F0d0FvcElFRUoyRHJkOEl2VUdSOUdtZ2ZH?=
 =?utf-8?B?WnhvdnV5d0ZudjlOeFI0UmphaUVTL2pIVmdISVZHU09lYUJPS1h3WVAyNWJV?=
 =?utf-8?B?bUloOCt2cnk5OFBsRUdIWFhUNkVDVE5NczRyL28vc0ZQZVZJSWg2NUdZS0pF?=
 =?utf-8?B?R1VjYU8wT3hKN2F4bjVVSnI3SDA1YWM2UTViaVhUSVR1Mk5LVzhhOWx5YWFJ?=
 =?utf-8?B?T3F2alpyM1dka3ZTWlNYNHZRczFqU0JSbHp2eFRnVS9MVnNxMFVkZHcvajVD?=
 =?utf-8?B?aUxMKzAxVi9BM3ZvaUhnOWhYVWtCcVVqY2F3YnJpaWZzZHVoMVJJMDlrczRl?=
 =?utf-8?B?aHV3R25YYklOR005bkZ2RXJuY3I5TXM4K2V2SDhJS2E1YmdBYTlIa3h5dzhW?=
 =?utf-8?B?d1lvc21BbHlFd0tiUVlrSHB6UkFWYWxCYU5jOGdYcVpyc1JqNHF5L2NGaWhI?=
 =?utf-8?B?RmNzR0xrMjEwRldDRlppT09HcTFwQVl5SS91akM1UzdUdGZiaE16aThVREc0?=
 =?utf-8?B?biszSlIrMFRVajRCZ3UwVG9rRlViaEt6czJ0a3NadW80dUdNTUtvNmdHM1BK?=
 =?utf-8?B?TkFzMEk1N2FlQU00VFE0a28zZ2NrNWRiNUpmVktCUGM0K1JPVE8wbHR6aUdm?=
 =?utf-8?B?cU9tZWR0ZTVyOGNVeWc5TlYrNllyeHExa2JGbmdmKytSa1NhdVdrV2p0SU5h?=
 =?utf-8?B?TjJ4WDNtUmpXRXVBbmpqR0VUaFpKUnI3WCtqVzFaaS92Y0wybDVwcGxieGZj?=
 =?utf-8?B?R29kSmNYcnF5S2xKZndDcWo2cWU0c3NhZzRQWTh1azdUNDJZUFNFcnNueWl2?=
 =?utf-8?B?L0Vxc0R5eUN3aEw5eURJOCtpYi9JY0ZpMVJpdng1OUREd212RVRodEh0ZGh5?=
 =?utf-8?B?U3BKUEQ5L2E1MUlDd0tJNjZzREUzeGZPT3hrK1k2aXF5ZHBuM3ArMWdwYXl6?=
 =?utf-8?B?R3ZGUm1OVE8zWXFLd2JNUk9KeTNDZlZtMXRKZXhqMzBZTFd3UU1rR0dldWts?=
 =?utf-8?B?YmJlWGp5Q3B1MHpuK0RSY2l5REFYbElHdEM5TXNNNG8wTklMVHlOdjBKalp4?=
 =?utf-8?B?MGxwM2g1TTg1MkFOekdHQUpsOS9XNEVLUTNDOW1Va0hNU0ZyT0NMMzZISjhP?=
 =?utf-8?B?RE0rcktiY2c4cEZRcW1LRndZWUlQckRMajE3alFaNUNDN0MzZ2MydlNhTG5v?=
 =?utf-8?B?V3lEQkthamo4ZjJrR3g4YnZZM293NDMrMlIzRnVQMzgxQnVWZ2R4blAwYWhx?=
 =?utf-8?B?cElldHJNRU13Q05ua3FLdHNkUG1KaFRZbHlleDc1SkgxM29rRVJnUDRVbGdX?=
 =?utf-8?B?WjlOZllZMFJIbnVqWERtWUE4cHhTczJTOHcrOXZxdElPSVRDTFdrTzlJYVp0?=
 =?utf-8?B?eFRWMHkvdE5Ma1NmWGYzWkI0elpkNk41R1ErT1pmL0owTUc0MjZYb0tNVkcz?=
 =?utf-8?B?MnpNelExa0l6RE5ValV0Y3J2ODZRS01ZK3p3MUVMcmF5TVZ1SjNBa0oxL1V5?=
 =?utf-8?B?bnc9PQ==?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a154ff36-f95f-4e0a-ec50-08daf7cb0fdc
X-MS-Exchange-CrossTenant-AuthSource: AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2023 14:07:54.7122
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AaPS+5/W/W+kidEN6YsCt2Bsj5SmMfCR8xfSgoUHKPiagCFLXwHwYSU+xvJ2UsYsyo+8WTUKO2U0yPAgglMTkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB7083
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=selector2 header.b=IIb51DCO;       arc=pass
 (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass
 fromdomain=siemens.com);       spf=pass (google.com: domain of
 jan.kiszka@siemens.com designates 40.107.13.81 as permitted sender)
 smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass (p=NONE sp=NONE
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

On 10.01.23 22:14, Ralf Ramsauer wrote:
> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> ---
>  pyjailhouse/config_parser.py | 23 ++++++++++++++++++++---
>  tools/jailhouse-config-check | 30 ++++++++----------------------
>  2 files changed, 28 insertions(+), 25 deletions(-)
> 
> diff --git a/pyjailhouse/config_parser.py b/pyjailhouse/config_parser.py
> index e60b2ce9..2a59b651 100644
> --- a/pyjailhouse/config_parser.py
> +++ b/pyjailhouse/config_parser.py
> @@ -20,6 +20,21 @@ from .extendedenum import ExtendedEnum
>  
>  # Keep the whole file in sync with include/jailhouse/cell-config.h.
>  _CONFIG_REVISION = 14
> +JAILHOUSE_X86 = 0
> +JAILHOUSE_ARM = 1
> +JAILHOUSE_ARM64 = 2
> +
> +JAILHOUSE_ARCH_MAX = 2
> +
> +
> +def convert_arch(arch):
> +    if arch > JAILHOUSE_ARCH_MAX:
> +        raise RuntimeError('Configuration has unsupported architecture')
> +    return {
> +        JAILHOUSE_X86: 'x86',
> +        JAILHOUSE_ARM: 'arm',
> +        JAILHOUSE_ARM64: 'arm64',
> +    }[arch]
>  
>  
>  def flag_str(enum_class, value, separator=' | '):
> @@ -163,6 +178,7 @@ class CellConfig:
>                  if revision != _CONFIG_REVISION:
>                      raise RuntimeError('Configuration file revision mismatch')
>              self.name = str(name.decode().strip('\0'))
> +            self.arch = convert_arch(self.arch)
>  
>              mem_region_offs = struct.calcsize(CellConfig._HEADER_FORMAT) + \
>                  self.cpu_set_size
> @@ -242,7 +258,7 @@ class SystemConfig:
>      _ARCH_ARM_FORMAT = '=BB2xQQQQQ'
>      _ARCH_X86_FORMAT = '=HBxIII28x'
>  
> -    def __init__(self, data, arch):
> +    def __init__(self, data):
>          self.data = data
>  
>          try:
> @@ -253,6 +269,7 @@ class SystemConfig:
>                  raise RuntimeError('Not a root cell configuration')
>              if revision != _CONFIG_REVISION:
>                  raise RuntimeError('Configuration file revision mismatch')
> +            self.arch = convert_arch(self.arch)
>  
>              offs = struct.calcsize(self._HEADER_FORMAT)
>              self.hypervisor_memory = MemRegion(self.data[offs:])
> @@ -273,7 +290,7 @@ class SystemConfig:
>                      self.iommus.append(iommu)
>                  offs += IOMMU.SIZE
>  
> -            if arch in ('arm', 'arm64'):
> +            if self.arch in ('arm', 'arm64'):
>                  (self.arm_maintenance_irq,
>                   self.arm_gic_version,
>                   self.arm_gicd_base,
> @@ -282,7 +299,7 @@ class SystemConfig:
>                   self.arm_gicv_base,
>                   self.arm_gicr_base) = \
>                       struct.unpack_from(self._ARCH_ARM_FORMAT, self.data[offs:])
> -            elif arch == 'x86':
> +            elif self.arch == 'x86':
>                  (self.x86_pm_timer_address,
>                   self.x86_apic_mode,
>                   self.x86_vtd_interrupt_limit,
> diff --git a/tools/jailhouse-config-check b/tools/jailhouse-config-check
> index d6ea7079..95de6fd4 100755
> --- a/tools/jailhouse-config-check
> +++ b/tools/jailhouse-config-check
> @@ -37,8 +37,6 @@ class ResourceRegion(config_parser.MemRegion):
>  sys.argv[0] = sys.argv[0].replace('-', ' ')
>  
>  parser = argparse.ArgumentParser(description='Check system and cell configurations.')
> -parser.add_argument('-a', '--arch', metavar='ARCH',
> -                    help='target architecture')
>  parser.add_argument('syscfg', metavar='SYSCONFIG',
>                      type=argparse.FileType('rb'),
>                      help='system configuration file')
> @@ -52,36 +50,23 @@ except IOError as e:
>      print(e.strerror, file=sys.stderr)
>      exit(1)
>  
> -arch = args.arch
> -if not arch:
> -    arch_str = os.uname()[4]
> -    if arch_str in ('i686', 'x86_64'):
> -        arch = 'x86'
> -    elif arch_str == 'armv7l':
> -        arch = 'arm'
> -    elif arch_str == 'aarch64':
> -        arch = 'arm64'
> -    else:
> -        arch = None
> -if not arch in ('x86', 'arm', 'arm64'):
> -    print('Unsupported architecture', file=sys.stderr)
> -    exit(1)
> -
>  print("Reading configuration set:")
> -
>  try:
> -    sysconfig = config_parser.SystemConfig(args.syscfg.read(), arch)
> +    sysconfig = config_parser.SystemConfig(args.syscfg.read())
>      root_cell = sysconfig.root_cell
>  except RuntimeError as e:
>      print(str(e) + ": " + args.syscfg.name, file=sys.stderr)
>      exit(1)
>  cells = [root_cell]
> +print("  Architecture:  %s" % sysconfig.arch)
>  print("  Root cell:     %s (%s)" % (root_cell.name, args.syscfg.name))
>  
>  non_root_cells = []
>  for cfg in args.cellcfgs:
>      try:
>          cell = config_parser.CellConfig(cfg.read())
> +        if cell.arch != sysconfig.arch:
> +            raise RuntimeError('Cell architecture mismatch: %s' % cell.arch)
>      except RuntimeError as e:
>          print(str(e) + ": " + cfg.name, file=sys.stderr)
>          exit(1)
> @@ -162,9 +147,10 @@ if len(iommu_resources) > 0:
>                      ret=1
>      print("\n" if found else " None")
>  
> -print("Missing resource interceptions for architecture %s:" % arch, end='')
> +print("Missing resource interceptions for architecture %s:" % sysconfig.arch,
> +      end='')
>  found=False
> -if arch in ('arm', 'arm64'):
> +if sysconfig.arch in ('arm', 'arm64'):
>      arch_resources = []
>      if sysconfig.arm_gic_version == 2:
>          arch_resources.append(ResourceRegion(sysconfig.arm_gicd_base, 0x1000,
> @@ -183,7 +169,7 @@ if arch in ('arm', 'arm64'):
>      else:
>          raise RuntimeError("Unknown GIC version: %d" %
>                             sysconfig.arm_gic_version)
> -elif arch == 'x86':
> +elif sysconfig.arch == 'x86':
>      arch_resources = [ResourceRegion(0xfee00000, 0x1000, "xAPIC")]
>      for irqchip in root_cell.irqchips:
>          arch_resources.append(ResourceRegion(irqchip.address, 0x1000,

Thanks, all 3 applied to next.

Jan

-- 
Siemens AG, Technology
Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/a3144999-eb39-c18d-dc67-e38a5c2078af%40siemens.com.
