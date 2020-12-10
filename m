Return-Path: <jailhouse-dev+bncBDGILGE54ELBBRHZZD7AKGQEO7GNVLA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x537.google.com (mail-ed1-x537.google.com [IPv6:2a00:1450:4864:20::537])
	by mail.lfdr.de (Postfix) with ESMTPS id B0DDC2D5F5F
	for <lists+jailhouse-dev@lfdr.de>; Thu, 10 Dec 2020 16:20:39 +0100 (CET)
Received: by mail-ed1-x537.google.com with SMTP id l33sf2582261ede.1
        for <lists+jailhouse-dev@lfdr.de>; Thu, 10 Dec 2020 07:20:39 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1607613639; cv=pass;
        d=google.com; s=arc-20160816;
        b=TgR63Jpo+Z8HN/28UJqua/qwsq+FYWSGBzNWUkfHm51HwKEW0PuFI+oYgBn68Pwlfv
         IXx7wa5axdUmwf/p198X4ZDD9Gn6X3BaMPnfvnCPTePQUf7sU90Bb3VpqucO6mygaaG/
         1Bdz/TQK75MuST4jTr/qun6KGoCVpjrY5jCh9CuN/NBd2U6a3wriGIW1uBWPBPsojto8
         xcfYY3VrmqxcBXqBSN65x4aUvtj9jTR6lzcp4Ry0K1h+TgxA7OJu0wnp/mx7ejT7aZeZ
         Y3EO5uEV8e3QMFLTfe6WT3vOyvGeSAbMDtP9WaRVANWl16JGJ4ae1pgx+kMkqdyFkhfz
         rWCw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :message-id:date:thread-index:thread-topic:subject:to:from:sender
         :dkim-signature;
        bh=sMst2zVplkorFYFAwy7yek9r2DhKrajIy+HxhdWIoeI=;
        b=ZrIsbnGEDKvcaF4yuSWvf+fom0fIHRWZdNhD5tpX2SWZg5udpff7vcOaAu3IU8SQ9x
         fEKxyE8yV8vINACf1MXbpqGVFXkvsrOdZhFjUs7orhB7JaRgujqWEFA0zBCTTzDaOo88
         GoFf9RY2H2F9jcEzUXuEg8UInVYmq9lar44NFUy/PCLY0NAQ7pWN71XwHFn5Ch21bUoA
         ZG+r9KOuJFI0fVhJymnDKvozEw4XsYbKJPeP3y3oOsZGsyDX6rFiZzcig5wo/CieHUYO
         wBBXDJymHEohzaTOfkkGnBLzDPFygajLGFOI0KZRIqjv1w6bE8rzeFkqcXGePRpQDsnj
         +RDQ==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@prodrive-technologies.com header.s=selector1 header.b=b6qj6i4B;
       arc=pass (i=1 spf=pass spfdomain=prodrive-technologies.com dkim=pass dkdomain=prodrive-technologies.com dmarc=pass fromdomain=prodrive-technologies.com);
       spf=pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com designates 40.107.15.133 as permitted sender) smtp.mailfrom=bram.hooimeijer@prodrive-technologies.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=prodrive-technologies.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :accept-language:content-language:content-transfer-encoding
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=sMst2zVplkorFYFAwy7yek9r2DhKrajIy+HxhdWIoeI=;
        b=rTda8IwnZXXw7fVw44pn09FkfI7bMqMRFSkqvzo4oJ0nbD3iLf1FddKlx7H1eEITYw
         eyz91DP1W8yl/qyliOveP5t+K1sIjHzPtjkkDU1xrmWex24PqkePCF5SfYksrCKdg6nS
         HfYokurU2spMU1GI1nkvZ1aTh0QpCqSzQp+27qY9yoAQIpcpAcqhmHF/lpMafIm9jtMG
         JjKIaNZ1yAfUhQxWVIXeTlN6cy8q61ruDLDsR4w4mjLhnJ+jzCTwLF8cySB37tnHNVP1
         De3EdoGSbx2lFJVimRavuKuPjfHHdsTbC5yEz57crviIVRnhwoonR4fB143aBo6twP6P
         3/fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:accept-language:content-language
         :content-transfer-encoding:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=sMst2zVplkorFYFAwy7yek9r2DhKrajIy+HxhdWIoeI=;
        b=nAcpS7bqjHx7iuVmSY6eDu/eOIPiE1ZP4BxtP7JEccAhQA8ny3ssf1VMNlUz5run19
         pxfzQhyGwiTbi1JW8pbVrhwPwuFvguA7TE5M9cACJZCT30BJ1bvE8MDpaLBcdScOatlz
         kBUrXE2Q6rigYm9S9Di5ek4m1tVv+y4iZl1ihHfqGxtNomkCPCWv7ncrGcg0/cBDdK5q
         hR3IDv+y+MIzLlU9G0UqlwnTKuK9suMY5x9sz9NDRp0g4tbGljL++DD5Jpz8pp65XTMO
         3AfZIDwVXZo1H+Wu1JFNwx0UDuBJ0GLap6+VTndEYyOlkrI+EFAYuC6MqIzNYWw7pnsj
         npsQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530m7KcuTmHItBSkuwSGvvHwZyg5wDlOoQeRBzs/jRz4ScGyHS0c
	eoI8lkk4Vr06ctUhElpeEj4=
