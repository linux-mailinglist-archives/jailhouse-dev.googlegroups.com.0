Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBCGS5WVAMGQECJ2PBSY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53f.google.com (mail-ed1-x53f.google.com [IPv6:2a00:1450:4864:20::53f])
	by mail.lfdr.de (Postfix) with ESMTPS id 35CA47F155B
	for <lists+jailhouse-dev@lfdr.de>; Mon, 20 Nov 2023 15:11:22 +0100 (CET)
Received: by mail-ed1-x53f.google.com with SMTP id 4fb4d7f45d1cf-540150414efsf3105978a12.3
        for <lists+jailhouse-dev@lfdr.de>; Mon, 20 Nov 2023 06:11:22 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1700489481; cv=pass;
        d=google.com; s=arc-20160816;
        b=AxCO1p7ZddEFefGQBN/7qpHewoqKg4qEwyw/5e5/tmoY2YAC1I02So4y1+DbkFT4Kx
         XOkF8Kgj6Y7WxjVxAwhs3HPgLkxGtvBpPaX/TQybunjYsOamDaWEGtbAyeoZsljv3na5
         hjsdztO0vMtFE0USkrlJWyZBXF5ecWBT1TM0OMYmdmY1NqIxiFIUzQJSh+Idsg7pBqFp
         5GhSrb+RwysKpiYium88niPwHveHliB0sp+5fIFFMI1EqYW7bM4kiH0eLE5MdPgYVQSW
         v+kxJ8+QHVJhg2FSinkhDhACfnQ63wzEAKdIbT68bXwxl1xLVBAVhss6n+yk1Fm+m9hD
         4ZVw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:dkim-signature;
        bh=/bgW2trW0Sx3wW/RvbXPRyVQ9/THZeF5f90RnndIqw0=;
        fh=2cxIsw1LLFkS7vaMzO0KZ+TrRtxPxLIpPee53a0bnd8=;
        b=gR2+2Hw50hHMtC3kwGD+80z99iC0AFTUV2vUMLdV7ar7HIX4Nrap+Zr+AdXDZ+565i
         bAu8qGnleYHE9gJx54MnBTUZR87FpmZ5G6XCW4N6ujU/Nb3VdGvo55cctFv5sJRUDy6j
         m3YyuLjJteIRdEfKDejEiN2HmFj/l0M086DM96S820k95PsjlvInxr92F9dAzxW1fxuf
         +5DiArWg5Q0u/imSzOUxmz4r8kBWSQUZ9i3WSa1GhdNuPkEA8fe3s9ZheWvVg1CwIzXI
         i0RQMwxpvELWyXzfTH871bW8/n2VBNGFRRxhz7ga3n33bz3SuexReqhBxjvgujB0ygN0
         CGlw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=mjDifgGa;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:d:c302:acdc:1979:2:f4 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1700489481; x=1701094281; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:in-reply-to:from:references:to:content-language
         :subject:user-agent:mime-version:date:message-id:sender:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/bgW2trW0Sx3wW/RvbXPRyVQ9/THZeF5f90RnndIqw0=;
        b=RA5flhrXFcvTwWRNxOdKZx6Bm1Io4kFVln71OH6fuEQzSaiiuw5iGKWXvnU8jBkJM+
         R2+J2rfScFRbYfF/Dh9SigkgD8OPHYVRxH/oVKHz1QBWuM5SUYN22yJd7Uh7Oa57UloD
         xLjIs8A5NMQvrOUi+u0hJxlTVhmdXM8RkiaeppEFtjdxIlfxyWhZxxdP5izOjSwCevxi
         QpmRuWzVbTXX16HK6OAQAAIFLbBREyC0P+7904j0+v+Wcs8/UbMxm2IAbtRV2h2E1FYb
         ErGGcD/pPeOr8sCGLpI5XujZp/OFlBNF+kFmQ0pwrv0bmELy7FB37Ti7HmOCZikKIEI3
         BUPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700489481; x=1701094281;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:in-reply-to
         :from:references:to:content-language:subject:user-agent:mime-version
         :date:message-id:x-beenthere:x-gm-message-state:sender:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/bgW2trW0Sx3wW/RvbXPRyVQ9/THZeF5f90RnndIqw0=;
        b=U3B622ZhbuRpbVlcrJVGuLqEYJh2NcVG5nqsFgk5fCqpHKb2zlnWQiB6lYsn7pKFBq
         nopi0ofyxAiuDlAOb86BjXjo13KCJPV1k+p/iH4wvvFoI3g+plFmWg7XsNBE8pN7TVL0
         S83SbXFUfAUWC45Z4a8kWat/h8ayMVAwoEQrKySHxcxlvDVnSXPLyptwtsWbehdBIdTT
         A6b+bTM19kUHjfG2a45UTCDAmIUVl8/dTi6NVMTxG9GmhwTaGZaGMRbWiCTi2gUZoMt7
         YdLnURdii0gpvGLHKZ9eUwUDe6iq/NF9MJqPDdHq4uVN2Pm4lmwU2eizZH9QG3moBDM+
         8FqA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0YwIEQGGkc79RZN8gYEyZNukL4ngYd580Qtb3hEIADpb3neiOvo2
	hLsJwh10r3ggt6QcNWVaoyo=
X-Google-Smtp-Source: AGHT+IEvcFb6etbDPVwHFQMBzTu2ZyQHQtkPJqtjNr4GjgSxfyAA1y/K4/I0oLiH/L6yrbFy1xOiKw==
X-Received: by 2002:a05:6402:202a:b0:540:b0ec:bcc7 with SMTP id ay10-20020a056402202a00b00540b0ecbcc7mr5248955edb.5.1700489481216;
        Mon, 20 Nov 2023 06:11:21 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6402:1cce:b0:543:7afc:7030 with SMTP id
 ds14-20020a0564021cce00b005437afc7030ls2280993edb.1.-pod-prod-05-eu; Mon, 20
 Nov 2023 06:11:19 -0800 (PST)
