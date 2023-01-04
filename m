Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB2UT2WOQMGQE7KFGL4A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x63c.google.com (mail-ej1-x63c.google.com [IPv6:2a00:1450:4864:20::63c])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA2A65CFD1
	for <lists+jailhouse-dev@lfdr.de>; Wed,  4 Jan 2023 10:42:02 +0100 (CET)
Received: by mail-ej1-x63c.google.com with SMTP id ga21-20020a1709070c1500b007c171be7cd7sf21020931ejc.20
        for <lists+jailhouse-dev@lfdr.de>; Wed, 04 Jan 2023 01:42:02 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1672825322; cv=pass;
        d=google.com; s=arc-20160816;
        b=yMrDkWqe78/6WU69IOIebm6rafbcZQe5E21gx1Reh62GIEDzlqYHCZJtENWqte6RlT
         Gr54mGBDJdAJajULiLqZ/J50n2WQzuXJdMgiEdhMFM4u9JYJNmsjirpJNQ0k+QxPRfOZ
         pXxkRw+htYxvdqlqRio8JCEj9fj4Rm9OkAUMDZUWCfhFxAVQZgBB7iplHwnbhLAh0ylH
         FzKAUSAYL8TuFN98bu5JavjQv1QvNl0mSs1dyLj4Zc75Vq2lKj53ekVpwBgxZJs7+TXb
         2njz0HN2zxYaunCNwdfhZ1JX6QP1R6J2293b3U9Arfb6jshzdxRZyaLI8pZ8zGvQf1ZE
         IL7Q==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version
         :content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:date:message-id:sender
         :dkim-signature;
        bh=+93o1Px1pxc3k06L+wfZyg/ChANfGtngPb4iLH7tkXk=;
        b=q5NmTtq1xMgGaEwb7eAdBEyrIqiUn6gFb/VLOfdguk9xwP80PBNVNi1MfQwTyWYiED
         BbxacO73ekVuW6KnbNv1svv7i5R/9sPswA/ipPT1ZHvOOcurPWZ1Qbgz960nYgwbyomP
         oB/cPT8lNXuqtZmFl/Rfvslu28UMhT/x7PzK6E/+cWIW/Afki2DxuYhYmgWETWUAQQZC
         RoUmcLLF+Kt8383iuIruht2l4F5xpdiISnbjFrh3fdVwzK9Sz2Bx2pX/4gZquM4BD8B7
         XtvZ0pcaXUfBGKC0V5nvRcPu49Ceb+4FfQnTnSGyWzAAQV8PMLWz4a0uNk3NU2MsdCzh
         l4KQ==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=Hl2N3NU2;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 40.107.7.42 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=+93o1Px1pxc3k06L+wfZyg/ChANfGtngPb4iLH7tkXk=;
        b=c5OiLaybBSVVmv5IIkHSjf5tzNNMuDUWzLniJv/Jr/Y3q433R7wzbEm+IQaTMnkBBv
         Kzea0B47FPyOEVWw43PR744fO8TuwmzZgWao1YS9wmRB5oNjWODeH3yDzBEeypHhMcNz
         w2Oo/hfPjn4zzScJvFVvnuwCqn5UrtNPWXa3QrE9nHFLsGQ00pBUpZBPDCUqOHyYG7Bv
         wpVYAifyojaXJ8uhSD+TQ1QaQZNSy3N8+7JvfDjBs7FIVASxo4IJKsGv1RQGBXlc19CM
         hC/9C/fjZlUEvKfVYcWSb25NEGeoe+HUQrMPXThc3GiO9iEFBUcAMuc455KAww4Eg7ka
         1cmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:date:message-id
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+93o1Px1pxc3k06L+wfZyg/ChANfGtngPb4iLH7tkXk=;
        b=IIwubAR3KUjc5BwTDfsfRhIFbR/9uJKpM01v19TipXJFU58PHipau3MBasqicSaGoW
         aGNMOcAUahQ99gf0s/XaXQA31hX2bnmFg7gTL3jDI9QmnSks8ZKKTt1WKc+d2kUQgS/F
         cr/0EF6sjmRDN7C6S+0PKwxDnRtyjZCTSH/Gvfw2OWB46uxcqW/soe4bCjB3aA0QNnkS
         tkQitFna86RdCjXyMKCefJLahDPF7n1obI3NccbzadB2JAXn9wKy+ZzbIYZNVy/d7Qxm
         8BoIzKWpQknfrg18jUN/y7Cp1tvLck/bJU8E2m+iqNwtscLUOZCaGm/oWc+vVLtXaFub
         AMMg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AFqh2kqwxXw1ebTPNHHq4dsh218xGGHWqrfLvaP+HJPEMsrggcZM+woN
	bItLjXuV7sVT6PvyonO+kzw=
