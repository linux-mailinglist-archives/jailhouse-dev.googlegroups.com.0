Return-Path: <jailhouse-dev+bncBCWKP54GYYIRBM6B2WFAMGQEC6VAZSY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-vk1-xa40.google.com (mail-vk1-xa40.google.com [IPv6:2607:f8b0:4864:20::a40])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4E541D3D0
	for <lists+jailhouse-dev@lfdr.de>; Thu, 30 Sep 2021 09:01:08 +0200 (CEST)
Received: by mail-vk1-xa40.google.com with SMTP id ay30-20020a056122181e00b002a1cb0c7a38sf184223vkb.11
        for <lists+jailhouse-dev@lfdr.de>; Thu, 30 Sep 2021 00:01:08 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1632985267; cv=pass;
        d=google.com; s=arc-20160816;
        b=aakR97+bim4G9KO78CKF89YAOF/S5AkDdJw0k+oEyOwIZLLJI25z+fVEy8Pi51u3lY
         VJ2RAqVh0z0bDVV8Ft7JWG5lBpWhYavMJfE8N5MHwmbobTtFOJJgTLtXO725ndKqPLJa
         touUbKMsjaz/IcgMUGiPo6o4gyfBfmWCDaSdeLQze1Nhvg2thHGDdXtm7ueD5pcLmJAV
         5AW0iIa2ahYGny9/DgHG0NjSe5mSSjsb/lZtEgISHCmKwhp4itx2Yauq1ZYxHrrnvwhd
         llYxSdHDRGrZL/AForE2e92V1y/hSe4eVkxkHAOjb5/XsDytPuxojuZ0/Y35v0caZvkt
         Sisw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:to:from:sender:dkim-signature;
        bh=MeoRsE+yW+lOkOFGoqsLLFuDyyiMwaZfwwkAaitRGzY=;
        b=QpFjlSZrTBgsRXXq+DBX2jOdldMo3WA0vQbDClDy1wGse741AoX//qVmwj6Ylpxq2A
         pV2Pb9Phea0yX04+HpDYAIbGJeWxqoXXKjdwEQs3NXJ2zu3x/9+WU848ANNCRzdTs+u7
         DQNVZIFXYt7m6EqJ6cWqU0nfQb8DUiDIDfdqN8kXyOZ8Vh7PkCyorEv7kdHiNemZlIzA
         Cz/gSHeWIW4dakj8PnN1VF0TW3Li+gv+E00QfLcirlsX2fj18qp0ch8j3nQYt4N6/nuW
         XrNHJtFT06z+gnCK3O744hnICjjc9ySEosAK8qL+rL2w4tAaOU1kz40TpGOGsIdH7cUm
         YjSA==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=ChDP5xpn;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.22.71 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :content-transfer-encoding:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=MeoRsE+yW+lOkOFGoqsLLFuDyyiMwaZfwwkAaitRGzY=;
        b=GFmUeKIgJ/CpjZFkejsKnNoH4cSN7cHHQsYJST0kZqAy/YYOymfJFBxZlWv+69/mg8
         ICuuHIs6DaSk5pksdeseGVUaIDOM6eg1NFl8L0PPXpWP57vH0+zqrWFFDjJ4elNDPatG
         207Y243aipNA+ue0ElJZ4VW8uMlwJr2yI65S3IShsf9q+szA9oz0mp/1ya3VZva8FTmE
         4YGfL0tkcCAd56hj0GlyY7NdylL0IcGEM0Y56I0CUl3ejKCCCvBb1cBu95D0QnZ9uzwN
         d6z4RgoYN36AeXdmUrg3Df6BFfX38HNDq6g9qnTPUsAcMzld55p/4wT1Ll+Gw0dGWEVv
         ezkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:references:in-reply-to:accept-language
         :content-language:content-transfer-encoding:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=MeoRsE+yW+lOkOFGoqsLLFuDyyiMwaZfwwkAaitRGzY=;
        b=dFGw1aYXwDfjriVYLlquwpuuqMgmA5QSRbf9O7u7MZeQdMYENBvaq/tHy6Wpi2OjwK
         NELzmV6e1oICmVF2UIrhg0jXVQFCXV3C5nbnL3bz4wgApd+wDa2Hr18IywuDWQoM7peK
         Lh1WNEOv42gMEfuT2/GT7Mi69Vx6gY0xc2skU5eCYY0naz4KPi+BRlibOqjBxD6tCHtl
         AGvwACvhgbuNX+1IfID3vnGj0aq/H8uA/vBL/BHiZuqFjj4d1O0scWw+xbTfJ1DdGbK5
         kuYS0TsyX68qtZ9ouIH6tdFhsH1tFs/Vjw7I7dLxvTEWxMwmOsN0Fpd4IWS4Hmpll8i7
         WJAQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533gQUPyAX2T4ogD77JhqfB1mdIOwgm0DMAho2awJ9/kRV/jFPFM
	qsOoNtNoJmgJ2FIPWNZ9/7c=