X-Received: by 2002:a05:6402:70e:b0:543:5f7a:a020 with SMTP id w14-20020a056402070e00b005435f7aa020mr5207088edx.25.1700489478741;
        Mon, 20 Nov 2023 06:11:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700489478; cv=none;
        d=google.com; s=arc-20160816;
        b=rwQPa/cDaHkZ1Sx00TgW1M79OaRDi+JQLsgoMoTzaRcxLXfCOHXL+TNtcZ/Oaq8l/t
         elq/L8Vv9pV3eVdWW+Y4gnZKz2TWtTgenR/GHGY3HFOODMh6sc94mih7WEzx31qWiznP
         xyOfm5pvOT3dndV9Hb5pGYEKYAeKrzVSlQn89se48cB1wBigfMVIU6Cr5oiGEjwq5/7D
         ggfPDXtpDueGsxSJEJP/BM3IevhWDH4om+s0LMUJCi3tNHNQjBUvRj57sFNCIQYW0SYO
         P65Imr17zyR3B7v+xwQM6S0p8DphcQ2TAKTuJuNlnP+cX73ORlfKHNthEcyduTIbtkH3
         Q8Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=kF32nKuQg9OYbK/Oe+xZ0Briegi/d+Iik932vXd1rzY=;
        fh=2cxIsw1LLFkS7vaMzO0KZ+TrRtxPxLIpPee53a0bnd8=;
        b=Xnw0BCeInb6E/bW7NPwCQJ4mZIiFJf6ZjkjMWXa2x6hNydmyC+VE+39FgHXxrVhUna
         XnzrDS5y3C0N/i1HjvVab6MGxBDfzybMOUQaZiHWju0WOYDQ8vbyvqRWHkNg92WRN99/
         d8tr4Cgj1CFfVvYl1Vti3wPOfi1qFp1bncZUFWelQbEwRnQpJ7tUoIb8r30mR8FRBjib
         FlS2/QKbWY6/iPTYM8oJOuV7fuUEoJXIGQLPeoZSOXHU8fckDoWAfNKuxe8kXe3X+6sp
         RKaZY+qDuunmb3nKp2w3atXa+8oUf+t1/5iwlck7JZ6D/Vvi26jxgz3fefcQaz58EHLV
         D6kw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=mjDifgGa;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:d:c302:acdc:1979:2:f4 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from b2752.mx.srv.dfn.de (b2752.mx.srv.dfn.de. [2001:638:d:c302:acdc:1979:2:f4])
        by gmr-mx.google.com with ESMTPS id p12-20020a056402500c00b005457f8a07e6si321250eda.4.2023.11.20.06.11.18
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 06:11:18 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:d:c302:acdc:1979:2:f4 as permitted sender) client-ip=2001:638:d:c302:acdc:1979:2:f4;
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de [IPv6:2001:638:a01:1096::11])
	by b2752.mx.srv.dfn.de (Postfix) with ESMTPS id AD6DF3E00EC;
	Mon, 20 Nov 2023 15:11:17 +0100 (CET)
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4SYqDj1j7yzxpq;
	Mon, 20 Nov 2023 15:11:17 +0100 (CET)
Received: from [IPV6:2001:638:a01:8068:d5bc:30b3:ace4:bf3d]
 (2001:638:a01:8013::226) by E16S03.hs-regensburg.de (2001:638:a01:8013::93)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 20 Nov
 2023 15:11:16 +0100
Message-ID: <df468a43-ecdf-46a4-bf02-31681d3ce799@oth-regensburg.de>
Date: Mon, 20 Nov 2023 15:11:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Development status
Content-Language: en-US
To: Chris Paterson <Chris.Paterson2@renesas.com>,
	"jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>, Jan Kiszka
	<jan.kiszka@siemens.com>
References: <TY2PR01MB3788FD2A0D643FD2E3930CAAB7B4A@TY2PR01MB3788.jpnprd01.prod.outlook.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
In-Reply-To: <TY2PR01MB3788FD2A0D643FD2E3930CAAB7B4A@TY2PR01MB3788.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-Originating-IP: [2001:638:a01:8013::226]
X-ClientProxiedBy: E16S03.hs-regensburg.de (2001:638:a01:8013::93) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=mjDifgGa;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:d:c302:acdc:1979:2:f4 as permitted sender)
 smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;       dmarc=pass (p=NONE
 sp=NONE dis=NONE) header.from=oth-regensburg.de
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

Hi Chris,

On 20/11/2023 14:37, Chris Paterson wrote:
> Hello Jailhouse maintainers,
> 
> I was just looking at Jailhouse GitHub repo [0] and it looks like the master branch hasn't been updated for a while (10 months).
> Is this project still active?

Yes, we're currently still working on the RISC-V Port of Jailhouse, and 
we're almost ready for integration. Therefore, we also have a bunch of 
auxiliary patches in the queue. They'll soon land on the list.

> 
> On a side note, are there any plans to merge the latest patches from the next branch [1] into master?

@Jan: Ping :)

Thanks,
   Ralf

> 
> [0] https://github.com/siemens/jailhouse
> [1] https://github.com/siemens/jailhouse/compare/master...next
> 
> Kind regards, Chris
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/df468a43-ecdf-46a4-bf02-31681d3ce799%40oth-regensburg.de.
