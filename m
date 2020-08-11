Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBBM5DZH4QKGQEURIUSXI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23a.google.com (mail-lj1-x23a.google.com [IPv6:2a00:1450:4864:20::23a])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1C92417F2
	for <lists+jailhouse-dev@lfdr.de>; Tue, 11 Aug 2020 10:07:16 +0200 (CEST)
Received: by mail-lj1-x23a.google.com with SMTP id r28sf1771250ljm.6
        for <lists+jailhouse-dev@lfdr.de>; Tue, 11 Aug 2020 01:07:16 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1597133236; cv=pass;
        d=google.com; s=arc-20160816;
        b=Qt5si8ZqqIdO+Je4quvKyxqqjtzh5r7QUTLGDAb/xP7z4zp957/du/dZ2V7L+zOWhy
         UNvqRBfgfFY6NMVwpIurLyFMY3cjrgyPC+OmeQksryek0rIOKdeQ8UQMxP4XLsYaJl62
         w9yNHDqpOqByT76fr29XlHOGsfhW4TYWNNvBdvQ6BjqS0B9iUI3KBZN+4pKEobRQJH8i
         dp+lzIVwDhGklwsTLmpIatA+JIuWx3DuccT1WrpWon422Tu0RWtwV1NcuxnydQkUObap
         dL3wBRGOOwmfw+ZdiTdF/ko9NOHOjYW9UohNgYBH3TCON1Fxc5Nu96kcVJeIjf12QQkO
         +zJA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:sender:dkim-signature;
        bh=BcfEMCYWDtOputyubDEx7bPzU2F33o+ZoO4X8nRWNDk=;
        b=kGhOxiNcbn2AiOUCl/i9htBZf5dkCuNlJlno+krlZ63j8KwYKbZ/wWrmWVoKiFe+eS
         ZiP6p0ko3tNH5lgcopaGMmglNbgCiK+VD9sFvyN+SxAQkbr0/URbuhAJo/ERejSsrFdM
         WQ1wNRS05ZOWHT5PhMqXoLN4e+fwP4jmB3a4mtyx6ntwa7Ze0kNc7PP+g8j3o3/2JCuL
         cD1aQjXubb7CFY7AJPDnaJ03bpT3tT2++23zegc3vTwzPbuBY7i2ZyaOcnm4tV0A0IT5
         K0Aax861y1WwCZDMzVw76q2sWZ0XCHpjbn5CnzBrFMrSwIuBIh7Itr+T1F8FUYunzVWc
         JB+A==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=ohmLCc7X;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.6.57 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=BcfEMCYWDtOputyubDEx7bPzU2F33o+ZoO4X8nRWNDk=;
        b=nAAGC4wI7pcTTQxRooMOrPoiaH6/x+MTp8A1WVwxxwFVMdahS9enF3zpusCwUU52qA
         YMTu0uUnQGGqNAC2VjpRpaYoMg+OAxebI2XeNrp8D2vDpQLzVDWTFpW5H0Yi5H7LvY0v
         mD6H2gaUud+JKZxXE2eJx+6HnfL68gbLk7rKbdHxFoGGKFNwj1/KObgijV/n69JY7xSf
         yNs7nPellKCrmZvS9ed2lc7lMjzhIM0o19E4zAnpCDHh0S0Fugg6A9M2wdXP1K8czEdK
         zYG+mrNJbpYQmemfgXeFdVm3ZqR8i7Ga22ZaJFHan47RPyANlmqjn+N0JrzyeGTZcHNH
         Q/pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:thread-topic
         :thread-index:date:message-id:references:in-reply-to:accept-language
         :content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=BcfEMCYWDtOputyubDEx7bPzU2F33o+ZoO4X8nRWNDk=;
        b=AIFzl1czLsLdg5/XisIuyI+UkMLhINreMmTwHUY2Pi/fY4ooePYjanV27n50fVpzIR
         fQgkLOaLuaGjRly6SGNGe+FOX5zI8RpLAmN8yrClVmoFkriY9LTG1zfa7M6cwzLRzKmX
         6Q51Vu7C+dB9Wy6klx3xtnCOJvkWzl1wjh6avBImJEAg972Fg9Zug5BWcvnLladvam6+
         NU/HMGYIfjjV9UWnHTBHUGMueaZJqAG3a43IjIAMXfVByMRmCZXIPBLIZaJbwBeJ0UnB
         wK81hEWe601yaLAnksxzCNQq2Dl/5VVMP0uPzkku+xOE3l9X+SdTIkMEbQcmQpjpejdT
         Qzug==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533/Ual7rjt+DgSl5Qkn0S7oW15Cz6Vzaj9zjLPT8uj47S+W0DMg
	ww1BP9Fe1aqf0DZ0k+GK1vo=
