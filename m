Return-Path: <jailhouse-dev+bncBDGILGE54ELBBU5K7KBQMGQEB45RTTA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x339.google.com (mail-wm1-x339.google.com [IPv6:2a00:1450:4864:20::339])
	by mail.lfdr.de (Postfix) with ESMTPS id 58202365484
	for <lists+jailhouse-dev@lfdr.de>; Tue, 20 Apr 2021 10:48:20 +0200 (CEST)
Received: by mail-wm1-x339.google.com with SMTP id j123-20020a1c23810000b02901384b7122bcsf760731wmj.6
        for <lists+jailhouse-dev@lfdr.de>; Tue, 20 Apr 2021 01:48:20 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1618908500; cv=pass;
        d=google.com; s=arc-20160816;
        b=Oxf5HG/R5xox5Gst9DFQ8IHQpTr3E/Jf31VhWD3VOw0LHS4yRVMrL/7ZAPB6kl102o
         lqpri/im/BSLz/U8uDWKYQyA7BiIFUB2juPjwfJZn/Ty3Loq6nNaPRkIAraBT84kV+pV
         Q3TmTqZ/zpzn7ptT5UNLC//h737cVQXwkbIIDeJWBIbCAmZ6h+xQxiCBODEpaCzYGqRH
         IrUSN9AyFulfLb16Ekya3DgEqTLtjr6SCXlYCNNlFljMTJyQdbpmLkYoLnqLcH4F97jI
         JVZBIUOmEy+QHaQIcLFex3zCEAyvYXlcYaokWB/rJqzkLu25ICPijbTw9eT2CNQOOvol
         ryRA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:sender:dkim-signature;
        bh=psLHELy5yiGlg0RTY2IqTk6k2XPyezNBBNUxVqPCP8E=;
        b=dAyGHC9LXYamQIWYT8jPqXjLoKhWDotSin1iv3yuJHXDvVJatPMOt97Lp2REXQCLVL
         7Bx9oo6zShH3lri5mys0uXRcjpxiGJGAWBIebnnhx/eqhNmeItHfBcRqVIcBFp8AhmYw
         Pj4QVoFLqrPbsGrIUSkVPJMRWkEAdPjXpPdnEvaTKCqCWwboTndxbzLtxvjPNyGwGxZ+
         Kez2x9fwNEq81YeX8+aGyjrRSvysf/jEktF7GfKYgRzW7YiIWhAim6g5534FTQ2Kvykf
         cXPe0a9NQtYsZv8Pd5ZAWGIbID9UP/rzekDd4drZpuDDIcfr81/zfkugyyj48++6wQze
         S9IA==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@prodrive-technologies.com header.s=selector1 header.b=bcc0olyd;
       arc=pass (i=1 spf=pass spfdomain=prodrive-technologies.com dkim=pass dkdomain=prodrive-technologies.com dmarc=pass fromdomain=prodrive-technologies.com);
       spf=pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com designates 40.107.5.136 as permitted sender) smtp.mailfrom=bram.hooimeijer@prodrive-technologies.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=prodrive-technologies.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=psLHELy5yiGlg0RTY2IqTk6k2XPyezNBBNUxVqPCP8E=;
        b=e0+LAV9Ho8G93InsotWQvQQ6/I0LIruIzBJSXHVta0uFGDsVzvcHvddZhI3oWRjA/C
         EX1YRSU2MXR6H1tnGmYEIHYUkTEeUIojNYAc9oQr7VUip8eLbixmJHOuhOzrx2VWbT/5
         dGJUy+zTZHlaK/8471khI3ZQCY3M5dEaLezAxOr3+XE3vzDULes0UF30perZfgULgtfX
         C/RkvXfjp396F6/yviHrIQ3JADYypoWRATGQSZ7srGHowVKZPGJ8+ntlDgIGh0wkxztN
         1AY6ZTmzPHXPhpUe2WPjmDVMw0N0d7Fr3HAqdosetcIG+Pm8tsdRjUduAhIRfd3O2y8P
         O1OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:thread-topic
         :thread-index:date:message-id:references:in-reply-to:accept-language
         :content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=psLHELy5yiGlg0RTY2IqTk6k2XPyezNBBNUxVqPCP8E=;
        b=EAyxUGj6s289attB2lBVd5QQCB0J4aqYy65u9SjqyVhlBDSJ3UXx/ZmhFAbkpxc9WJ
         sMuxpI0PMyG0JcjBHO+orz1GH/L4isx6i5smWMT7+9ysSbKMg6cjhZD+kDHVFZ6Tn7ZO
         3wnmWeVcfnUdBUXEy12Q96wP+N0tCDUnWwfoasBec+lewVwNmhETunPJdnhOcI+FKcAs
         Ff1vIU5jKx4WhZFAesKAiU2MapKN4q4iza3U9k8CnCvJ8qjQlnnsuZzMTj0yZ0ZEAjWJ
         QYE7HzWFtnrDKYI/3s9750L71cl3w8mplCGWFKbrQ1WFtU+HgLBRByOqJOC02TUsdfSJ
         MCNg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532kmLs7iFWz7hZdk/zEuS2Jc6Q0rhJuXLBlS/9uFUDnoIoVILrC
	uVlh38PWAjUz+mtpk4hqb0U=