X-Google-Smtp-Source: ABdhPJwwRxwkWK3vSkpCV6v8CbN140vtRLdJIvrlpH9/hgja3WOooqyY9yanqGFc7smxHpKft6csSw==
X-Received: by 2002:a17:906:eb5b:: with SMTP id mc27mr6796884ejb.163.1607613636988;
        Thu, 10 Dec 2020 07:20:36 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:cec7:: with SMTP id si7ls244459ejb.2.gmail; Thu, 10
 Dec 2020 07:20:36 -0800 (PST)
X-Received: by 2002:a17:906:68c4:: with SMTP id y4mr7039984ejr.332.1607613636055;
        Thu, 10 Dec 2020 07:20:36 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1607613636; cv=pass;
        d=google.com; s=arc-20160816;
        b=c8TPnjrEKXsprpfN/opAdUHj4NnjKeTmrzf1k0OTdYqBkqTrIJHAJQ0sbOl+F4Q1Wi
         XdladvMyj4LAad9wnZz3oC5SrfLPHjuGn38P4PCdm00VH8SGnnVB+fkSlkhSSGMH70Qe
         9/N5pBt90Uwg50lS2Dr0u3P4+3BwfqbRoOKdyVm9g4MLESoWxJ1PBdpcO6URXxJWRe63
         aCFK0+05UByJgdTaXt3qZ/ykYrUYqS05Wt3CHSxBSmWsAiASd4mjOmzh/RdK5A9N5Qk2
         USI42lySocYRigZfAuEe+cZc98Iyl0PMnPoNrOBkgIz17m/FmIA7T/Cyt/hTWy3NSUfd
         bMmQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :to:from:dkim-signature;
        bh=7U4go/F6XLO7B61K2bOOdlJu0r/x1iQVGWWzIxe+6qI=;
        b=zcIenGKYecd7gWi3nml8jREucFKsvpmLQTty+DuO4CmWP+FbeYcJoHnYMnmiPzcfhP
         8GzxxAthr9N6TqZgReh5Js8HhdV7vaFIHcdWeS2isbVXakElJ0KRCiASrKb+UX/VJfbO
         q82mZgPCW8lN2+/LU9D1rPOp2U9kUWFrCtvOL6m0ORvtdWxe19GFm5qkENBrBiF5JY6g
         heF+MSaCG1EHjvmXdRFLYZNxS2+4fgsIBUFRYsvp0p6Feoe/N/LV3PF9xyOrfFGfKr+N
         knkTkBqBY8+szgivlYiyXrjHv0lY0qgTTWbOPtXj+x9ac8rQ9aLknEcvdU1S14YMIwah
         /qwg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@prodrive-technologies.com header.s=selector1 header.b=b6qj6i4B;
       arc=pass (i=1 spf=pass spfdomain=prodrive-technologies.com dkim=pass dkdomain=prodrive-technologies.com dmarc=pass fromdomain=prodrive-technologies.com);
       spf=pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com designates 40.107.15.133 as permitted sender) smtp.mailfrom=bram.hooimeijer@prodrive-technologies.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=prodrive-technologies.com
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (mail-eopbgr150133.outbound.protection.outlook.com. [40.107.15.133])
        by gmr-mx.google.com with ESMTPS id i3si168842edy.3.2020.12.10.07.20.35
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 Dec 2020 07:20:36 -0800 (PST)
Received-SPF: pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com designates 40.107.15.133 as permitted sender) client-ip=40.107.15.133;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LzbgfGwhbW+t72XANpBva+DRv8aisDhMvgcrglCDXqrhcgERkVpDDOVL+/D1W4oaizRoiVDKKyCWLnBM7kBtJcEZDM1KrcI6+l9FUO5+2LKKbfJRVtrovL1cANM9FQIIwMr4MbdZtKET3d4BharvCzxeYAK3JqbksgT/ovabwCzJRMOpVKKEJwYGq6mCjhyrz5e6/2eMTkrIAhlhzK17q5UXmKuP4vEPeTqtvn4tGJndNUjIAlPgMt4IZiP/FZNH3A/euKV5GZSgzK70EHSgrJL8W6SlbKupF8HHpmFTmx4nAOVWXzxnN1Fw3MJYOBXZMSpx+HkNcO5kF25W0noaiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7U4go/F6XLO7B61K2bOOdlJu0r/x1iQVGWWzIxe+6qI=;
 b=g5CbnBH3/PwAC+kThg1YsgP5yILD45niwVaWuKG3PSCYbj8/UPIILyrNUI9FJUc2lO+29tFaLOXKkGSKqGBGuYrGLmjQd/riB+m4FK/9tWDJprCrkZns4mX8kdLEb/0eWy3zo32EOdECXFEsxuivQJALZQwBTOxYN/lxy2AyiDLjEC3Z0sTk9qBuy9vTjO8jzJGzZKnEwnviLaVEcmXFBVU83HKae4MgvRd5G7zAsUS7R9pLthXyc0fBqH1+uDoVj6/5fdSG0Nno/6RINZkrHxBU0sbo8b1ftjGkyinV3DxEX22qnQEY8H9JD+icCR5Ii6xy9yxMHIz5coUUKqwecw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prodrive-technologies.com; dmarc=pass action=none
 header.from=prodrive-technologies.com; dkim=pass
 header.d=prodrive-technologies.com; arc=none