X-Google-Smtp-Source: AMrXdXsiWLq25wZn43LTjDG6c0GUnNqdyrT0zjjjKT6qUXurJX14FhpL7mkMLirGsDIFr0MGSRvTKg==
X-Received: by 2002:a17:907:7782:b0:7c0:e380:3d44 with SMTP id ky2-20020a170907778200b007c0e3803d44mr4009549ejc.498.1672825322569;
        Wed, 04 Jan 2023 01:42:02 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6402:40d5:b0:479:6c1:ef04 with SMTP id
 z21-20020a05640240d500b0047906c1ef04ls360202edb.0.-pod-prod-gmail; Wed, 04
 Jan 2023 01:42:01 -0800 (PST)
X-Received: by 2002:aa7:d7c2:0:b0:472:cee9:bbd3 with SMTP id e2-20020aa7d7c2000000b00472cee9bbd3mr42388930eds.27.1672825321063;
        Wed, 04 Jan 2023 01:42:01 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1672825321; cv=pass;
        d=google.com; s=arc-20160816;
        b=Ty2/xn1fZqaBVg2p/LUEFIO3xmy8+Fs4FVNgiTAnUw73fSygWw8/9Hq0t/fB81teWG
         OkDXoIL4k9E0C8nWJPPLAYqn6AIhf2PUdKTBvbyVBAz/tQhs9pkOx0Ema7JX5ynLcgGm
         dFfZiFB7phlKPGgUg5F/tDDD6sP30uQLpwR/4cqEN9VmZeMvwGo7dRk73xcFIMKQNhDP
         UhLDMa4w2RtxGqBmcROD+1uT1qz6HWyTXFioaoRfR1/VmVTHzdoEz86OTjPbIzV2Fj2f
         3UlWmVa1k4PHOK5n2M9tQkSVqvlBOwQxZw+r6uTIrDcAjM3cdbmpOFYtHDBnTguSHkCs
         yzKA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:in-reply-to:from:references
         :to:content-language:subject:user-agent:date:message-id
         :dkim-signature;
        bh=VMPrY+Cozohvs2iNPWf9qbxhktVYq1XefcCqLhZYHsw=;
        b=lnr+eBOk6nCCNZs09QXzCPafV2HOuZ/MeSD5gvsVIelxToNOgelpNq1eMXjWUCX+gy
         OVBLX5KX2eamFW6MZ4UbrIHzW9of/tUSihNIV0trUeNSnUuw3sCry2XND6FFBhCHhdGd
         mFmwmzId4D/eZW9bnLG5Z3xVYINpqWMXC4tP5hMfODl3re9hRfOwgQQFrqcpJJ1wFjRo
         L2PXhiDmk/vaVuKJD8Yzy3KI4tcVHHBN2ZYqCc6a6KzbznUVoccYhpmdXtz23YjmkG7U
         iEY0+8mUVqR5nhjwGFOwMpL/KY424lf4/mi9KvFBgh9tiB1uHqWCxqsK13PpdUczLvA+
         497w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=Hl2N3NU2;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 40.107.7.42 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on2042.outbound.protection.outlook.com. [40.107.7.42])
        by gmr-mx.google.com with ESMTPS id l23-20020aa7c3d7000000b0047014e8771fsi1214889edr.3.2023.01.04.01.42.00
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 04 Jan 2023 01:42:01 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 40.107.7.42 as permitted sender) client-ip=40.107.7.42;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JYyX1XbC+jQCSp+kpckNJWiRTtmnRcywfuDntSxiDe5Q+KzhatKyOQT2KuPxKTSr24RkaKPzNKllGqXBXkPUiQpVZyMqnpsH2I3jRywLhWqaDUKz6J+f1vAChnqEsPQ/5KACNXT7eFe7O2YqF0eIiS7etcVcug196rH0V+c1+UZam/QnpKkiZy7ST+wmW8MOODhmVMbVD++8emhBEoe/R9Y8vfA0CA3XInsUAnrEC6opAHBJ5OajGWBGpY72pRo7mOORKtUATFDGgzdfjlNFG5VNhswFMSvYdF/6Gy9VhcFEUBI0qWFbVle9gluedwwqUzoL2It3X5kTpg//HjPmrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VMPrY+Cozohvs2iNPWf9qbxhktVYq1XefcCqLhZYHsw=;
 b=CuACTny2kxm+STK9geNjDHOtI2JXAhgHyVXwQ2ElDrxIMuEMjNp7YeEe9KyadM6Gy9UomYuTHl7N/RtEloQaLTGzdXTfLpSJoX0OR6Vs9jPOgAED/24cmHjj+6GFQF9GpXka2/2esDmErRu/IXnAwNi5eRIK0/Y5fo+0Kb8EJez9xMn2umjkuSEsGUZYtMltJ99V1369hxOGPOieldBtsK2sRVM8vSAoljARItw4NhhD7atFXYctzsqSx/BRdAnUkg3mAy9g3Y4UTU//9x+omz9FLbmSW00CR+nE32uL7EWA+G0eEjTknSHIqZCgt319cHnsHxvtAlx2T8Fo4tM5Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