X-Google-Smtp-Source: ABdhPJxB19sLzMZ7CEeNmPokCLs03Ujq7CATGrGluaqYupdWkvtQd1En+SF0bp9EuJgP2SlGGKOVqg==
X-Received: by 2002:a1c:e906:: with SMTP id q6mr3306211wmc.138.1618908500110;
        Tue, 20 Apr 2021 01:48:20 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:11:: with SMTP id g17ls1175713wmc.3.gmail; Tue, 20
 Apr 2021 01:48:19 -0700 (PDT)
X-Received: by 2002:a05:600c:d9:: with SMTP id u25mr3301651wmm.151.1618908499299;
        Tue, 20 Apr 2021 01:48:19 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1618908499; cv=pass;
        d=google.com; s=arc-20160816;
        b=dGxYtOwwCy+nnShBv8AO9vhceAKq8/TCGK/r9rXQ3jhcwU8+1c1tK4u3gwQPF2TeWC
         LhxKxoxBd3xLMDpNQOskUb+XeZ8giEim1ORAyXTqRRlRs34NNMEQfFgYW7lV2f9JfJp5
         Fwf1tZwDH1msLhAEdzXQ+66w1K+/Oi17fRJAVTNNK0EftsnWaA80wg90c2N+gv6usCPy
         taF3JNEn9Ak+HZXxG00YG52OnDp/iWFny43EnvgBbS4MR5K77NkHCqHoMC+wDXSyfYb7
         dNYycZQtL94tBBjYS5QB/issiH/tm0ByK9630g+lDMolkbLms3ze7dk/3iCl1MV2PJSt
         JmAA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:dkim-signature;
        bh=/qzmK4Vx4n3WazNGQPdeAnR2xHFViSDewC+aJ+WM6d4=;
        b=yNYcWpBaXgOWWAZJvcpdjltmSk3HD/7hyTE4GBqWxCIK3fbNJbBgaO+SecqjccuaVd
         dDTHVZuuG4lilWIsMRMd3ZZT+z+zQvDJttZNWltw8NaDGO/HzbifSC44opXUEDWMgdb1
         XYr9kqT1UI2DuReBx7GG0OSSVizD5/4Hfglrqj2cVtLnu2xeym3A4J1VuxVYF89KNUYZ
         36ojdmQBsir2I4qUurHEa2dweWM1QDR6wSpf+CWZOju9DBJrL91Mq4tQB8WjR2kx0aSS
         Qp5gaGUu3+gXHBTZqMLyZRBI8oUfBGctgXjclfWxKIJPw5J1j57H9e4Cippu7tXuiWfZ
         LPYw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@prodrive-technologies.com header.s=selector1 header.b=bcc0olyd;
       arc=pass (i=1 spf=pass spfdomain=prodrive-technologies.com dkim=pass dkdomain=prodrive-technologies.com dmarc=pass fromdomain=prodrive-technologies.com);
       spf=pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com designates 40.107.5.136 as permitted sender) smtp.mailfrom=bram.hooimeijer@prodrive-technologies.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=prodrive-technologies.com
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (mail-eopbgr50136.outbound.protection.outlook.com. [40.107.5.136])
        by gmr-mx.google.com with ESMTPS id c6si159379wmr.2.2021.04.20.01.48.19
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 Apr 2021 01:48:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com designates 40.107.5.136 as permitted sender) client-ip=40.107.5.136;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TCJRrooS8n/m4MW5vmkWOafL8nWnANfPQiu7i8iOUThgryoj3eKBcm0J3TQDJXWUUEIkSIW8S07of/Wr3bgNFT+RL6M2UXhptSZ4ZYeetbmuratVPK2xKleMC/5V+ZS1grqshNKPkUQIi3U2zUusuV70heMhsAMIDzuR5CKxNUenNqesC+U9DeTIOQrGrG+WsgA2ffJH3BBtD4Xq7JqDsPm3w6mCZpLP8cC6URow7vuM445zoOqJoEZA3jzqIwRtFatwm471lYmgqCK3XdunHOVZhGedNNvJdIOJruqwXPtjFqh8POYEuYkzkGT+wVIctApPhoiy/7pT00aXQngzVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/qzmK4Vx4n3WazNGQPdeAnR2xHFViSDewC+aJ+WM6d4=;
 b=BWzSMJZrUyIA2ghfymnJKKW6CcCbcdso5KM8HFt3eAnBjQEHBweieqPi+i3J7M4jDo4Y1eh/L439C7LKlkEO0Y7aapIFOR7LxjD3JrGrDlvzdtblVAkn3JUTuPby+ee1LGcJGda8P97ScCs1o5RSR1kQ+lmzRTv8lOu9ixwGN4lSL39+aMx+ZL9sSjdEiExW1nmMJdaZhuRcluraPQryclp43lAJMcwvwDmkVkfO+i0vj3LWpMmMyLybqPuDqe3RG7HnXm4XCdBL9B+MzGYC8jp+80ys24gozOabDyyF47snFbSAs3A24S8lQMP3qX0kOF+xsf5wNAT0Kjg//kvdBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prodrive-technologies.com; dmarc=pass action=none
 header.from=prodrive-technologies.com; dkim=pass
 header.d=prodrive-technologies.com; arc=none