Received: from AS8PR02MB6663.eurprd02.prod.outlook.com (2603:10a6:20b:257::14)
 by AM6PR02MB4389.eurprd02.prod.outlook.com (2603:10a6:20b:3e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12; Thu, 10 Dec
 2020 15:20:35 +0000
Received: from AS8PR02MB6663.eurprd02.prod.outlook.com
 ([fe80::8853:89c2:5d61:669a]) by AS8PR02MB6663.eurprd02.prod.outlook.com
 ([fe80::8853:89c2:5d61:669a%7]) with mapi id 15.20.3632.025; Thu, 10 Dec 2020
 15:20:35 +0000
From: Bram Hooimeijer <bram.hooimeijer@prodrive-technologies.com>
To: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
Subject: Jailhouse Installation Feedback
Thread-Topic: Jailhouse Installation Feedback
Thread-Index: AdbPAqXumcu/noOAQZOoHctg4uYP8A==
Date: Thu, 10 Dec 2020 15:20:34 +0000
Message-ID: <AS8PR02MB6663A103382B6B698EB2B7EBB6CB0@AS8PR02MB6663.eurprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [213.127.64.7]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7829db57-949f-4730-3379-08d89d1f2447
x-ms-traffictypediagnostic: AM6PR02MB4389:
x-microsoft-antispam-prvs: <AM6PR02MB43892957F6B0BCC888BD607CB6CB0@AM6PR02MB4389.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rwQy/lHottNQ8NIlNYwqrfqZ3mIjGjvh5uZptT3pHuB2lysbS7qsZkPxAeOg2jCqDJlc7kcKRIPlIhKWK0doIlRTuwgHMTB/+hCChdSakagAwqSRFWfJXb8HiAFBfqKOYmSc24ocBq7ZHfXhoAcdkftI7Ep7RmifvpSHYKeDn48boxu3/wi+LFqybF9+n/1karKujkYVe5Ytwxh6E42DQI0yVNVjl3y9mWGq21tt+3CCzoAcM4xZZoDQWTBOBkoFM6p59UqFxi0HveOB6CZx/d7w56amqNt/Jecqg+XjtGaB0RcQYHI5lO0ms4WKciAxUUp5bbjaIcQ/Jadorz8cmQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR02MB6663.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(376002)(136003)(396003)(39840400004)(6506007)(66556008)(55016002)(44832011)(66446008)(66946007)(186003)(9686003)(2906002)(64756008)(86362001)(5660300002)(7116003)(316002)(71200400001)(66476007)(26005)(8936002)(33656002)(45080400002)(76116006)(6916009)(3480700007)(8676002)(7696005)(478600001)(52536014)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?ajFeIvSxmvy7GpPnelkk+hIudT4CTEhbwCIVt7PmzUflUW0fHsxzgeK1un3g?=
 =?us-ascii?Q?HAWnALNFvcPiBDIndr19AVr253piLPgn0dbr11cQ7RubpV8IgRLxqBl4cJ0T?=
 =?us-ascii?Q?TdMH9oY5qHMrSvPnx5g9jx0EAWFG8UKNp1Nl9pUkmZTxKVZcL4JRHR9oSGvN?=
 =?us-ascii?Q?HWYvjhqVAyNGdRliMg6CuSD/jt5OJkstS8zB16uQDstBKdnMYoh4z57mCDp6?=
 =?us-ascii?Q?cPg/Haq+rYo5vyjeUQa8hGPpZ1LJAqVR+zlZhgc+jPGRDecoAHurflDj2jnp?=
 =?us-ascii?Q?BMtDfqbD1eBZRo/KFEC5x+5sOOkTrBq2WKE4KIW9ofxReGgLWp1DGfWcUjn4?=
 =?us-ascii?Q?n5a3NNiyy9Emr4h6rf+cjf/U4xuvsoKlRl50yHubZ17aFxP56+jX5JM9XjN8?=
 =?us-ascii?Q?xs9pOPDpBFhxbRVVxbAURYiixBgsRNjofyDEN2s7rnmEzA0OMEKpf6hSzdVF?=
 =?us-ascii?Q?ztbK+vcORf9Tt0W3nJ+9wqs/a+MOWsTRwDz4L2R5XzMhHHPql7z4zFGMD7RD?=
 =?us-ascii?Q?IT+4DW4BbqkB1WfUPACJTnabd9YGdMiK0q67W0bIo3JsP64sKCS2EVi8aPac?=
 =?us-ascii?Q?r80FkoxAziGxYwfhDum9/4Gthfn0vFBJIDeNtROT581om5NsZEJJz+Gef4rV?=
 =?us-ascii?Q?nK+R6rbMR1MvgMq3ITJ+H+w74BqB7w01bJNDs8yX6vxPeczjHcqF2e6Ek3+h?=
 =?us-ascii?Q?ZqiCryjRElMoVuIBjeMFZuXmLsqUpMcnXLOGevkDsWHoyVBKzUay7hNHRCBJ?=
 =?us-ascii?Q?hFcFIksQBjuCHNUAUo0fp3mqO4DaLsqgx0w24wpD+wj7/Eejo7ylrizzZGst?=
 =?us-ascii?Q?0B3/kb6X+9oyc2XMN6FCHD+5fvG6takhbYhyj3ZFzxBlf84BTaOcd5hk3QqL?=
 =?us-ascii?Q?JOBatI9pqNCwe+4GRPN2ccq5bX7cdTvW0tiJ2wYPFp1h6MnavWG90ZqtAH9F?=
 =?us-ascii?Q?VCEqxF0A5N4P+kPmYSurxNObuxNAETXoudye3IDEKRI=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: prodrive-technologies.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR02MB6663.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7829db57-949f-4730-3379-08d89d1f2447
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2020 15:20:34.9107
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 612607c9-5af7-4e7f-8976-faf1ae77be60
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OueqlMM5z15CLf9mPa7RzC67CpxjsaJ5wm8s4JSFbd8TZOVzCHM7y47du5pYj9yZ0hkj7MoVujnr0OJOYb9Yehnx9ADbP5rUT6B/K4oN5ANn8NM0+eqD8emGRWDA8P/wMkWYewjLd0GbX5jzclKNMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR02MB4389
X-Original-Sender: bram.hooimeijer@prodrive-technologies.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@prodrive-technologies.com header.s=selector1 header.b=b6qj6i4B;
       arc=pass (i=1 spf=pass spfdomain=prodrive-technologies.com dkim=pass
 dkdomain=prodrive-technologies.com dmarc=pass fromdomain=prodrive-technologies.com);
       spf=pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com
 designates 40.107.15.133 as permitted sender) smtp.mailfrom=bram.hooimeijer@prodrive-technologies.com;
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