X-Google-Smtp-Source: ABdhPJx4oWCsSVe2/O7fLdlb42LOm2cH1+6zuiaNYHVshAPhAVPZCrQp9xNtqUDJwDRTfA+CxtHqmA==
X-Received: by 2002:ac2:5ded:: with SMTP id z13mr2593571lfq.213.1597133236331;
        Tue, 11 Aug 2020 01:07:16 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:294:: with SMTP id b20ls3426764ljo.9.gmail; Tue, 11
 Aug 2020 01:07:15 -0700 (PDT)
X-Received: by 2002:a2e:9812:: with SMTP id a18mr2482456ljj.25.1597133235269;
        Tue, 11 Aug 2020 01:07:15 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1597133235; cv=pass;
        d=google.com; s=arc-20160816;
        b=ZP4EzbinwTMjkNpk4yu+t/55skRXkO6qVUOTL4u+oBaa/b73QlszD+wd3jjZzDH9iB
         fotyURownp8Y5ycufAySkmpkI64qO224qGqtbTJIeMDFVoPYDGesNFejDuVWoA5mUXq/
         pnC3UorIN4VlYLc6X7RfGWWgdOQIQ4D9ZokD+18S3yDVOlM2KY46XJAzqJdFPv7rci1a
         38kFvV2+sHFuRcJCpyYwIDjHDfCAt9Buab8lmqXt7NMeIEi39ZmyhKhtIme5LRLns45d
         oxbZC1hW+A8za7XvgD76nlVOBMOCdvyeoC4yFCNv7unn9n8MEgeYHGbIRm5Qar29+ffi
         viFw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:dkim-signature;
        bh=aAgPvi0Mnod9g4Wn2cO0LS5q0/d/x5bCKyEFOkj6n7Y=;
        b=G/V8WvC+uL1+MGaK38HbXwVGv2yLgCOFOzaerZhMo6nqw7s4PNbU1ejUe/0cyyKopf
         iuRwK3eVFY+KO9/CAgcosS4k3HBU14CRYK5fwEYBd/hCpoc+khPDfi3xnkAFGb2CP5+w
         mYbpHwGzHb2mKVC7whpyDvv1QJBtmdyXgwqDl4p4tHVqaKa0yTLnfDAkPdQ5sCdBRq+O
         MmZwsqSQjrmzf4+iWXB8vDKjMqnL4+IcNuihYxB9kYPnK90v49neEPkDHydJIBdDzxnc
         SPdUUqmTtVlHD40tUXUzINZxAWhhVDkw/ZM6nklbSeURCaCdYixGtSOOxx8YiZ8Pr2Ro
         Aswg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=ohmLCc7X;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.6.57 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60057.outbound.protection.outlook.com. [40.107.6.57])
        by gmr-mx.google.com with ESMTPS id z22si696743lfd.1.2020.08.11.01.07.15
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Aug 2020 01:07:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.6.57 as permitted sender) client-ip=40.107.6.57;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H5QCIbdqr1TEiQYeTxhKl6AfgH/iiOHZRYbA7ZRW9kFSmrbvNWWqMkOPGXArujWvtVL8Ya5TOhypdAe6nl6lQ9plZ8bg8Of/jz9NqlIl3g2WWuKjjXi2Nv1hQnTuUjnMExj/ODDYHPXTDGwAuq+G2zcQER0japf54OmNwsasRfSMvi5L4e7gQOdkiCOZEhiWbgmnmIiPAulg49Zmy9ekdyVMfG9sqlKn3wuKhNvLafahAbT0JLRLLm2Vbl582JTCqKcjI9lmCM+Om8u3K9abQ4ZR5Wa9WmDloVVzFJSd+FR4qXb22yl2DbuUikqo+QECd1M6zX1K4sGcsG/n0z7txA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aAgPvi0Mnod9g4Wn2cO0LS5q0/d/x5bCKyEFOkj6n7Y=;
 b=Vt+HCE/WO5K8PWVNa1NvDbGGTGPadFj0/XfdJQwlSH4K6KnsqRIVJbYRLfT5Uvrk/ibI4DSQNOUyKhqTziR5oWbJv21JsrnzUZNPxDTJslFkIAnMYsri13vZ+CQ3DXdDoaXgVWIWMd36b8hojax5D3uYT749+SoctPawxx5pHPehtD/dZDG2CM5DuyPqKznbI1itwx73xEcUgDSVPpqZPik4w6UolZ441ZK9H+XeDs3f5IxNVZT2ByGGgfz7M4C/u+vVXBxqYHnE6Iz1Vy5JfqwnbkSfivlC/c3Rijzld1+0EkCOkeJdJi0LPZRxu3NIK4v73UQXMejsCUQACJ6dQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from AM5PR0402MB2756.eurprd04.prod.outlook.com
 (2603:10a6:203:99::22) by AM6PR04MB4920.eurprd04.prod.outlook.com
 (2603:10a6:20b:9::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.22; Tue, 11 Aug
 2020 08:07:13 +0000
Received: from AM5PR0402MB2756.eurprd04.prod.outlook.com
 ([fe80::485:d415:5f2f:e599]) by AM5PR0402MB2756.eurprd04.prod.outlook.com
 ([fe80::485:d415:5f2f:e599%10]) with mapi id 15.20.3261.025; Tue, 11 Aug 2020
 08:07:13 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Jan Kiszka <jan.kiszka@siemens.com>
CC: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>, Alice
 Guo <alice.guo@nxp.com>
Subject: RE: [PATCH 08/10] arm64: sysregs: correct SCTLR_EL1_RES
Thread-Topic: [PATCH 08/10] arm64: sysregs: correct SCTLR_EL1_RES
Thread-Index: AQHWbGRFNsJMjlZQR0OFT0cwrAb6rqkyizKAgAADD4CAAAKcAIAAAn7A
Date: Tue, 11 Aug 2020 08:07:13 +0000
Message-ID: <AM5PR0402MB2756172E76077618D002D48088450@AM5PR0402MB2756.eurprd04.prod.outlook.com>
References: <20200807030632.28259-1-peng.fan@nxp.com>
 <20200807030632.28259-9-peng.fan@nxp.com>
 <4821d0a0-f8f3-582b-1182-9c5424f68ec3@siemens.com>
 <AM5PR0402MB275665257ADDAFEAE4B42B8688450@AM5PR0402MB2756.eurprd04.prod.outlook.com>
 <b62f684f-82e3-51b1-e983-e191d719284e@siemens.com>
In-Reply-To: <b62f684f-82e3-51b1-e983-e191d719284e@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: ed16b605-b096-41e1-b037-08d83dcd8e3b
x-ms-traffictypediagnostic: AM6PR04MB4920:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR04MB49202BA30F3DC51A8A70CB1188450@AM6PR04MB4920.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FrUmHNTcelgQPjZdUcXYVGHMBK/9DVQdXHW7ZbNRAQOZKYAnv+Z4Ww+hrs20tbsTpHhEj+lxMkB/04+x04FNMcEbM6qMLGKYv36QRk5VF/TKdS6TKeP7mxSV9CrKWl+I9gsnhOzIUNwWbghkHNqrO6NqvJ0W+e2KCVYBrWRBbRhqRJaSn2w+e5F/YrWxQHe6X71F89uCIWz4cBxLbGh/rKiBnkRB46P5xQ6UujH7zNeDlnEYWLWYuDyF/GjJHZv+3BiOChRprSpVa5F2bXsKJfqgwzKvcqEmajAgMhAwkcapz5OENTOi/riwqyhU0kgkQ+UxZIsLRzjsNCcxYCGWwwugUYJ8HxKrbQz6HAsik9uPld8/8rre4pfDMt95KkZ2VQhyFWdNYybY9a2K8zBrbw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR0402MB2756.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(136003)(396003)(376002)(366004)(39860400002)(5660300002)(53546011)(8936002)(6506007)(55016002)(71200400001)(7696005)(8676002)(86362001)(4326008)(6916009)(966005)(76116006)(33656002)(66946007)(52536014)(64756008)(316002)(66476007)(66446008)(66556008)(26005)(54906003)(478600001)(186003)(44832011)(9686003)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: /vy+jY+erzKeEphf1j3x/ZL12ld7z4GsC7FeYMRk8iBsQTuxm0tsuE1v4KsZDodFjyzbZqWtgEF8vjhJZfX9GXElJBnLe7FwShWkin8uhfCXKeHh5nDJrS5CSHdQPkddkL4Vqr2F7Co9O3nVzBWAyfhtMG+s1/yxrW70nUU4wJgmYNODRvQVv37oXSWsw6DpPx4t8ToyuilD8sAD9M+r9qLAk6/+AQIaJX/dZ34RjMM6n6jWT9vUUarDNxMOHBf34KOQ6AhEmD3eeJ3YEqBseOcNmrT1Fp5PUKVD3w6RcZ6HbmSrhZEMbviQY0XjinZee7teEyNkPsO1uW7xtugsJFSlB3bH6147y5qvlLxFc7PXuQUf3lw84Cn4sC9znq22KqB4RoVYsAZxZYq72C7SaSfVvPBJYqQRISRp4S8J9rVaIv9nLSaLIWQv00Jc+N3qMIBRUaCGcyL6CV742FOQubSbKuNDoEHYHeSGHHxxSwmBA7wNAkcavOWBUS5VUmNPugW7MqOsNBP3Pv5VEGKtnibF/HprYz6FU7fBMqE6uK4Gt9HK2sYgKev8WheBvn6yOo85EUsha+8GriHlJNE9U3J1UoUsOZwvD3/yEPDCUrOT2ojufHwblUW3XHcEc7mF2UvSfoWuKxU2cEgs1oLdwA==
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM5PR0402MB2756.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed16b605-b096-41e1-b037-08d83dcd8e3b
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2020 08:07:13.5332
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VQC4tujdc3GUiu//nSN1A2gdAak0CyH0rq/UmBm4jV//I7SrV3GWrbGY8QIv6MggzgttPYAQP8tlCvndbxNvCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4920
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=ohmLCc7X;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.6.57 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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

> Subject: Re: [PATCH 08/10] arm64: sysregs: correct SCTLR_EL1_RES
> 
> On 11.08.20 09:49, Peng Fan wrote:
> >> Subject: Re: [PATCH 08/10] arm64: sysregs: correct SCTLR_EL1_RES
> >>
> >> On 07.08.20 05:06, peng.fan@nxp.com wrote:
> >>> From: Peng Fan <peng.fan@nxp.com>
> >>>
> >>> bit23 is SPAN, not reserved bit.
> >>>
> >>
> >> This is not correct, see D7.2.81 in the ARMv8 manual.
> >>
> >> Where did you get this from? What is it trying to fix?
> >
> > DDI0487D_a_armv8_arm,
> > " D12.2.100 SCTLR_EL1, System Control Register (EL1)"
> >
> > This is just to align with Linux Kernel, since the head.S in the
> > bootloader needs this.
> 
> OK, this is ARMv8.1+, I was looking at 8.0. Are you sure the reset value
> changed from 8.0 to 8.1? We definitely need to remain compatible to 8.0.

See https://elixir.bootlin.com/linux/latest/source/arch/arm64/include/asm/sysreg.h#L577

It not have bit23 reserved.

Thanks,
Peng.

Regards,
Peng.

> 
> Jan
> 
> --
> Siemens AG, Corporate Technology, CT RDA IOT SES-DE Corporate
> Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/AM5PR0402MB2756172E76077618D002D48088450%40AM5PR0402MB2756.eurprd04.prod.outlook.com.