Received: from AS8PR02MB6663.eurprd02.prod.outlook.com (2603:10a6:20b:257::14)
 by AM7PR02MB6370.eurprd02.prod.outlook.com (2603:10a6:20b:1bf::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.19; Tue, 20 Apr
 2021 08:48:18 +0000
Received: from AS8PR02MB6663.eurprd02.prod.outlook.com
 ([fe80::69b5:15e2:476c:e151]) by AS8PR02MB6663.eurprd02.prod.outlook.com
 ([fe80::69b5:15e2:476c:e151%3]) with mapi id 15.20.4042.024; Tue, 20 Apr 2021
 08:48:18 +0000
From: Bram Hooimeijer <bram.hooimeijer@prodrive-technologies.com>
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
CC: Jailhouse <jailhouse-dev@googlegroups.com>
Subject: RE: [EXT] [PATCH V2 1/1] inmates/lib: Add zeroed alloc, and update
 usage
Thread-Topic: [EXT] [PATCH V2 1/1] inmates/lib: Add zeroed alloc, and update
 usage
Thread-Index: Adc1Pf6cejFfr7A8Qn6nGaU/HEIuXgABCREAAB+ChAA=
Date: Tue, 20 Apr 2021 08:48:18 +0000
Message-ID: <AS8PR02MB66635D8DEC85910F04F0ED27B6489@AS8PR02MB6663.eurprd02.prod.outlook.com>
References: <AS8PR02MB6663931DDEBBE7D87BFFF808B6499@AS8PR02MB6663.eurprd02.prod.outlook.com>
 <da05bc0c-c47d-f8f7-df61-339eb97a9cc2@oth-regensburg.de>
In-Reply-To: <da05bc0c-c47d-f8f7-df61-339eb97a9cc2@oth-regensburg.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [213.127.64.7]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 97035a8b-4009-4e41-e74c-08d903d90b43
x-ms-traffictypediagnostic: AM7PR02MB6370:
x-microsoft-antispam-prvs: <AM7PR02MB63709E3EFAC089F9134E834EB6489@AM7PR02MB6370.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1332;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: p3WAxcpQ7xgZX7JOBqQ9fZzoJoUdnR6DWfSXcGggDT74LWT8mfYHrnseGAGq8YaF4V1TUbneqMs7+u0oHf+of2fA8Hol5Sot49w8iTdUkrLyWUNgm7xUhghF4iNp/LLGRBxrLvXhVoscnlHaZ6z1K/xvDzrTcm/ykyZ3sTKPlL5D99b5pkBtq2d7bYH0yeWEqY4rJoq6A6lvo2xe34iQZoNl+FPNARKf9cRaZ07sHojNvA5I3wxi/kHA/f4j6d6WL1xS2VxTGyohhqOUZiSvMdhskACe4YJ5DIB0UFHIiodFFRpuJOyARSNad52MlbL171D59Gv291slcHarxtnPkLG9/qC/NXDgyZTDaMCHL6MAzV9UDyNwWMFKtkgE6ZFpoMaScRnQRrlOsEVNqrHb/X4809gieO5kGhA0DoU02QDPjAp/62ERqjmk8NkEyZ6HkUgyKmLvff7+gU8Vqot0OZD6Wa13l3Mi7e+gesJzcfWCvlICFapMwSHuvjJzXhDFfBXWDxW9GydgNV7jad7fjbzHmS7T5k4QPtXS2psh99k83g/o+N9eU+0pyAFlfD0LSNgdEaVJ/BNldwkooaeNwGByfj7X3eo/618xMK/8m4M=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR02MB6663.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6506007)(53546011)(6916009)(5660300002)(66446008)(4326008)(83380400001)(66476007)(26005)(186003)(64756008)(7696005)(71200400001)(33656002)(8936002)(55016002)(38100700002)(66556008)(66946007)(8676002)(498600001)(122000001)(9686003)(52536014)(2906002)(44832011)(86362001)(76116006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?RHlkMVNGTzNSRy9oMHB4Y09XeHpzcmV3UnE1SDFCMVhCMTE0c0tYREEvUUpK?=
 =?utf-8?B?cTUxNDFheWVleXN2QjMrQlM0Z0ZreWVJOSsrZU4xemk5bVV0SVk2MEd3bktz?=
 =?utf-8?B?d0p4c0hqRGNZcjk0OHRwSEk4bGpISHl1WU1RUVVWb2dJM0JYeFBCNDBqVkdL?=
 =?utf-8?B?alR2RTFGbjY1YTJsUU9jaDNMek8ybG85ekdHOFdBeHRsM3lueWVhT1FsMUZp?=
 =?utf-8?B?ZGxIb2hDbCtuSnpBMWF5SzEwaHVuSEJqT05PQ0c4UUNRQUlGemVXUm5Vbmtq?=
 =?utf-8?B?OHpxaUo1QjBGWmVjdTdPTHJRN1U1a2l5QkJjdVZxMUJLSWJKNm44ZEdja2U4?=
 =?utf-8?B?WVUyYmVHMWVkWnMxMnk1N0Z3TFdCNkJmS1gvL0xqTjVvWWdMVTFsSVQwNjlS?=
 =?utf-8?B?cUtqS3FmNFk1RzEyL3dmaUUrVWFSOTNSNklYWVVuZnVtMkh2dnBrN0JQa2dy?=
 =?utf-8?B?dWtQT2d0Y3pKZFAyNXRMZnpyODlnYlJLeDFPdDZlZmlqeWdCQzNOR2VzRENh?=
 =?utf-8?B?UWhKYjFRQW1JQ015b3ZJOFdjQWJLNXNNVDgwOUpYaGJFN2I4cTgzTzBIMmdD?=
 =?utf-8?B?YUt2M3d4eDBNTmIzNjRSM2pEOTFCVUMvNTJ4NHN2bFVpYXVOK1NJK0liR25C?=
 =?utf-8?B?MG1JSmRIT2J3ZDZuQUlzTHJUK1lreTM4Z21iVUcrb0FXVWlaVU1SZEhHOE1C?=
 =?utf-8?B?S0xrSHZXMlNpWEtZS1dhSnZ0MlMrbjJYdURzUXk5UU5tZXcvU0x2aVJZQ0NN?=
 =?utf-8?B?RFhuL2JuRmJvME9ZbGpoTzlmRDdmL0tINkhaQ1RZYUU0SDd4OWwyZEw1bHFI?=
 =?utf-8?B?Tm1zcnIxQWhEaDhMdlpxc0NGTy9KUTVZbXdZTDFzZ3dRbEpZdUN2c2poLzBS?=
 =?utf-8?B?NVVENXRrdlV2RllkUlFPNTBMcjRFaVZmOFoxak9PY2JtSHNBd3RKVFRPZDhn?=
 =?utf-8?B?bjk5QUVIOWFLamlKQmw1V0RlNHgxandkVUVseVp0ekdSN0tjMlhFOWlYems0?=
 =?utf-8?B?SGRDRTRRL0pUSlE2UERHeTYzK29DOElxSDhWcFhuRDlRUGVRUUlETEJ5azVn?=
 =?utf-8?B?ZEZkckljQ1FtNDBTTU05WGxoa0ZlekxkRkp6R0Z4em9VSW5NbFROazFNZUE4?=
 =?utf-8?B?VlpsZnlPMGs0UVRRdnJodWc1dkNKTDRabU5jWXNMd3U5eVczbEdOUTF2ZENq?=
 =?utf-8?B?aDRZTDB5Wk5qZUw1aTlEeldtalpiUUVlKysybTN5UzBpVWU3dEoyRUJlLzBH?=
 =?utf-8?B?dEg0b2F6MUFjdXlsWHEwY2E3MllhNGlmWjBMUE5JaXlpcjdhdGFGdjRDMnJY?=
 =?utf-8?B?U3d2dkVvTGM2ZWxaOGdCTWFrRlZoM1duWXlRcnVLUUdzVXdrZFY1bUZNaDdh?=
 =?utf-8?B?L3F5NjZrNk82OVNkUUVtcTQrOHFWTU41eWhXbFhta0hHcVUwRXZnVE1HdUEy?=
 =?utf-8?B?bFRPY0cxaDZKWVJvcE03ajllbGRqSW5IODJFUnlhaStxb3JkUTlsaXkwMFJr?=
 =?utf-8?B?OXIyZUNmbGlaV2ErVyt1RDdEd0FxV2JlNk5tY2c3REJ3amU3aGUzQUYxZjJG?=
 =?utf-8?B?YWFOMDdGK1RvNmUrL1N4Y2U3NEVoZUxmSi9KMnVKMHZCVWp5dDNoWDYvQmdy?=
 =?utf-8?B?dEFtcGhLYjViS3p0ZThQaGg0dGsvV1lmcGZVR2p0L0VTVFQzNEsvbXYzL05N?=
 =?utf-8?B?UHUrQlhxeWNlcC9td3BlQ3dCNzNhd0dnRnpBNGxnZmNlT2pVd04wVmJJY3dK?=
 =?utf-8?Q?h2a2oHoziKtDNQ7K/w=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: prodrive-technologies.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR02MB6663.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97035a8b-4009-4e41-e74c-08d903d90b43
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2021 08:48:18.0804
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 612607c9-5af7-4e7f-8976-faf1ae77be60
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Xv9WNkubuZh1j9NsIFlZzywMhRbg4w5E9G6q5WsAsSftExGESYz2T7TTnnANOnfAEoVT1fn4DAVUixx1pcj28qw/nNTT2AGYlLjBQPig8m5B+C2xvNSUqbK+1LNWedaxuYh7JIlshSG24tunmkU2xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR02MB6370
X-Original-Sender: bram.hooimeijer@prodrive-technologies.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@prodrive-technologies.com header.s=selector1 header.b=bcc0olyd;
       arc=pass (i=1 spf=pass spfdomain=prodrive-technologies.com dkim=pass
 dkdomain=prodrive-technologies.com dmarc=pass fromdomain=prodrive-technologies.com);
       spf=pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com
 designates 40.107.5.136 as permitted sender) smtp.mailfrom=bram.hooimeijer@prodrive-technologies.com;
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

