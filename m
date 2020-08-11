Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBBV4ZZH4QKGQEHQ4FEEY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x639.google.com (mail-ej1-x639.google.com [IPv6:2a00:1450:4864:20::639])
	by mail.lfdr.de (Postfix) with ESMTPS id DD877241789
	for <lists+jailhouse-dev@lfdr.de>; Tue, 11 Aug 2020 09:46:31 +0200 (CEST)
Received: by mail-ej1-x639.google.com with SMTP id i4sf4814782ejk.9
        for <lists+jailhouse-dev@lfdr.de>; Tue, 11 Aug 2020 00:46:31 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1597131991; cv=pass;
        d=google.com; s=arc-20160816;
        b=fmOcm9b23aMBLaCQ9AcZu9nrxQw/pW9To694qjLrCmvj/ooqie8TGJo8GsNBrKHmv4
         6wGegGGXLhwVKrMlDLMOoBJYQdI5D49W0FVAnVCIXVYQ4qrF8ncHVumKbQAZWCNM9kef
         +ndPUB6k+4aX29heIJKF8DbbmKlpYSPmqVvunLXF4sCP+w4j86PPtmN6nCtukd3s2vSG
         338M899kN8trNs8KTA9DJOF460rZnpYdKCjqAUxZnAUKsCoujpArYlITE5fd6taIXNRm
         492EL9jB6ZrrnOXStn0L21SS8vwjM2Vrupn0g6UZ6Gt0FCrwAkwVow9hdoFRGYq74idy
         IRxQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:sender:dkim-signature;
        bh=hc3AgS4KC2qiYDPRxhAixFG57J0q3LEGX/tW4n1vo10=;
        b=U606WOfQ0DyAaRRjRPC0qQNrUrQ0y4EzNa1fddL43W62+LSz+svQ0HzQ7zrorrMnaW
         8lrBaEhkXOAlpVTjEL3h6JCNQu3jGkKuk1atXdXr2qHR9j6r0PSsGWeTIXMR0WnDdsmk
         e3zliJrjfN5t+9G0ml5gunrnnFqcMkHSc+/dhEmk4443edGuklLzRS5fwM5RrRtyUIs8
         wdwzjCrVEQeo4d93rtIkvypR92y3CAQ+tXTdraCBsmfqsNAhSixFcXqb4P1Ghvsuey/H
         s2WNM4m7S21g5n0xw5dYXQrtsU59deeFyPvwdBPsQBMyLzfTfQhbNJxlwC0aLGCSMKGg
         1Yhg==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=S6LFaoUp;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.4.58 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=hc3AgS4KC2qiYDPRxhAixFG57J0q3LEGX/tW4n1vo10=;
        b=pEhQy0hbWtghJS/4MA9adk8pM+XP5ohR8+BNvQDtcz4PSebvmdrnq8vV1oWqv3RGOJ
         FYOyauFCRefp8h5Cy1AH6kQYyspVv9Tu8tvFG2GShG67NXATvNyJO+PG8LxedeT3gnY2
         cFTZbVo/PbUsNT0AW9lKPS/qX4AVSAuSIfpaEsQZ5u7w7+WLpiRE/P/KslOh38/d8Lpj
         Hja1a+lI25UgAKaBpToFgVSU+7enZKUpa1EZMlMED0s0t57qrqoXONtvx8lDuoN9Ox/q
         IJz/pEUqMwRzxyY1EIxZhxzqg6h+S3TFhMDROepw9vDYQeWW/Ze0uanygmdbiwDWR2tv
         S3yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:thread-topic
         :thread-index:date:message-id:references:in-reply-to:accept-language
         :content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=hc3AgS4KC2qiYDPRxhAixFG57J0q3LEGX/tW4n1vo10=;
        b=BhjvlLzvkDDPdUf1gBLkxxTiHJtHH/PtpbkO96NrUXLD7A0nGE8195nzxmfXYrinjv
         FkiL/gfG/J3LExVMyrPw727n8e0z7kMiqkb1wSd5xRNDCk4QKCHuc6Q7pz5LOB81vFrM
         RvRpdPFEpuwU/X6Oeu3soklLARl+hHtE3uJznII0gL8rpt8/XW0qK/GKfkC+urSG9KU1
         vZtQMgwYuk6gfkkV7EKQdPzhq0uXuvXWLuW9IPsAMDj1hvxBhbLD1a51weWKWOdfPfNy
         FOtx3q20oUVZ9alsms1He0Cmnol4zRCcOLYH7CK5ILG9/GYMJncYlEqGBaHc28WUaRVb
         QzyQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5317HuJ8TL6SiMsUjh0Q3NyHKEmrDfm/NzBrR27WnfSFmjXL6Zc1
	y9fTuVDRQs9bZxxCt4WImt0=