Received: from AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:588::19)
 by AS8PR10MB6151.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:549::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Wed, 4 Jan
 2023 09:41:58 +0000
Received: from AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::2957:50e8:8ce6:124a]) by AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::2957:50e8:8ce6:124a%9]) with mapi id 15.20.5944.019; Wed, 4 Jan 2023
 09:41:58 +0000
Message-ID: <fecd57a3-ce2d-f2ff-d2a0-a1d70fdfb43c@siemens.com>
Date: Wed, 4 Jan 2023 10:41:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: Sensitivity of hypervisor configurations to HW changes (x86
 target)
Content-Language: en-US
To: Jan-Marc Stranz <stranzjanmarc@gmail.com>,
 Jailhouse <jailhouse-dev@googlegroups.com>
References: <9dd4fcde-efe8-41f1-9c71-b50e6d3c0dafn@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
In-Reply-To: <9dd4fcde-efe8-41f1-9c71-b50e6d3c0dafn@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR2P281CA0117.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::7) To AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:588::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR10MB6181:EE_|AS8PR10MB6151:EE_
X-MS-Office365-Filtering-Correlation-Id: b3569128-264a-4b06-d863-08daee37ec38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MC0bS3Ge7f46vm7b0fJSXgRilI9FofI9BL9c5hYjOMzGgSnMRhtOV8rEuWIBhA8jrDGy2JtqrYxyYYMZEKKb8vwp0JETCTKWbuoaINEO/k4LShz0iE4+v0aKN6jDl/Hp895BPr+ZkfvAs+SKeN1dPhitVi/KkxX6iS0ka6fW1n/Ol65wmClOCC2Xp/aq0G2JK1ZALDGS1teycnfhAAqjqrZglsNRwyGHgkUGrfd1IIOYGoZsed61gmx7NjwfKSS1iwIRdyCsWDJ27Kznkhrk4AW7BCUgqCH9PCcp7JsA40WVaFFkFzcJJE0OymdZ6mxLjhgws/qGaDRdKNdhQRxHOyM3X0Tkc8DSAQjIX8uuCCrKVLt4MD9oEgXetjuhHz+cZUnozZQGcmUgPnrzooGM06Yhw4wADHpn7lueLAKYW9EPuRPi1hPvNemy0P/8ZFwcD95osjT3w4e9H9//evpcEwVTiXUwQg4H6hYBosHATtw0gk5UWRUFUoFk3gXBzcfZKGA3SOyXGLov+aHWzb7al5C1Wfbh6589PhoetcDoKCvKU9ECaEeYiT3toXeRKnsmFr5Tsq5pe8OWXH+8fZxN9ldo3Axx4iBwrA5jw0EFudX6XkDYAv3h+P8eakg7MOgMrV6gSJA9VYGGdqlY0DLvE9HfREVcDdgVBxN8xISDy7FnbpYD+NLm4+uq6V/mNQbBa+OL9H+JQb7jJVXgM7eZgJrE8pX5Aoq58OpyrwvlMsk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(366004)(376002)(136003)(396003)(451199015)(83380400001)(5660300002)(8936002)(2906002)(44832011)(41300700001)(31696002)(86362001)(36756003)(82960400001)(26005)(110136005)(186003)(6512007)(6666004)(316002)(31686004)(6506007)(38100700002)(53546011)(6486002)(2616005)(8676002)(478600001)(66556008)(66946007)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VW1waURhWS9QL2p3KzhRYndJMXFZMWQ0YlhIa3pGYTdyeHczRlNjd1RSbzdy?=
 =?utf-8?B?MUFHNVROdndkMzVETHhTaTFQc0dXZnM0QlZUamkxUU10SGUvb3BYdk1CZjUv?=
 =?utf-8?B?eEdHV1N5QmJNTGdYdGFuSExwVjRwSjJrL1o1ZEpzdlNSODVzME84SndzTFRQ?=
 =?utf-8?B?bGVPSFZoYWx0MHU4TkdtSUxXemJLNGZ6WG9HM1dvTEo2aGRjajV4eUFGeDcx?=
 =?utf-8?B?a2pZMHgydHVya3lMbXdIYzRUcmsxSEtMVytaVTJ6a0o2dnhhUDlVR3pUYmgz?=
 =?utf-8?B?ZjcyRDQyem5FYXNpVWRSSlRLbmRIQUVwZlRUY3dqNTFobCtnUjFTdVMxcUZu?=
 =?utf-8?B?Z08zNjlJRFpoTmRoWDZIYm41dFRJTFliMTMxS3pZaGpiWkNqL1JFR0VsZFBt?=
 =?utf-8?B?K1QxK01DWGhNY0pwQ3ZOZW95SnVoVEJGVmphSUhMZFpIMjhLV242bUtSSlll?=
 =?utf-8?B?UlpLMkhlbUF3N1FFZFJMUlZOK2JtTkxBSTdnZHczd1JNaG5GemJWSkt5Q2xM?=
 =?utf-8?B?WGc0YTRvdEI2YUNTN3JsNUtwL2R4VG42MDVwcG5ZU0tBejlNNHVOQmhoVlc2?=
 =?utf-8?B?M3J2cHpOaXA5WlU5U2lxYy9xcGZ6Z0xqSDZjZWtLK1dsZEdwWStqNGVTTnZW?=
 =?utf-8?B?bzk3VTQrVkg3d09IRHcrZXFJbllqZGNZaHEyNkFyZllNK2JPTWtwMENvbnpo?=
 =?utf-8?B?RDhxYWRGNnZFZG4zK2Q3TndpTzV4VS9WWHRWOUIxbld0Nmd2UkN6Wm1idTQv?=
 =?utf-8?B?MTJZWnFuWDlFZnR4TllBK0xlNnJCZlJ4Y3hpU3V2Skp1TFRBSkQvVmVsTTMz?=
 =?utf-8?B?cVUreHVjcjJlV1NiSEJjdlArNTBMVEV4dHVHZm1oVEZQUHpHNDlLdXRtMXdE?=
 =?utf-8?B?TWNVdGtOVjlNQWFMOGtUYllPVVp3eFBNQXEwOW92Y2Y5WkNiUjhQR2kzNUZV?=
 =?utf-8?B?NUhVSFVxV211MDBmTHk3TnU1MWkybFRCK1RFaFJjS1lFb29xSDJoeVJRM094?=
 =?utf-8?B?VXJaWURXdEZ0Q3RxU05ubjdPRGkxZjVFdHJ1Mi9lcE4vTmM0eUFlNE1mM1Jl?=
 =?utf-8?B?TUZOajVpNGF6Qk9FdXNaeHFsazVVUk9kTUdxNHdnZDE1bW9lZEoyYmg3amRJ?=
 =?utf-8?B?dGhDS2pXbkFqMWRXZi92bTFjWklyVmgvdkJXbjFOWmZvdjI3Q2VwaDZlTkdS?=
 =?utf-8?B?Yjl6QXJOeVVVQTlTQkdxeStWblkyVlZESkZJejRFall6RU5kdFExRjhqRzJq?=
 =?utf-8?B?Y2szUmNlbEFRZWVQclBSYzFwajQxQzEyWmlxNDJyQWlzeUVwN3d3aHJjaHZa?=
 =?utf-8?B?Tzc4SHBlQ2pVa0hMaUdwcVVTd1FwaXZDUEoyZTlNMWN2WlF0ajF1OEtOUGhq?=
 =?utf-8?B?VVB0VUNUSjg2VW8rV2RXU0RJMUJnS1cvemMzQ1dHNnZSYzB4WmhDbzhQUktp?=
 =?utf-8?B?eHMrN2FwQlBJaVlLdkxvN3RJVGZJRldrcUVMS29XSWd1bFlzbytib0dhMmR6?=
 =?utf-8?B?T3F1eTk4MVhUb0Z1TkJQNjBjMlUxd29ibXZhZExQWUZpc3RCVVBwRUlFaFBT?=
 =?utf-8?B?aE9nSFI2TC93clhDcmpBTzE4VUd4OVNTdE83U2ZTMkZlNUVtWEhaSFZ3dVNU?=
 =?utf-8?B?dEo1ZmYweExkMlFJL1JrUStjV2FneGs3U2V2a1l5QnNCa0treEw4RXp5Zy9s?=
 =?utf-8?B?dmN6UStFcG0wRDlIWXRpQkZrM0ZzVTViWWdpeVByN0FHYVdmZUhTWklydzNO?=
 =?utf-8?B?bzkzRjVLbjhvOHBPdXJoYWJEcS93ZldoVTJ3ZzhEUE1raVdhcjZsMDVta1ZW?=
 =?utf-8?B?V1JOWkljT2k2Y0crUURGZDZHazJHTnFhV2xRWU8zM2Zpc0N1cGQzVGZ0Q2xW?=
 =?utf-8?B?ODdXbXRYZlpwTHcrcVVhbG1pZUNsTTRSdzlZY2s5dGFzOWwvelJMYzUvWEtH?=
 =?utf-8?B?aWRTUGFVM05iamVxbEVoNmYvUzJhd1c5Um9VbXBBYlFhQ1RnYVljd3RMdUIr?=
 =?utf-8?B?bm51OWRsbjJ1L1pyeGQ2YjBJQTJSVFJ4K0ptSjRGaWltTkU1TjhIbWNZcW9H?=
 =?utf-8?B?dHdibE10c3pWSVBGanI4cndwZmVKMGRrMFA4ZWUwK1FaMnVUQWRUWGtvV2Vk?=
 =?utf-8?B?ZFEvdmdqdnlZR1JLUTMwcEJQQmZxUjlRSFhKNEwxcGc5bmtlemNXRE9CU1pa?=
 =?utf-8?B?SGc9PQ==?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3569128-264a-4b06-d863-08daee37ec38
