Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBXNJQ72AKGQEKRDWUMA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23f.google.com (mail-lj1-x23f.google.com [IPv6:2a00:1450:4864:20::23f])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD8F197A7F
	for <lists+jailhouse-dev@lfdr.de>; Mon, 30 Mar 2020 13:15:42 +0200 (CEST)
Received: by mail-lj1-x23f.google.com with SMTP id d23sf1774972lji.4
        for <lists+jailhouse-dev@lfdr.de>; Mon, 30 Mar 2020 04:15:42 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1585566941; cv=pass;
        d=google.com; s=arc-20160816;
        b=U0MD7A46rq+mpoHcYziFTgGDkTTaLUuVz4zJhdWJoAj3euIbPW/a8rGJ2lYcrW8f2X
         pqHVLiKeLpdl6Cx7iqxhaBJqbvQt3t+JrY9kA2q8Bc3oNFF/8zWqEx4KFQJSKzIMJgJl
         v6gYc56QEY9q5aMtXOjglXQ9qIfe9u9pspRgoeaYM+WjXxT95Be/iI/yLUfWRmbuE8GZ
         5C2qakAbAlmG46Zl/mc0jptMjCltzwH1Hd7YF44qCMfWpLVh+WkfWGGCDFDYEfTgu/nq
         +ff/mzrOssC3UnXe1IJ6i47xBFE7gtlbq7Wc1yo/bar3JR6PSEeCaGTpvsQmPTlvRJBK
         M8cw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=MTGBFjdSaHo+g1kD3O7o97r/jEJoT0NrLkEKITQcpc0=;
        b=UjCUPpdRK4ngoOuLBFzBxu6SzWXAv0h7bFcJ9x69XGlqwzx1GqqgZIc7zaXbaAB9qh
         ISIUn7RUWotWb0zrYhqvDYkYhD7onQXq/7IIgLfpheqXU0eS2itUq2DjGp4J3xoCmILg
         A4rnVrd9lSpwUB03MCF5rWb+RE/ufcgVeZptha9Sji1TiwdSV/8FIEiQtpDTFE0EsO9I
         ETUHlf0/CalTwkY5g607/N11uPKN3H7QB2IQJtQFLLGvwFxnpdrRf7MytRCPQ06+dIrS
         pZZkvp1ChyhMjBmUrU4ybL4eo/ToqKDJQ88xWgacHjnGxkrM54Xcuf0zhiZZqRjnLKG9
         jf3Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=AlC8hhpU;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=MTGBFjdSaHo+g1kD3O7o97r/jEJoT0NrLkEKITQcpc0=;
        b=eoCXvAulI2ubGeiuREoS1XMBkaecGkZejdi30OV5vGFHhAtEfIa9zmZrCdKzsi4DVw
         WGeXeGC3PWG0y3KyLy0jpiClICinFf6KXP+/+t02wmQuoBIsmsdugYgIgAzVfZYawUDz
         245+j/SBfIE6O2JW0zJluqJ/6NoVk5/s1vScrnhi/7hjrSxUlrN9vVAvu2i6yAULSqS3
         Nii2S/Ku/wEC/LMrXX43AEJ1ttO9GnOJiT1W7h43UsYPOVPb3toir1/pJ1QvXaLCePYq
         hztGntPxXDYR1LtDLT7WKwr+cBbXsVSjdfIV95XLXdP5MrLpctTfX1f41svdd/kpV1RN
         03zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=MTGBFjdSaHo+g1kD3O7o97r/jEJoT0NrLkEKITQcpc0=;
        b=t/XI//3WhrxxUtls/I7PGQz5BisSE4ps0Fa82lA6SfoePma1Tj0IN5sO5FzDuZYRSa
         04A6WMWReXwZTd5/gYJA7M9BJIeLEcVfBP/PW3tpSolJorrxi1sm6qlM9WoP68bUumQ8
         Lzekl387TgRqQtK2/mheQJ0+NaAPTTAuFyH4ocaq/ns8e8z/QfZ2e2/540u5UvFPu9Jv
         SVfAxgjmuxwut2yT7fVWyutylE/oBgMXGZ4sTLUdhUVwkSJic0czGDR3XTODh5k+XA15
         HPo7UHFaSIsrwAOO++BzCqh/Y86L7v8wAdddp15Ewtd1h1iqQfCa/IAWzQndD5YmlgIJ
         iPZQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AGi0PubsWLqrPrBm+vQY5/Po/kz0611G6svJ4jPn7oO7+s97ZR9lt9Au
	U0vKba/5EE0HcjMxCA4iaRs=