Hi Ralf, 

> Hi Bram,
> 
> On 19/04/2021 19:09, Bram Hooimeijer wrote:
> > Adds zalloc(size, align) which allocates memory and fills it with zeros.
> > Replaces usage of alloc() in inmates/lib with zalloc().
> >
> > Motivation is that use of alloc without zeroing in mem.c:map_range()
> > results in illegal page tables if memory contains artefacts.
> >
> > Signed-off-by: Bram Hooimeijer
> > <bram.hooimeijer@prodrive-technologies.com>
> > ---
> >  inmates/lib/alloc.c                 | 13 +++++++++++++
> >  inmates/lib/arm-common/mem.c        |  3 +--
> >  inmates/lib/include/inmate_common.h |  1 +
> >  inmates/lib/x86/mem.c               |  4 ++--
> >  inmates/lib/x86/smp.c               |  2 +-
> >  5 files changed, 18 insertions(+), 5 deletions(-)
> >
> > diff --git a/inmates/lib/alloc.c b/inmates/lib/alloc.c index
> > e68e6cc1..f4c06571 100644
> > --- a/inmates/lib/alloc.c
> > +++ b/inmates/lib/alloc.c
> > @@ -5,6 +5,7 @@
> >   *
> >   * Authors:
> >   *  Jan Kiszka <jan.kiszka@siemens.com>
> > + *  Bram Hooimeijer <bram.hooimeijer@prodrive-technologies.com>
> >   *
> >   * This work is licensed under the terms of the GNU GPL, version 2.  See
> >   * the COPYING file in the top-level directory.
> > @@ -47,3 +48,15 @@ void *alloc(unsigned long size, unsigned long align)
> >       heap_pos = base + size;
> >       return (void *)base;
> >  }
> > +
> > +void *zalloc(unsigned long size, unsigned long align) {
> > +     void *base = alloc(size, align);
> > +     unsigned long *p = base;
> > +     unsigned long s = size / sizeof(unsigned long);
> 
> What if size % sizeof(ulong) != 0?
> 
> We don't have that case anywhere at the moment, but you introduce the
> chance to return some dirty bytes for the sake of optimisation.
> 
> > +
> > +     while (s--)
> > +             *p++ = 0;
> 
> I understand that this is more performant than calling memset, but I
> recommend to avoid microoptimisation here. If you really run into performance
> issues, then improve memset().

Fair enough! Maybe I'll go around optimizing memset at some point, but let's keep
it simple for now. I will send a new patch, with your proposal basically.

Thanks for looking into it. 

Bram

> 
> So I'd recommend sth. like:
> 
>         void *base;
> 
>         base = alloc(size, align);
>         memset(base, 0, size);
> 
>         return base;
> 
> The rest looks good! I don't expect anything to explode on untested
> architectures as well.
> 
> Thanks
>   Ralf
> 
> > +
> > +     return base;
> > +}
> > diff --git a/inmates/lib/arm-common/mem.c
> > b/inmates/lib/arm-common/mem.c index 5951fafc..5064b002 100644
> > --- a/inmates/lib/arm-common/mem.c
> > +++ b/inmates/lib/arm-common/mem.c
> > @@ -56,8 +56,7 @@ void map_range(void *start, unsigned long size, enum
> map_type map_type)
> >       while (size) {
> >               pgd_index = PGD_INDEX(vaddr);
> >               if (!(page_directory[pgd_index] & LONG_DESC_TABLE)) {
> > -                     pmd = alloc(PAGE_SIZE, PAGE_SIZE);
> > -                     memset(pmd, 0, PAGE_SIZE);
> > +                     pmd = zalloc(PAGE_SIZE, PAGE_SIZE);
> >                       /* ensure the page table walker will see the zeroes */
> >                       synchronization_barrier();
> >
> > diff --git a/inmates/lib/include/inmate_common.h
> > b/inmates/lib/include/inmate_common.h
> > index 5af1213a..1c20a0af 100644
> > --- a/inmates/lib/include/inmate_common.h
> > +++ b/inmates/lib/include/inmate_common.h
> > @@ -103,6 +103,7 @@ void __attribute__((format(printf, 1, 2)))
> > printk(const char *fmt, ...);  extern unsigned long heap_pos;
> >
> >  void *alloc(unsigned long size, unsigned long align);
> > +void *zalloc(unsigned long size, unsigned long align);
> >
> >  void *memset(void *s, int c, unsigned long n);  void *memcpy(void *d,
> > const void *s, unsigned long n); diff --git a/inmates/lib/x86/mem.c
> > b/inmates/lib/x86/mem.c index 7e1c8b83..764bdb4b 100644
> > --- a/inmates/lib/x86/mem.c
> > +++ b/inmates/lib/x86/mem.c
> > @@ -57,7 +57,7 @@ void map_range(void *start, unsigned long size, enum
> map_type map_type)
> >               if (*pt_entry & PAGE_FLAG_PRESENT) {
> >                       pt = (unsigned long *)(*pt_entry & PAGE_MASK);
> >               } else {
> > -                     pt = alloc(PAGE_SIZE, PAGE_SIZE);
> > +                     pt = zalloc(PAGE_SIZE, PAGE_SIZE);
> >                       *pt_entry = (unsigned long)pt | PAGE_DEFAULT_FLAGS;
> >               }
> >
> > @@ -65,7 +65,7 @@ void map_range(void *start, unsigned long size, enum
> map_type map_type)
> >               if (*pt_entry & PAGE_FLAG_PRESENT) {
> >                       pt = (unsigned long *)(*pt_entry & PAGE_MASK);
> >               } else {
> > -                     pt = alloc(PAGE_SIZE, PAGE_SIZE);
> > +                     pt = zalloc(PAGE_SIZE, PAGE_SIZE);
> >                       *pt_entry = (unsigned long)pt | PAGE_DEFAULT_FLAGS;
> >               }
> >
> > diff --git a/inmates/lib/x86/smp.c b/inmates/lib/x86/smp.c index
> > 94ce2913..625ddaf0 100644
> > --- a/inmates/lib/x86/smp.c
> > +++ b/inmates/lib/x86/smp.c
> > @@ -54,7 +54,7 @@ void smp_start_cpu(unsigned int cpu_id, void
> (*entry)(void))
> >       u64 base_val = ((u64)cpu_id << 32) | APIC_LVL_ASSERT;
> >
> >       ap_entry = entry;
> > -     stack = alloc(PAGE_SIZE, PAGE_SIZE) + PAGE_SIZE;
> > +     stack = zalloc(PAGE_SIZE, PAGE_SIZE) + PAGE_SIZE;
> >
> >       write_msr(X2APIC_ICR, base_val | APIC_DM_INIT);
> >       delay_us(10000);
> >

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/AS8PR02MB66635D8DEC85910F04F0ED27B6489%40AS8PR02MB6663.eurprd02.prod.outlook.com.