X-MS-Exchange-CrossTenant-AuthSource: AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2023 09:41:58.1512
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /QxIZY9lCLfbBaHfr8yVrRguet7VEOLn3WapkJVAA6K9MQD4PX6LunSJc0bRepqCEQJXL79X+1Ooy1LNi2fmiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB6151
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=selector2 header.b=Hl2N3NU2;       arc=pass
 (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass
 fromdomain=siemens.com);       spf=pass (google.com: domain of
 jan.kiszka@siemens.com designates 40.107.7.42 as permitted sender)
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

On 03.01.23 14:39, Jan-Marc Stranz wrote:
> For the productive use of the hypervisor "Jailhouse" I am concerned
> about another topic: "Sensitivity of the hypervisor configurations to HW
> changes".
> =C2=A0
> I have already created the hypervisor configurations for 8 different x86
> HW targets (evaluation boards, industrial PC's, single board computers,
> ...) for the root cell and for up to 2 guest cells.
> =C2=A0
> I also "cloned" some HW targets; however, I was scrupulously careful
> that the HW (RAM, PCI devices, BIOS version, ...) was identical.
> =C2=A0
> To duplicate an x86 HW target, in my experience, the following
> components must remain the same so that the hypervisor configurations
> already created can still be used:
>=20
> 1. CPU model and architecture
> 2. RAM memory size
> 3. PCI devices (including M.2 NVME SSD!)
> 4. BIOS version
> =C2=A0
> For mass production based on a Single Board Computer (SBC) some points
> can easily be kept (e.g. CPU model and architecture, PCI devices (except
> M.2 NVME SSD), BIOS version).
> =C2=A0
> On the other hand, you can't guarantee that you can always use the same
> type for the M.2 NVME SSD, for example.
> However, the change of the type of the M.2 NVME SSD, which is actually
> imperceptible for the user, will possibly be noticeable in the
> hypervisor configuration (e.g. different PCI capabilities).
> =C2=A0
> Another problem is the deviations that creep into memory and I/O layouts.
>=20
> Are there any experiences and practical solutions regarding this topic?
> I would appreciate any advice on this!
>=20

As I suggested offline already:

If you don't have control over checking new hardware combinations
/before/ they go into production, I would consider adding a
post-production check that runs 'jailhouse config create' on the device
(or outside, against what 'jailhouse config collect' provided) and
compares the generated reference config against an earlier version. On
deviations, an engineer would have to look at the details.

Jan

--=20
Siemens AG, Technology
Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/fecd57a3-ce2d-f2ff-d2a0-a1d70fdfb43c%40siemens.com.