X-Google-Smtp-Source: ABdhPJykzYQiQAAmmJi6UPyueXQfCSHEeXpzJTfnJpPkW5QNuDkBuifs/89BW8CnuAmC69LdUg+JqA==
X-Received: by 2002:a67:fbcd:: with SMTP id o13mr1572864vsr.51.1632985267675;
        Thu, 30 Sep 2021 00:01:07 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6102:34d8:: with SMTP id a24ls1408461vst.0.gmail; Thu,
 30 Sep 2021 00:01:07 -0700 (PDT)
X-Received: by 2002:a67:bb04:: with SMTP id m4mr1916351vsn.18.1632985266981;
        Thu, 30 Sep 2021 00:01:06 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1632985266; cv=pass;
        d=google.com; s=arc-20160816;
        b=Z8WQXIMDrd+Tu4VRd9UIxGeiCJMr7FpDQo615JxygKXx5V3S2mgPFEiLBFLl58fN1h
         Kcim4zbSqFBzk+fcEVnlX1ZXG3FijXVd7sKal6Gl7VvcdAWLpDJMhJuhYx3lVqJRdflN
         NhH0lYG5IOvAWxoNNBVMqEW1AmRYu1MblPHRE8qp5dS1oVjAnKF15JnVhUIcvsbyGxQM
         g1tNoE7aqL+NyhJH3rLn9tGqSUfe1SVCUnAlF2X+Kmyzjxx0jRK2QaIHKYuEL9UwiNc3
         kBHu0SceGm1QS2ItU4NZWl8y+Zrunxt8Ym7wZe8FUa0ReSobpkFVzPhJSRma6YjueLAV
         17bw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:dkim-signature;
        bh=emaT1Dk3yDJk2yjXp8UJTpMxZMefqH4X9bJSbP0Dl38=;
        b=Ssvwx/ECB848kKnHnKhJY6M1Ub7wzFBCyNmzvdc7x+j9J1Ylat69g2Pa9TXur99UXz
         lXok7szbr9m4+U1GKr0knw3s8a9cuqwX6nOXSFgjispwcY7aLPIteznresAwME5/tiDx
         uw061Nqd9CfR83R1Fe1jC3qqMmxDOA4T1t7xbmjHUWcWB7ARCl2syVCsNVn8odqz+W4U
         f9l9xNMmeBZLuWVS9J9s18zk53v6GJaCfiTnF08s78P4o0kKCALCYIrT/iFVT+yiuY/E
         t1917FdNZW0cA6usJEjOQ63lh45TLEZwyK9o7ibMHnwDiX0h13GGEMSocytAqaI/VaTw
         ziTA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=ChDP5xpn;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.22.71 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2071.outbound.protection.outlook.com. [40.107.22.71])
        by gmr-mx.google.com with ESMTPS id f9si175271vsm.0.2021.09.30.00.01.06
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 Sep 2021 00:01:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.22.71 as permitted sender) client-ip=40.107.22.71;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g7V4+U+HO0bVKiFHKCjwBGafUBfic4dvK+QHyeP9JgSp38t05dUl5JRxeLyr0v8iZG4LI89T6kJg6H3FL89QHZjqdHyZO7MiNo/yxMuy+sfcHo1CmSh8wK+rh6dMT6R5MCXz1AXfisTD87enqj4Q0QKJpVvDZlWEho+p/qlvAiGuB8c0d+R8f0vqbdndyVCTnWG24a3PUIcwZac/KjjokxzZ1DVYpzZI3vbLSzFG7KVELixQj80o2iOosjCJ12ttAlw0rBtmPL7V9DzSPlNKaFOJ8h+IJVJUf6BZjvC1gOaDjjzFo9KMxY+8g2s3ie6UMqaO/MB9kIA1TutYHtOioQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=emaT1Dk3yDJk2yjXp8UJTpMxZMefqH4X9bJSbP0Dl38=;
 b=nPsfLtRv5kEwxZ40Pex1VHvWAVBS5INMPT+FMnmP3A5is/GFXY+DHLoaq14grHhcUd8OdcLTUmEuE2iIYu4LpE7RS+AYNCc8GwPDTpEOUUUap+64Pw/aj2hvOvfqaNcyp2Jv/Q5KoruUJtcYMX4xn/AIM5swCsDLp4cb92UeKmd9PNF0VPoUorvOPkowTTV8ptu/tieYsWvABL3stnYuFpblDJRGIt1KIhYKjbcprD6eWAjDIKhk9yFvmN8Pe4SIF+NnsZ7vmAkYH/xZE68kFuRhcptD0KvZjo+8Cfu0p5gr7vEaQc/mO9rGUym/V1D7gZBAV12AgZMCV1Q2cHb0Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from AM9PR04MB9015.eurprd04.prod.outlook.com (2603:10a6:20b:40b::22)
 by AM9PR04MB8619.eurprd04.prod.outlook.com (2603:10a6:20b:43a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.16; Thu, 30 Sep
 2021 07:01:04 +0000
Received: from AM9PR04MB9015.eurprd04.prod.outlook.com
 ([fe80::1930:4dff:d531:7c3b]) by AM9PR04MB9015.eurprd04.prod.outlook.com
 ([fe80::1930:4dff:d531:7c3b%6]) with mapi id 15.20.4544.022; Thu, 30 Sep 2021
 07:01:04 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Peng Fan <peng.fan@nxp.com>, Jan Kiszka <jan.kiszka@siemens.com>, "Peng
 Fan (OSS)" <peng.fan@oss.nxp.com>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>
Subject: RE: [PATCH 2/2] Kbuild: use toolchain stdarg.h
Thread-Topic: [PATCH 2/2] Kbuild: use toolchain stdarg.h
Thread-Index: AQHXq5g/TOqkDX1xEEaIdF6XwV4r4quoEryAgArWtZCACVEi4A==
Date: Thu, 30 Sep 2021 07:01:04 +0000
Message-ID: <AM9PR04MB9015AA4669C038DEA4E4CA0988AA9@AM9PR04MB9015.eurprd04.prod.outlook.com>
References: <20210917074630.2585329-1-peng.fan@oss.nxp.com>
 <20210917074630.2585329-2-peng.fan@oss.nxp.com>
 <65d5f035-decd-c602-4a53-4ce898b22cfc@siemens.com>
 <DB6PR0402MB2760C093D4F7223290A0189188A49@DB6PR0402MB2760.eurprd04.prod.outlook.com>
In-Reply-To: <DB6PR0402MB2760C093D4F7223290A0189188A49@DB6PR0402MB2760.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5af25b62-529e-457f-d38c-08d983e011e3
x-ms-traffictypediagnostic: AM9PR04MB8619:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM9PR04MB8619A91EA05672AEA98288AF88AA9@AM9PR04MB8619.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wpcRyLDOBEsSoqgOPl/58ND99A0UNz4b/UYVkWmyzka/KcXaiImU23Qs1YwWPUJs/4ENjTRmbB8q2f9BVqYxbuxt2f7+L6N0tFR1w151xotAeo8Xm0qE+u7M4LmEmeucWmyF8eKsQcuB6xFJk1W0epLrDmEzjYikl27TqQvHcQRdKaici1r+4/x/MAO+aAVdIY5Due4/4u4I1FpZmOhgE/oVW58I+yu2Gab88QAXqTUjkFSQVifEvyoB13bvoC7B3KXganVKzmM82gHaSyJHXWL1tFdw21xOMWHIRdcP3IomBd2vEWm+5nFlxf/T+FcHuWgeBIi26f820AwpfaMaEeiSRccegfpmOdHvnR2aEGgXnVvsVP9w8N2c1VN03sD60j7xsyfv5xuZK7nolu0MD1jP5uCbO3dAUQ76MKkFzWwwnpn07FZpbkgaUYimP0swgf7mRLu5FO0gH6H4CmB/Ut3F2Qnt0slQse5eMp0EZ0Fu9XgC6wODSfkV+gj7A0lqBAOx9bJIMwVoPCn5gLF4PloO4Y80/e0sNJ/69qMheH8SJ3J5oNMhqQ/NxplCDHasHuMegam1b6u+sm5n7cAitvkAmlE5SWQhFK850wKOKh6JxrdiI/mJ/NWKhmpJ2dVR6IGvgKrCWagtGQllyHuLoPImd+vU6kwTc8lx5Na5z7t+0qcePR2KFSGz0IpKIsko0rLKVKwm38c7Dk+dfFPQAfNIWR1jnYgHXNfKbIZA9kSfUb9G5c8prtR27FsKLONqvikItBbweg5a3oyNR2P7N14tPs82DlDWRnDxDitX1nAf55vIumXvPdCeR5mVYFV8NzK1mTQd1ilj3Goh9PmRW//bA8jQVqa+VBLBnvE1uto=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB9015.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8936002)(9686003)(55016002)(83380400001)(26005)(86362001)(71200400001)(44832011)(64756008)(316002)(66476007)(38100700002)(66556008)(8676002)(110136005)(66946007)(5660300002)(66446008)(122000001)(76116006)(52536014)(33656002)(2906002)(966005)(53546011)(38070700005)(45080400002)(508600001)(7696005)(186003)(6506007)(21314003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?SlVZbkl0d3BpTmVjVEF3ZjdRNmxjUU9kUGhYdEkxdm1BV1lQV01aRXI4NUNy?=
 =?gb2312?B?QTRxQzJxdFIyQk5ycU5aOGV4RVN6WWZXcExFOXkzMmVLRzNVY2tmdnhRQXND?=
 =?gb2312?B?ZkhWWEd4U1l0ZzBIeGNoVG5ld3dlU1RZZVNOOEhnZUNNeWN4RkhjNUxlT2Rh?=
 =?gb2312?B?UVNpQk5RencwQVFMRVpWQjFzWElROXU4a1l1NjNjOUtJSldOQXdicVgvZjRz?=
 =?gb2312?B?QXVmaVVCOFVoN3Q0eE9MUVNJeFhlaDVveE5yOHI3eU51amNVandaWjRDNzUy?=
 =?gb2312?B?dGdQODBQWUpvaUE5VU9WdzNuK0ZrZ1FKaVpwNXVFaTViNktvZlNrdGVKVW1O?=
 =?gb2312?B?a3l3a2pWYUVoTU5HUlJwWUJWVmlCRlE0VGRTYkQ3VGh5Y1QwYkp5T1oxeGRl?=
 =?gb2312?B?eGc5NHpSM05rTEVKWDZYQlA3NmROMERwbDYya1N6VnJISEc5SFhEQ2ZnT1Zv?=
 =?gb2312?B?OTZudEJOK3lyT05rVEdlbVlNNEZUZ1NHbjA1SWNoQ3pSZXhMZ2JHRXphUmwv?=
 =?gb2312?B?QVlPT1kweDRtSzFUQlUvSXh0dVdjQlY3NEJpdlp6OStlK2JSc24zOVB3VXBZ?=
 =?gb2312?B?NEdaT1FsVURORklGYVQxSUJQWUw5K0pXWkxGRjVoWElrU0ZReG81QjhWMllj?=
 =?gb2312?B?clQvTURZdHFkQllvQnVuSEpNc2FIQ29SYjhwWXpiNDJoRG9DMGZ1aHIySUl4?=
 =?gb2312?B?SSszaHFBOUFPQWZKeWdjbW9WOEppOStHMkF3Z2JXaENINnJRalhwcmkveUpD?=
 =?gb2312?B?djU4eTR4UkFVL1ZwanlLa3FCN3MrY2tUMmZlbms4NHVHajhTUkx6blpQOGRH?=
 =?gb2312?B?M1VXaHEzOGJOeWdvTTNrSzUveEVsUTU5dmhLZDY2NFVvMk5uakhyV2pFVGRv?=
 =?gb2312?B?eEdjdlVYNXNTQVRPaWdBVksxK1pVMjdxRklZMXlrc1lXbWhucURhV09sb3Rp?=
 =?gb2312?B?ZkFsNHROT0s0NE9pTFRDdHZZYVhTblJIM2gxMU1LaWlwcEQwL20wV00xNnRi?=
 =?gb2312?B?d0NGZkpPYnRhSnY3emNnbm00eEZqVEVRODd4VzVuMXU4MXVtYVBBS0FzOVpw?=
 =?gb2312?B?V1hJdlE3b3hTMGdqM2NndXJDMWJFQ3lGa2ZocWpMYzhZS0ViQjVyTlB5Nld3?=
 =?gb2312?B?dDIvMzh4WXNXSG5FV2s3V2lteCtsZFFUTTdqNSs5M2dzQWtnL3U5Szh2VWJO?=
 =?gb2312?B?b1pEOUFudUsrZTlFZ1hVbm9wYzRsYkwvdTh1dlZhYmlvTzN0WTBwZ0RxZ00w?=
 =?gb2312?B?cldDUFVUZDVWdnJjUlZFa29URXZZSlZKWUpSMklubEs4U2kwSUZEbVozaGtV?=
 =?gb2312?B?UXdDcFFXS25QdG1JSkw1RFZ3bmd3TzRKVS9UcDNGR2QvYXArbWhuT0RVRFN2?=
 =?gb2312?B?bkFGcFBaL080djdwaWhsSENBc1A1OTNGZFBtM25jUVp4WWRtbnQ4ajdGSno4?=
 =?gb2312?B?NEZWMzNqVUR2R2owdjFGTjZ4ZVd4aXcvcVpSSVRzcm1XREhWTzB5MGo0MGVK?=
 =?gb2312?B?Z3BkN29wQlFNWnJsRnpPMHQ0b1g2b0JubFdOc2k5am5na1k4U0FVT2tzT2Mw?=
 =?gb2312?B?bWFOQmgwUE9RVGtZRjRsQzI5VDRGNUgxUHRqT1dQbTAyeklITzlDL0JxSXBl?=
 =?gb2312?B?RHc0Z1dPaE1WQWlULy9vR1Z6V2xRemVYTnROZ3BIWGZSTER1a0h1akR2UmNp?=
 =?gb2312?B?QTRMd1JpNjE4RDU2d1MvcTJVSEVJL0RLWnNHU3JhUmRmYmtIY1VudE1hRjN0?=
 =?gb2312?Q?LKIklpoWJHrGwLz0D/vxSWyVuYMAAbuTBOFLYqB?=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB9015.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5af25b62-529e-457f-d38c-08d983e011e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2021 07:01:04.4198
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OkbCARz4idAyntyEE+ix/WR+DDb+g7gKhsGhCEu0ZIfzBy3kgNA43bHrqaRZWGZKZIi/M9OQR26M8Ez9Q+W7ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8619
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=ChDP5xpn;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.22.71 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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

With 5.15-rc3, not able to see this issue, so drop this patch.

> -----Original Message-----
> From: jailhouse-dev@googlegroups.com
> [mailto:jailhouse-dev@googlegroups.com] On Behalf Of Peng Fan
> Sent: 2021=E5=B9=B49=E6=9C=8824=E6=97=A5 16:46
> To: Jan Kiszka <jan.kiszka@siemens.com>; Peng Fan (OSS)
> <peng.fan@oss.nxp.com>; jailhouse-dev@googlegroups.com
> Subject: RE: [PATCH 2/2] Kbuild: use toolchain stdarg.h
>=20
> > Subject: Re: [PATCH 2/2] Kbuild: use toolchain stdarg.h
> >
> > On 17.09.21 09:46, Peng Fan (OSS) wrote:
> > > From: Peng Fan <peng.fan@nxp.com>
> > >
> > > Linux Kernel has shipped a in-house stdarg.h under include/linux/
> > > and drop using the header files with -isystem.
> > >
> > > However jailhouse need to support multiple kernel versions, instead
> > > to add Kernel version check in various source files, update to still
> > > use toolchain stdarg.h with -isystem option.
> > >
> >
> > Also here: 5.15+?
> >
> > > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > > ---
> > >  Kbuild | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/Kbuild b/Kbuild
> > > index 2863c121..fecf61f7 100644
> > > --- a/Kbuild
> > > +++ b/Kbuild
> > > @@ -58,6 +58,8 @@ subdir-y :=3D hypervisor configs inmates tools
> > >
> > >  obj-m :=3D driver/
> > >
> > > +NOSTDINC_FLAGS +=3D -nostdinc -isystem $(shell $(CC)
> > > +-print-file-name=3Dinclude)
> > > +
> >
> > Shouldn't we prepare for phasing this out at some point, i.e. indeed
> > make these flags version-dependent? Would be a single point, no?
>=20
> Kernel put stdarg.h under include/linux/, so if need version check, I sup=
pose
> in .h/.c file, need add for all the files include stdarg.h
>=20
> #if xxx
> #include <linux/stdarg.h>
> #else
> #include <stdarg.h>
> #endif
>=20
> So I choose to use toolchain stdarg.h here.
>=20
> Regards,
> Peng.
>=20
> >
> > >  # Do not generate files by creating dependencies if we are cleaning
> > > up  ifeq ($(filter %/Makefile.clean,$(MAKEFILE_LIST)),)
> > >
> > >
> >
> > Jan
> >
> > --
> > Siemens AG, T RDA IOT
> > Corporate Competence Center Embedded Linux
> >
> > --
> > You received this message because you are subscribed to the Google
> > Groups "Jailhouse" group.
> > To unsubscribe from this group and stop receiving emails from it, send
> > an email to jailhouse-dev+unsubscribe@googlegroups.com.
> > To view this discussion on the web visit
> > https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgro=
u
> > ps
> > .google.com%2Fd%2Fmsgid%2Fjailhouse-dev%2F65d5f035-decd-c602-4a53
> -4
> >
> ce898b22cfc%2540siemens.com&amp;data=3D04%7C01%7Cpeng.fan%40nxp.c
> >
> om%7C261550c8b03142546bd108d979cc1ba4%7C686ea1d3bc2b4c6fa92cd
> >
> 99c5c301635%7C0%7C0%7C637674739818118325%7CUnknown%7CTWFpb
> >
> GZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI
> >
> 6Mn0%3D%7C1000&amp;sdata=3DEZRf7CV40nvMYwSyqgMUpTy4Dgl3ZP%2B%
> > 2FSFTaAN4%2BlFY%3D&amp;reserved=3D0.
>=20
> --
> You received this message because you are subscribed to the Google Groups
> "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send an
> email to jailhouse-dev+unsubscribe@googlegroups.com.
> To view this discussion on the web visit
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgroup=
s
> .google.com%2Fd%2Fmsgid%2Fjailhouse-dev%2FDB6PR0402MB2760C093D4
> F7223290A0189188A49%2540DB6PR0402MB2760.eurprd04.prod.outlook.co
> m&amp;data=3D04%7C01%7Cpeng.fan%40nxp.com%7Cab0d7ed7bd7b4517b04
> c08d97f37b8d9%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C1%7C63
> 7680699575016229%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMD
> AiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata
> =3DruUC5vfACXqWqMwhF%2BjNVTSsS4rE%2Fpi8ulTPI%2FXwv4A%3D&amp;res
> erved=3D0.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/AM9PR04MB9015AA4669C038DEA4E4CA0988AA9%40AM9PR04MB9015.eurprd=
04.prod.outlook.com.