X-Google-Smtp-Source: APiQypJikRgWsbeDoLrVtAsZqyZrcMpyBkmArvkcYrX94Td7fXCG9FH5zjI8wKFOkBbpzfZsqhYWoQ==
X-Received: by 2002:a05:6512:203c:: with SMTP id s28mr7435603lfs.49.1585566941466;
        Mon, 30 Mar 2020 04:15:41 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:8ec7:: with SMTP id e7ls3990626ljl.0.gmail; Mon, 30 Mar
 2020 04:15:40 -0700 (PDT)
X-Received: by 2002:a2e:b801:: with SMTP id u1mr6753052ljo.84.1585566940705;
        Mon, 30 Mar 2020 04:15:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585566940; cv=none;
        d=google.com; s=arc-20160816;
        b=suT2GizgtjwoLadq+4WApJlU+ZZXE0NZo8dw6hH6t+isgpE2x1KhTG5Uljwa+jrvuT
         sAamGCk+JOFdWL1epYcpX9os8v9nEpY1cVl6NFVF0qvCH6KOK8cEvgVfbUY6pAlmR8Ye
         NZzc5tgBvAFFgsnHK6CT1Y+n7cUfS65qMrv8RfSmdUg+7NsCgZeKMAasvMPBXtZSzKL6
         TRRiir0YehjGzrLqNDlXW1gBCPbavIwFzlrrmqO7HYSj7W8weo5xsBrxft+sL+oZupGT
         YJwy+6pV09fphW46pmKAWfmCTYCqKM1UOqhkhAZiLmGH6S/Un54aGl/tVUoWZt2DAF43
         TN1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=Bgib789WkcGf7tFniChT3u/ESFr48whgJPYHcp4jGYQ=;
        b=OP9/8Ew7wZDFymWu/u+VdRiRHCfuVrhUxJ7/VAg6gQMC2AweUXNsOXimUP4VvW3wNm
         fcwyKNFVkkqEMb6vzoaftWpbWUYv4uXa3ifUE4D8s18PzS9dQEjKCkGhKjBClZUPZTx9
         ANX57oPHxZ5Z1pgYNUhFBLjABbJB3y4EbzilSIvxwbR0P0P4eF4IyrBcaN2PVVVeeq9K
         P/TKYJrG8KGo7m7n4HreUx8zuqghyPl08tHE9NkFz1/Pt15X+Ya9HXydMkQPVT2SoFjz
         e/1NKw3jL3zrR0IeqYTr3RS1iX55R547ipDvN4hZWZbvqDv8wbJb9XLzsPTvN9scBgyS
         0mTw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=AlC8hhpU;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.4])
        by gmr-mx.google.com with ESMTPS id e4si600666ljn.1.2020.03.30.04.15.40
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 30 Mar 2020 04:15:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) client-ip=212.227.15.4;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.55.156]) by smtp.web.de (mrweb001
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0LuMER-1jBHJ60oTP-011mCj; Mon, 30
 Mar 2020 13:15:39 +0200
Subject: Re: GSoC'20 Interested Student: Adding support to Jailhouse
 Hypervisor
To: PRAKHAR BANSAL <prakharbansal0910@gmail.com>
Cc: jailhouse-dev@googlegroups.com,
 "libvir-list@redhat.com" <libvir-list@redhat.com>
References: <CAD6ScS9OfG2T3_YBUG8sRMHGVQyFvDwfm_wGtz880yTpBdfygQ@mail.gmail.com>
 <6557f1be-cce8-21c3-0b76-c78901acecda@siemens.com>
 <CAD6ScS86TxG7yk=EzQWV1UiAiEnJaJxWar6Bi4yzbBW+So9hKA@mail.gmail.com>
 <a0c156aa-f87d-e5ea-d3c3-7b7929c503c4@web.de>
 <CAD6ScS9oSd9=emq3ywSTEng2EwWj1AoBsYQhizEuSP8osMM7sQ@mail.gmail.com>
 <8c54c380-92e7-046c-33e1-4c88a3446bfb@web.de>
 <CAD6ScS-ZpOunQC0EhfDTQaPX_ua=dcCccF+UwMoLo=o+ROE42A@mail.gmail.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <990fc418-0b4e-b2b2-8963-af350a8c516c@web.de>
Date: Mon, 30 Mar 2020 13:15:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAD6ScS-ZpOunQC0EhfDTQaPX_ua=dcCccF+UwMoLo=o+ROE42A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:o1Wzv2qN3SLo9S9h6xMpJw+D0PQhdTUEA6bLE0vcrSKdkM+l2jg
 AWbFx3gkTFVzm/afLNC4i1ExvTr7TeU1G4d/tOj7K67DifpTilv8KAyoC1AFxc+p4p7Kn1L
 g292lexFdtS0urvYZ+JvTTH0Qa/1MmHrYVefbFkEZbc8S7lXqSONlLSxiwNJfhik8CC9aek
 xl8G3S0dfrrGQa8bb1DOQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:fW/n/teYLJw=:a16ab6ikIhLCUph8dRykOS
 z8srOcy6uxEKjihslgYeKw5zebk/nRg8DeOFQf/fEDHThQmiH0hPFmtQXpKJKfvzo8+FJnFfL
 rEfCCeBj3AzwuiHhR24XwsyPxGt6vw63mua45Ah/aklxQrKyLTrx4lSph8SLk3fVANCvvb78T
 JnvtGubyOy+Jjp0gLToRaadPDdD4EAe1ExHCzei7nOvYBA70Kajn4utdvxPRkDroqLv5yvzOC
 5G7JPqRbma62U0sdIKebYznCUBnFgvyH7yKLpbK1V231NFSeRY8x4zmdDtblLfj/0d7ocDW7v
 WT2Hzp3xq/bujC+S8/0FVSqmNBy5Idx9p3C2d9eICVg6MvhIInsgNxtwzk7mQAKWwNZlyV/0d
 Gbs3C4znl9KJrSg1IHUavkWF8tbYwxU64buOc8/lg/PGiADKLGTPf/y+ClJIOmELyk9mRxiPJ
 MGNNEGev3Rh//JzmuKZ/WI9z0jc/5WlH+cG9iYxUAqlZCJBV/YWACQTt1qWm/IFHc94a3wICH
 XF0ymsplK1ZH0gz4igTXsKFE60gvXMyaItNKbjtAVDuZ5SRBUujevbjMR0oScJl/mv0+BUOS3
 h6/D3Ms1kqUvNIrnwxni4HMG0zAJMnAetqjQ10O2m+u3P+ngfRRvfT9N90DVqwyWIsQK4C0I/
 SAxldoRnXd6uQyvpP4hu32zyq2BYJoovb1WBF+ST19hPLr6wdANU2mzRwIwG7aDgynh7id+8z
 ZxZENWphCNSqBdj7n2JIkhI+JtMHouTww0ClcOlJPHDUyCdi3ixPX9IEgCDctzpQ+Fd4C5LUR
 Hhb13z0v9JEe4BFEfHHIAOey4NlaXaxe3I8vxRNxWWPMJFXI4eKrFIjxcK1L1g5r2kC9Kx9jV
 Dlu6cA2ecCt2O0Ut+BzRGH1NSuSyvGWxxOzCnGKh7AfxfW7bo/5H3Gk3WkLc17oNuk0eCzIl3
 hzFXGBtMkVAVInmy7Jj+qTFZoJg2TPfwblhY/E9ah4TG3YLVMLy930iYqeJamZ6t8MaqtY4bl
 LYhTwXVKUoArPOv2JWRD7djmcXZMReEvncOnla2oBx8ibhrz89K66MwgJ7+yD7CDgh7+QEjnL
 a9wMMxotT1jIWBZgBCrzIG55dzQ3caXBlPMysxYmU5B+jdfTq3oiVa9He5ex4wzxhvJARn00j
 xipVP80DUVqak7V//PJt4bSo25czhS77fwl1LWMw81K7M760+nX3rCoebwj3zKZ4tR+ElQTBv
 aeHhiAjySld51/h1Zl3Y3cFkMCQjiT7CwqcSulNM8ircgsLM9QYl0aobo0vq3H1F+kj9JBW6I
 aEzuOWAISlR6ezOiTsuutuG8ckLCXmSli9PEuSADX5I9LjYS12x/rHUKGkqYRShvtDhgxz6f
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=AlC8hhpU;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted
 sender) smtp.mailfrom=jan.kiszka@web.de
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