Dear Jailhouse community,

Over the last days I have been trying to get Jailhouse running on real hard=
ware. I ran into quite some issues, but managed to get it running eventuall=
y.=20
For some issues, I was able to find a solution somewhere in the mailing arc=
hives, but not for all of them. So I thought I'd share my experiences here =
for future references.=20
There's also some solutions which are not entirely clear. If you have any r=
eference on that it would be welcome, but I understand these might be very =
system specific as well.=20

** Installing Jailhouse **
* Installing Jailhouse on generic Ubuntu (2.10) gives the following error:=
=20
> ERROR: modpost: "lapic_timer_period" [/data/ecseqm/jailhouse/510_siemens_=
jailhouse/driver/jailhouse.ko] undefined!
> ERROR: modpost: "__get_vm_area_caller" [/data/ecseqm/jailhouse/510_siemen=
s_jailhouse/driver/jailhouse.ko] undefined!
> ERROR: modpost: "ioremap_page_range" [/data/ecseqm/jailhouse/510_siemens_=
jailhouse/driver/jailhouse.ko] undefined!
I believe some of the kernel symbols have been renamed in I believe 5.8. As=
 a solution, I switched to 2.04 LTS (Kernel 5.4), where it installed withou=
t issues.

** Enabling Jailhouse
* enabling a compiled sysconfig.cell results in:
> JAILHOUSE_ENABLE: Invalid argument
with dmesg listing:
> jailhouse: Not a system configuration
This issue was already reported on the mailing list, but I'd like to note t=
hat it was not a singular case. Switching from GCC-9 to GCC-7 solved the is=
sue for me too. I guess GCC-9 takes the freedom to move the header away fro=
m the initial memory location, which results in Jailhouse failing to verify=
 the .cell to be a system configuration description.=20