X-Google-Smtp-Source: ABdhPJwoatIL1Q93s/FXzgWBsQTNkACX8KdSS3POafmJqQb1vbEyocCyxKpkGtXwmFqWClamNcNqRA==
X-Received: by 2002:a17:906:fa15:: with SMTP id lo21mr26106838ejb.42.1597131991524;
        Tue, 11 Aug 2020 00:46:31 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:5e03:: with SMTP id n3ls9262124eju.1.gmail; Tue, 11
 Aug 2020 00:46:31 -0700 (PDT)
X-Received: by 2002:a17:906:3911:: with SMTP id f17mr26379730eje.56.1597131990982;
        Tue, 11 Aug 2020 00:46:30 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1597131990; cv=pass;
        d=google.com; s=arc-20160816;
        b=O+2owxc/z9tzzHPZSDqKvLqWG4KyTj1uYv9imklo0Df2GXMkQfjXyIVJw1Nx8nJM9r
         Jh2EnJfo/pnGelAq7aIY/t6RxwbkbJdi/b7l/HSXDglNqksBGp60nPx256pXtZ9lu+fx
         MZ/51qh/oWKJSHo/lCv86cQIn6DdPoJWZUGW0+L4jtA8ElHTLQlnzeH22YWP8Ds5Z3U2
         iyfEo6T1avNKca//opaW9afBVkk4Xf4lK1kF2L6LRZkjTfAv+hvFTNWj5zDVmxqXSW9U
         nL5RC9gZZaXJuCAmBAnFnNT6lVvie0ihND22LZV0+/CgwPtJCTWeNy04XK7E/UN94kkX
         J1jg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:dkim-signature;
        bh=rtDj5aXf5I7NeDpSf3YetR2cNpCiWlcThX2y99AULBk=;
        b=wZAJjgBlM/XXQ6u/bskq2PDM86wGJBrdfbFBPVycKxHP1XUldI71zF1WWgy4eWiE4L
         H/Aqs9oXnx1NotC+TUVTDUBObFBGeVxt6tOUUJUGR2vEntHVnuXO8V6iQz423LTPi1on
         Tk3JOtfLJJdnDYI9NnsZ0GcA+nWm1qumyfvxjoa42mtAJZVzocy89RrhaYsQkRn+67di
         pYR5TEsREUXgUjkPqyUNgFO68XAV8FPj4/Vs8fUafj0h143f1e1shRxFpqU3DNU03fBb
         OoAaWQlNJHRv+IJQ0zi4nbkHhqGiqbpaRq8xM6w7wU6KCiXccUcZ6gwtyNW7KgDwdfeO
         HvdA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=S6LFaoUp;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.4.58 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (mail-eopbgr40058.outbound.protection.outlook.com. [40.107.4.58])
        by gmr-mx.google.com with ESMTPS id t30si629647edi.3.2020.08.11.00.46.30
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Aug 2020 00:46:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.4.58 as permitted sender) client-ip=40.107.4.58;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HlK3sjlZ8JSqqc1tYk4oT7U3ewgRcOtFtfO34vlfPXlvkrtC71dIlP1SLX4pYHGOxRvTVQvwBx7wXE3I7gWKfA5jWn4pd0z4wOko5/N9hMGFrbtMf7IYtmw+NzihRg9iAxhVjnftQMLt56qdyPTIFYM1P0h/de7yJ5FLKFE2e77uRwW6aiSla/jOADuJn+PHl/LvpZ2db+WIzIgH2Ll0Dp4nbs+miYi+P3Z+cgLeEkLdV1yioAKlcARVQ2fbun+ilKj9o8pPhaiLsBWc7HK4PbU7Ue2HZOsL6kaE48PqxfjFIFHPtKYPVZWvQUeMTFk1go7pQlgrlaQcfeAgOV8sSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rtDj5aXf5I7NeDpSf3YetR2cNpCiWlcThX2y99AULBk=;
 b=AxCbRxy671RaNFzRFM7ovyeZ2S1MuDmGfZEZIsyAj+S2s1lxTz0pHrlU0GkNFm9dfFOFRkqe6CySB+8jMWJlGqDt6Xby7pWvEiVg9pogJ3As0Onz8cAvYllDsMfVh4nFdKc2P6dWo44eBakuFWfish/5YUi//enU1puHOF3/WBslkzyn2k6d/oFV6HI2MezOV45+LIU3dwtDFcVcuSQKGBlMjXFSznd6LTQyZ5GqxTypbgg0mSlOQenXiH64DmdOXOLHNskZviHrcl7TPIjmGqDIPBPTfhu6q2AJFaWTUeW3EWuEKupq4nm/qwBit6kuP2Hhb9LwBizF+7DwMGKmrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from AM5PR0402MB2756.eurprd04.prod.outlook.com
 (2603:10a6:203:99::22) by AM6PR04MB6167.eurprd04.prod.outlook.com
 (2603:10a6:20b:b8::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.17; Tue, 11 Aug
 2020 07:46:30 +0000
Received: from AM5PR0402MB2756.eurprd04.prod.outlook.com
 ([fe80::485:d415:5f2f:e599]) by AM5PR0402MB2756.eurprd04.prod.outlook.com
 ([fe80::485:d415:5f2f:e599%10]) with mapi id 15.20.3261.025; Tue, 11 Aug 2020
 07:46:29 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Jan Kiszka <jan.kiszka@siemens.com>
CC: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>, Alice
 Guo <alice.guo@nxp.com>
Subject: RE: [PATCH 07/10] cell-config: reserve an entry to align
 jailhouse_system
Thread-Topic: [PATCH 07/10] cell-config: reserve an entry to align
 jailhouse_system
Thread-Index: AQHWbGRESSA+MfFU6Ei6PWvk43uzSKkyiseAgAACWxA=
Date: Tue, 11 Aug 2020 07:46:29 +0000
Message-ID: <AM5PR0402MB275689516FF334722382D71D88450@AM5PR0402MB2756.eurprd04.prod.outlook.com>
References: <20200807030632.28259-1-peng.fan@nxp.com>
 <20200807030632.28259-8-peng.fan@nxp.com>
 <6bc31f67-33dc-9ef0-73d2-68f7f52267db@siemens.com>
In-Reply-To: <6bc31f67-33dc-9ef0-73d2-68f7f52267db@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: bc88e0f3-c7b4-4e56-5b36-08d83dcaa8f0
x-ms-traffictypediagnostic: AM6PR04MB6167:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR04MB61677EBE09A4C1A16A56ACF088450@AM6PR04MB6167.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /I48Ad3IRRqiGuYq9E0Cz5WJK7xUVp45ITg2gYqMIjqmSyJe1e48IkC9JdcxJgCFUIn7xPdZ19GOtlHgxQjVZrbRPqGIeuV1kKGQ2suTciEujoBjArveVUjUN8IH/n0BusDm3EWgnqSOkjoHSscufIL1RiOqOWhpCNZXph8sxtLACGRvBf6CENKbH/cBvozVdgPF/k0RFWrtr+X3bgwPz2YTga32oGByn8Mkf5YtGZNiu0Te6utxxrif8XW/BCdt8YIWzuaZ1W5ukiSDeStbky2OE9E1LN+dCC9FmzntkKG9U3j34hKqGs0kk3fAjL9t0dGP+fHoH3vjwhC1SLtDCA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR0402MB2756.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(366004)(376002)(396003)(39860400002)(136003)(86362001)(8936002)(83380400001)(33656002)(2906002)(55016002)(9686003)(54906003)(7696005)(5660300002)(478600001)(71200400001)(8676002)(66556008)(66946007)(66446008)(6506007)(6916009)(53546011)(64756008)(26005)(76116006)(186003)(316002)(4326008)(66476007)(44832011)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: zzi1JurJ5ULfph7GO0o3nRr5R4dLfdZS00g7T+EZDrqUGrCqtdENJKKdUvedHQIQW2x6tCdyv7KIxxpC0dyZd9+Ge2Q328JOlTrKSCreEdSiW2RxROMsUF8lC2rwqcxVSEou742jyc7UnD7Nt0PUYUCoEIoEpc6JIEdrgkpYhORfWH68REPYYPtRiSYVgiZrv0fcj2xg7M1dTHOwXygW65TmBhDRQpz5+SwNMIbg7exarMivXOCI1N6fIWcSf8+WufvvQY3DrEVTBLGlS9lpwDMwSUJcSW/XtmEqc/yumqgYZf6IKU5b/oIfyvbGEyurezQkIe7YTglMhYnQAXacAInulTzAAIBJrbgOMtcEm5V1cz5za8i+gj2L1mkyQ1JihUGVpp5mrSHj2qCV7j/UQU+G66xFzORqU57SGCd3RMzavTTId4Ju4umAMaRSYvLVfnCS1jWUALaMQ7JWLqol+fnaP22LM5B6dw3XUKAD/US0nrApXp4N4ByrLtVaPZbPVdArXeYTWVX9qjj0Hd2H6L4b9WTNx9mEF2lramH60fl2UtRs2ax2KopzJXNHpyAYy1UJBPrpxhx/R5rOscTyft/y9yN3t4kXwuAdvVQYTHDsoVUOIgWZoMhpqOne8n9wujJ2lENfKVPH4IITMB3c6A==
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM5PR0402MB2756.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc88e0f3-c7b4-4e56-5b36-08d83dcaa8f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2020 07:46:29.8358
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bLeU1u+p/wRDHgula6bIp6uqRwS19wez/9YGIEvg66ufIo6c+yttTufz5e/fpr6fslpukeGviWuuAbVwAKQOOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6167
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=S6LFaoUp;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.4.58 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
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

> Subject: Re: [PATCH 07/10] cell-config: reserve an entry to align
> jailhouse_system
> 
> On 07.08.20 05:06, peng.fan@nxp.com wrote:
> > From: Peng Fan <peng.fan@nxp.com>
> >
> 
> Reason is missing.

Oops! The bootloader for jailhouse not have cache/mmu enabled,
so to ARM64, it is to align hypervisor_memory to 8 bytes aligned.
Otherwise there will be abort when access the u64 address in
hypervisor_memory.

Regards,
Peng.

> 
> Jan
> 
> > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > ---
> >  include/jailhouse/cell-config.h | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/include/jailhouse/cell-config.h
> > b/include/jailhouse/cell-config.h index 6df4a745..77a61da9 100644
> > --- a/include/jailhouse/cell-config.h
> > +++ b/include/jailhouse/cell-config.h
> > @@ -309,6 +309,7 @@ struct jailhouse_system {
> >  	char signature[6];
> >  	__u16 revision;
> >  	__u32 flags;
> > +	__u32 reserved;
> >
> >  	/** Jailhouse's location in memory */
> >  	struct jailhouse_memory hypervisor_memory;
> >
> 
> --
> Siemens AG, Corporate Technology, CT RDA IOT SES-DE Corporate
> Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/AM5PR0402MB275689516FF334722382D71D88450%40AM5PR0402MB2756.eurprd04.prod.outlook.com.