On 30.03.20 10:02, PRAKHAR BANSAL wrote:
> Hi=C2=A0Jan,
>
> On Sat, Mar 28, 2020 at 4:12 AM Jan Kiszka <jan.kiszka@web.de
> <mailto:jan.kiszka@web.de>> wrote:
>
>     On 28.03.20 08:47, PRAKHAR BANSAL wrote:
>      > Hi=C2=A0Jan,
>      >
>      > Thanks for the reply!
>      >
>      > I was only considering=C2=A0the command-line tool "code" for refer=
ence
>     to the
>      > Jailhouse kernel API(ioctl calls) because I didn't find a
>     documentation
>      > of the Jailhouse kernel APIs.
>
>     Right, the IOCTL API is not documented so far. It is currently only u=
sed
>     inside the Jailhouse project. This needs to be formalized when there
>     shall be external users like a libvirt driver.
>
>     That might be a nice small contribution task: Create some
>     Documentation/driver-interfaces.md that describes the IOCTLs along wi=
th
>     their parameter structures and that also includes the current
>     sysfs-entries.txt as a section. Then send this as patch here. I'll he=
lp
>     out when details are not clear from reading the code.
>
> Sure. I will do that.
>
>      >
>      > For the second part as you mentioned that Jailhouse can only creat=
e
>      > cells with the constraints defined in the root cell configuration.=
 I