* enabling results in:=20
> FATAL: Unhandled MSR write: c8f
Ubuntu distributions have CONFIG_X86_CPU_RESCTRL=3Dy kernel config set by d=
efault. I do not know how widespread this is. Apparently, this conflicts wi=
th jailhouse, as such a Linux kernel tends to write to 0xc8f: IA32_PQR_ASSO=
C. Disabling rdt over the kernel commandline does not solve the issue. Perh=
aps it might be useful to extend the hardware check to check for this flag?=
 Rebuilding the kernel without RESCTRL fixed the issue.

* enabling results in:=20
> FATAL: Invalid MMIO/RAM read, addr: 0x0000000087a6e070 size: 8
> FATAL: Invalid MMIO/RAM write, addr: 0x0000000087a6e018 size: 0
These memory accesses are=20
> 86dff000-924fefff : Reserved
>   89f5b018-89f5b06f : APEI ERST
>   89f5b070-89f5d017 : APEI ERST
The APEI ERST are included by jailhouse by default, however the remainder o=
f the reserved region is not. Passing this to jailhouse solves the issue. D=
oes anybody have any idea where this region could be used for? I expect som=
e bios driver? Is there a way to detect which driver is interfering here?=
=20

* Similarly, a violation was found while destroying a non-root cell:=20
> FATAL: Invalid PIO read, port: 500 size: 2
Which jailhouse identifies as:=20
> /* Port I/O: 0510-0515 : ACPI CPU throttle */
> PIO_RANGE(0x510, 0x6),
Again, passing the port solves the issue. Does anybody have a clue why the =
CPU throttle is required to destroy a non-root cell? Is it an idea to inclu=
de these PIO ports by default in the config creation?

The last issues were described to some extend in Jan's ELCE talk in 2016, "=
Tutorial: Bootstrapping the Partitioning Hypervisor Jailhouse". I really li=
ked the introduction and think it is an excellent talk to get started with =
Jailhouse.=20
However, it is not linked in e.g. the readme or the FAQ. This might be bene=
ficial.

If anyone has any ideas about the PIO/Memory requirements, that would be re=
ally welcome.=20

Thanks for all the efforts put in Jailhouse.=20

Kind regards,

Bram Hooimeijer=20

Disclaimer: The content of this e-mail is intended solely for the use of th=
e Individual or entity to whom it is addressed. If you have received this c=
ommunication in error, be aware that forwarding it, copying it, or in any w=
ay disclosing its content to any other person, is strictly prohibited. If y=
ou have received this communication in error, please notify the author by r=
eplying to this e-mail immediately.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/AS8PR02MB6663A103382B6B698EB2B7EBB6CB0%40AS8PR02MB6663.eurprd=
02.prod.outlook.com.