>      > have a few questions regarding that.
>      >
>      > 1. Is there a way to know if Jailhouse is enabled on the host and =
get
>      > the root cell configuration(s) from Jailhouse through an API?
>     This can
>      > be used while binding the libvirt to the Jailhouse hypervisor.
>
>     Look at
>     https://github.com/siemens/jailhouse/blob/master/Documentation/sysfs-=
entries.txt
>     for what is reported as runtime information. Full configurations can'=
t
>     be read back at this point. This might be reconsidered in the light o=
f
>     [1], but I wouldn't plat for that yet.
>
>
> Ok, sure. I am looking into it.
>
>
>      >
>      > 2. If Jailhouse is not enabled(again can we know this using some A=
PI)
>      > then, can libvirt enable/disable Jailhouse during the libvirt
>     binding of
>      > the Jailhouse driver with a given set of Jailhouse cell
>     configurations
>      > describing a complete partitioned system?
>
>     With the API above and a given configuration set, yes. The config set
>     would have to be provided to the libvirt driver in some to-be-defined
>     way (e.g. /etc/libvirt/jailhouse.conf -> /etc/libvirt/jailhouse/*.cel=
l).
>
> Cool, got it. Thanks!
>
>      >
>      > 3. I was wondering, as you mentioned that libvirt driver should ch=
eck
>      > for mismatch of the cell configuration with the root cell
>     configuration,
>      > the question is, isn't that done by Jailhouse itself? If yes, then
>      > libvirt can just pass on the cell creation requests to Jailhouse a=
nd
>      > return the response to the user as it is, rather than driver
>     doing any
>      > such mismatch check.
>
>     With matching I'm referring to a libvirt user request like "create a
>     domain with 2 CPUs", while there are no cells left that have more tha=
n
>     one CPU. Or "give the domain 1G RAM", and you need to find an availab=
le
>     cell with that much memory. Those are simple examples. A request that
>     states "connect the domain to the host network A" implies that a cell
>     has a shared-memory link to, say, the root cell that can be configure=
d
>     to bridge this. But let's keep that for later and start as simple as
>     possible.
>
>
> Do I need to match the libvirt user-requested cell config with only root
> cells or with all cells present at that time?

With all non-root cells - the root cell will be occupied already (it
runs libvirt e.g.).

>
> I wanted to request you for a favor for the proposal as the deadline is
> approaching. Could I prepare a proposal for this project based on our
> discussion here and improve it later based on feedback comments after
> the deadline? I understand that I got late in starting on the project
> search and selection.

Sure, please go ahead.

Jan

>
> Thanks,
> Prakhar
>
>
>     Jan
>
>     [1]
>     https://groups.google.com/d/msgid/jailhouse-dev/CADiTV-1QiRhSWZnw%2Bk=
HhJMO-BoA4sAcOmTkQE7ZWbHkGh3Jexw%40mail.gmail.com
>
>      >
>      > -Prakhar
>      >
>      > On Thu, Mar 26, 2020 at 1:49 AM Jan Kiszka <jan.kiszka@web.de
>     <mailto:jan.kiszka@web.de>
>      > <mailto:jan.kiszka@web.de <mailto:jan.kiszka@web.de>>> wrote:
>      >
>      >=C2=A0 =C2=A0 =C2=A0Hi Prakhar,
>      >
>      >=C2=A0 =C2=A0 =C2=A0On 25.03.20 05:36, PRAKHAR BANSAL wrote:
>      >=C2=A0 =C2=A0 =C2=A0 > Hi Jan,
>      >=C2=A0 =C2=A0 =C2=A0 >
>      >=C2=A0 =C2=A0 =C2=A0 > Thanks for the reply. I looked deeper into t=
he libvirt and
>     Jailhouse
>      >=C2=A0 =C2=A0 =C2=A0 > source code and found following two things t=
hat seem
>     relevant to the
>      >=C2=A0 =C2=A0 =C2=A0 > project I am interested in.
>      >=C2=A0 =C2=A0 =C2=A0 >
>      >=C2=A0 =C2=A0 =C2=A0 > - Libvirt driver interface at [libvirt.git]
>      >=C2=A0 =C2=A0 =C2=A0 > <https://libvirt.org/git/?p=3Dlibvirt.git;a=
=3Dtree;hb=3DHEAD>=C2=A0/ src
>      >=C2=A0 =C2=A0 =C2=A0 >
>     <https://libvirt.org/git/?p=3Dlibvirt.git;a=3Dtree;f=3Dsrc;hb=3DHEAD>=
=C2=A0/
>      >=C2=A0 =C2=A0 =C2=A0driver.h
>      >=C2=A0 =C2=A0 =C2=A0 >
>      >
>      =C2=A0<https://libvirt.org/git/?p=3Dlibvirt.git;a=3Dblob_plain;f=3Ds=
rc/driver.h;hb=3DHEAD>
>      >=C2=A0 =C2=A0 =C2=A0 > - Jailhouse tool, which is using the ioctl A=
PI of the
>     Jailhouse,
>      >=C2=A0 =C2=A0 =C2=A0 > available at
>      >=C2=A0 =C2=A0 =C2=A0 >
>     https://github.com/siemens/jailhouse/blob/master/tools/jailhouse.c.
>      >=C2=A0 =C2=A0 =C2=A0 >
>      >=C2=A0 =C2=A0 =C2=A0 > With the help of the above two, it looks lik=
e, a libvirt
>     driver
>      >=C2=A0 =C2=A0 =C2=A0for the
>      >=C2=A0 =C2=A0 =C2=A0 > Jailhouse can be implemented. Let me know if=
 I am moving
>     in the right
>      >=C2=A0 =C2=A0 =C2=A0 > direction so far.
>      >
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0From the Jailhouse perspective, it is im=
portant to not
>     consider the
>      >=C2=A0 =C2=A0 =C2=A0command line tool an interface anymore (like in=
 the first
>     prototype) but
>      >=C2=A0 =C2=A0 =C2=A0build on top of the Linux driver API (ioctls, s=
ysfs). There
>     is already a
>      >=C2=A0 =C2=A0 =C2=A0Python library which started to abstract this i=
nterface for
>      >=C2=A0 =C2=A0 =C2=A0Jailhouse-internal use cases. However, I strong=
ly suspect
>     libvirt will
>      >=C2=A0 =C2=A0 =C2=A0rather want a native binding.
>      >
>      >=C2=A0 =C2=A0 =C2=A0 >
>      >=C2=A0 =C2=A0 =C2=A0 > I have been looking at the other libvirt dri=
ver
>     implementations for
>      >=C2=A0 =C2=A0 =C2=A0 > hypervisors like HyperV and VMware to unders=
tand their
>     implementation
>      >=C2=A0 =C2=A0 =C2=A0 > and learn from there.
>      >
>      >=C2=A0 =C2=A0 =C2=A0As Jailhouse is a static partitioning hyperviso=
r without
>     abstraction of
>      >=C2=A0 =C2=A0 =C2=A0the underlying hardware, your starting point fo=
r the libvirt
>     binding
>      >=C2=A0 =C2=A0 =C2=A0should be a given set of Jailhouse cell configu=
rations
>     describing a
>      >=C2=A0 =C2=A0 =C2=A0complete partitioned system. So rather than ins=
tantiating on
>     demand a
>      >=C2=A0 =C2=A0 =C2=A0domain (Jailhouse cell) with, say, a network ad=
apter, the
>     driver should
>      >=C2=A0 =C2=A0 =C2=A0match a user request for a domain against the c=
onfiguration
>     set and use
>      >=C2=A0 =C2=A0 =C2=A0what is there - or report the mismatch. What it=
 could
>     organize, though,
>      >=C2=A0 =C2=A0 =C2=A0is interconnecting cells that have a (preconfig=
ured) virtual
>     network
>      >=C2=A0 =C2=A0 =C2=A0link to the root cell.
>      >
>      >=C2=A0 =C2=A0 =C2=A0Due to this different concept, there will be no=
 1:1 mapping for
>      >=C2=A0 =C2=A0 =C2=A0commodity hypervisor drivers to the Jailhouse s=
cenario.
>     Still, studying
>      >=C2=A0 =C2=A0 =C2=A0what they do is useful and needed in order to u=
nderstand what
>     "normally"
>      >=C2=A0 =C2=A0 =C2=A0happens and find a reasonable translation. This=
 is probably
>     the most
>      >=C2=A0 =C2=A0 =C2=A0challenging part of the project.
>      >
>      >=C2=A0 =C2=A0 =C2=A0Jan
>      >
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/990fc418-0b4e-b2b2-8963-af350a8c516c%40web.de.
