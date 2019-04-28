Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBOHSS3TAKGQER3LXWOA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33a.google.com (mail-wm1-x33a.google.com [IPv6:2a00:1450:4864:20::33a])
	by mail.lfdr.de (Postfix) with ESMTPS id 049DFB60D
	for <lists+jailhouse-dev@lfdr.de>; Sun, 28 Apr 2019 16:31:21 +0200 (CEST)
Received: by mail-wm1-x33a.google.com with SMTP id z128sf7038036wmb.7
        for <lists+jailhouse-dev@lfdr.de>; Sun, 28 Apr 2019 07:31:20 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1556461880; cv=pass;
        d=google.com; s=arc-20160816;
        b=DACeW+9bRjeNavlTRLeuZgX4LbeJfexBpBsm9jWGNI6CwkFIKMxJKKEyieQ0kBqxVW
         r0TNqgHJrRsmaRObLFllfrbK4yN5tNnUI5aKnyu1HM6/mYbmPKEkrRgzj7DWwfFbjm/I
         89hLFsO80oQGUYG7WNwoibapCN1lAwvDtakKVVv/yq0MU2R/j+7HncoZ4H5GiOIBMwSc
         43UFP1GERVvvhcHqwV07lp9/O5lEmVImm9PWM5AcoB8CvCAFuAcZOabrFWWEXRJcvvaM
         TsZYpCtpIHF9iPJ7jtgsqyJkfgpb5KLsgVeOJ4xfpR838vXIqZJvd6a+jd8RnYSxDhGU
         aXwg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=N7SVzgCZg0TTapBePXYFCe/U+bmBDMA3dAlGXUNkKTU=;
        b=fORL97DKmN9HTpGo1BIIXOVRhVVKjJopZt5OMZTinQXW6x8377C1Tv8VcYk2rcZMW4
         1nmm345qLKna+vv82LaDrrpN5FdbbGJ3XUXSDk0VA0J2Ury0z/xP1QLxMa9mxcpdZ3pU
         IFkFdencENzgD8+fBuAuLw1+8uuBR4UXBhLI4QHWrVOn7bYbqq1RBoXf0wzMbKmJ5PQC
         8N7Ik1xCgQ8Q/BSEk6F7Cfb1TKxP8jNztGFqnUMdhKqphqu9n/IodhrtTz2neZuAfikp
         t9xmLEtXo+yeWj/ZhAyjkxEyhuuVo8Y8WvkFfYiG+6BC+qV6Fw8SFDaMsM+5ckYxqqop
         uSOQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=C6RNKOXb;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=N7SVzgCZg0TTapBePXYFCe/U+bmBDMA3dAlGXUNkKTU=;
        b=izZhjF1V03h+MlBRrm4HeoXePYXhykIfVISVCjMlfBGt6JGIehW0USjzc5dlSituHO
         J/wuQojpuPPSsuaeVhB1XCOCn9TLe26rG804Rx0Bfw196bcyN8Jx7Z1ePsuMp6bDZT3x
         qwCXpJsHzufwX37RVO0lLbihqS7ROB4sqzY6NfeeDmOK3b+/vlLJGVcfQgKXn2cg+Dq2
         SLUPECgI11pbaqAY3wdN2EOAqpsVLCqo9aqtg+6wnIUeo8BkOR4xnjB9mUrP3qEEkfNN
         8x53syODL9mE598byp1kdtQtyhQhWp7393egXSBtJUJyULAkbksPZllpSmPKjy3Zo95f
         iDvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=N7SVzgCZg0TTapBePXYFCe/U+bmBDMA3dAlGXUNkKTU=;
        b=ejXTJnxpGycWmWFPqddclegyXf+pqScwyP7hXrxaVl37KIcPnlxo3LnV2uvLHt+pJa
         jk5qO4fJ63lbqeBYSlK6uRyEjvfKo+u1G+yQJU56AEeNPSWlRaBt720GepylL0cFUzdM
         WhccqgDAvQzVLbwVfY+KwD7ayJma0Qi0TNhRI0KdGy5MoLlAu7+gQXYxOgD7Xsmh4Qbr
         a57VvbwE3j4nIf2PgKX5DyQAJayuwxtrtPsBxShGc1Jritvp3G9s9Gjg9NYggdaBy0ay
         xKbNE6J+5JY6MCovzsJJ4l8eKSsWiuBLEpo9PIbIq5jh/wLrdmY9AzC6h7xviKm7UCTe
         YX+A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAX6rCdB5S0FyjaB0mfzxntfpOpK1N3l72E19zsESwe9E5hDEG0N
	IGgm14FZbwbMljG+8F5gS4M=
X-Google-Smtp-Source: APXvYqxWS7vLUw4dO5YsXwfcoL5ePgVx6Tm9Y1rdi4RQW6pzroyKPQJ+vKRv50/HnSiy1XhZC4gk9g==
X-Received: by 2002:adf:ea88:: with SMTP id s8mr16232758wrm.300.1556461880689;
        Sun, 28 Apr 2019 07:31:20 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:2d04:: with SMTP id t4ls5158208wmt.4.gmail; Sun, 28 Apr
 2019 07:31:20 -0700 (PDT)
X-Received: by 2002:a1c:9e55:: with SMTP id h82mr15121695wme.134.1556461880155;
        Sun, 28 Apr 2019 07:31:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556461880; cv=none;
        d=google.com; s=arc-20160816;
        b=qatjZFp6dPAOvQ4odFqjkM5Fsy7CGW2X7iAJqfEsSv99j9Iuy2vmMofKXLIjf/QgEn
         DCn6K0d5YYLWKc6FD42FLkh1qjLhjlSW7JJVXFSiL44QhgNrsq5jQB7NIr5bJQiADmYM
         Wb+5oK47iBu0giNUs092tyb+wr7At5COXTVTwbFh3VyNp/2ETImTKyGppoPhKWCENaO+
         dyUeb91G/nZLb3QUE3LYC+qOiiRAXxQE24GXg/IBItvtwjqYk7eMtpDexcX3GXBdTWbp
         E5LoTnXnrdyyDiVpkLp7Ymitm/GqEO9EapSsodDDoCvIckz8Tscmdt+ZO044L/dwmp0Y
         eX7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=VoWCSYKfF1BiHB09jp+28mmR4YysB4bKzOhb+6VCiIQ=;
        b=kj4yENNxgqkDDb8mbTjhfVrggPdXTsCwMBolHA/XiYsYzgcGajO1p9nzp1dqRxRMzm
         hc7AxeKrIfwrr+iYnsSaKwYX6WSjMH++ASjE3Hk631JjJVtg+CPof7ReK0tjJpAIWNqH
         O3JYev9tXEDtPPM3PAgB13AQLLaB6XDnkfyuTTgQ3/oXh9XIKJRNBt383RaAstRKbAlW
         TUb+Z7grS/TxR0dD4Us4m3Uo9M6H6e6TLrnQ24eyAaOAmE4q1YzlvNq4VUfCVijoZrdZ
         IS+1CAuXJHAqPYL9yCwt9GeQrNyJMx0hRmjxdlnXgcIZR5Nym8mzmy7nRCiqogkIkfBN
         58wA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=C6RNKOXb;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.17.12])
        by gmr-mx.google.com with ESMTPS id s3si179675wri.1.2019.04.28.07.31.20
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 28 Apr 2019 07:31:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) client-ip=212.227.17.12;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.159] ([95.157.57.47]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MJkt6-1hJeuB2W2O-0019rZ; Sun, 28
 Apr 2019 16:31:19 +0200
Subject: Re: JAILHOUSE hangs with exception when trying to enable the root
 cell
To: =?UTF-8?Q?Hakk=c4=b1_Kurumahmut?= <hkurumahmut84@hotmail.com>,
 Jailhouse <jailhouse-dev@googlegroups.com>
References: <16e3b6ef-37e1-4734-aba4-247bcbbc18e0@googlegroups.com>
 <6526d7d9-09fb-c25e-0037-628998267794@siemens.com>
 <81bb9c90-1557-47ae-990d-b1bf417a58b9@googlegroups.com>
 <63f974a9-5944-4f1f-77a2-4bd7393ff8a6@siemens.com>
 <05d90171-db1f-4031-a7b2-48570eb37847@googlegroups.com>
 <fdfcd6e7-e2a5-4187-b079-ca643fb281a1@googlegroups.com>
 <32bc2861-e11e-4ab0-bdcf-063e2c05318d@googlegroups.com>
 <f704088f-99c1-4ec0-bd5e-90e15874cc7d@googlegroups.com>
 <3e5ad4e4-abac-03f5-5402-661e62a83944@siemens.com>
 <7f55a310-7bb7-4a3f-b111-0c2a24939b7c@googlegroups.com>
 <1f880925-0420-7c15-1aa4-07d001a6efce@siemens.com>
 <bcd32c87-28e7-4747-b3ab-ebaedf160309@googlegroups.com>
 <32d0b346-10e4-de18-1d24-95e4e4cff977@web.de>
 <9732f874-1271-4296-b2ef-ededba614a87@googlegroups.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <7deff203-cf29-6353-128a-8b40f8d42584@web.de>
Date: Sun, 28 Apr 2019 16:31:19 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <9732f874-1271-4296-b2ef-ededba614a87@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:/+TVKsTfA6okMOnMip0HHjwdhLdWoWGZ4hIKupUwcgnutPw108C
 Unzo6fU3MceWCTQ6HFD9g8UrDBjNaTWMccruO/HKCYGKX6r+r9rTQo1iVUvrtgz/TvM3xAn
 eacxhE6NnP5pNVi9iJeX+37MyxFsnOOopFo14aUlTzjiycBsSW8kyfY3XTM7EleHhfRVbFg
 VQQzraunUWxfZu7xyXBgw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:/ZvepKfS8xA=:jpC3+q3FxflXtIiExjgr1+
 xhRKyLA999VTkby5vwhsVBo0KSJPSopxbIHTJqKxMU65n4tfJ9RUlso7Q7+ykO+DnzqV8uWQP
 FZA6itcFbdgRdk1lv0PDGAcLMx6FNd2q74G3Oi6DGpqFgm16JlkQ+fS+5N70CdLfez3/IOOJ7
 4HHFVL0gCHIQ5Or5Mp2wKGWdMjQ+CadAGdaRyIrnZVMM7M2gl7uMh1Vq8hTfxYUxJc0ToLuut
 f4KMrNgPVEP6f0Zo1P5ML8JmYwAF0hoXFvzZVm6AKRV1vPBdcb6DfyoDtnugmoKgx2qCUefOH
 Ql5zipJ3PlHtyxB6hxDOQv+GntIVfv+A1y9ABJMBze8uNnDTDbRELpWuogS141Z4DZiRa4zPv
 A/mN7xdxTYAhck3crmxQT7KRZMdhoAXnlrScBToDCXt0wQaEH1XBp9J4d+S3EYJcf0bN0T2ms
 I7QwNfHHTZEsb3CBYE2cuvIe6rsJqnrtuGIpBfaTBTWbKk5rm7FgsV/DLwYMlQchgc7e4NmkW
 s/gXcXmvdZ/oWJJ0e75LlJZIUYEBidB0Pk8gyf9RLzh2KN+Kw3Nf+fiCr03aPjSrrdPzGE1ST
 rsYo7Eq3RzO3Id8HtHolZArrwpbIfV/bGgBc28xt9cQnp+ezEH6t4KRHGLgupzbNvzIEsJj0J
 nhYEsqN2Wfvshm2HoPTzVieY6nOzqxccdov6w10uTtG/0DscNt2wS493qM2szuAVCktURzIJG
 6bUObUoubABcqQpBh0KIRYQMFcoV+sdlG/XVYWaMcnROHkoWIlFmuPsM3RA5QcOsL2N8vrST9
 o5RdJ1a8F1rzGV0xWxGwL9bqZ0BENqXWs/mjvgQSNhF3ejNwKZHsCoI+STazZe8wUle6JT0UY
 OrcY0qpAPFB/Yre9F30byOWwbqEMvn91ye/ac26Fo0HItkUzPxKfVQLJkObSK0kuYCT4K815c
 mlR8DigDbNQ==
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=C6RNKOXb;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de
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

On 28.04.19 13:18, Hakk=C4=B1 Kurumahmut wrote:
> 28 Nisan 2019 Pazar 11:22:30 UTC+3 tarihinde Jan Kiszka wrote:
>
> Hi Jan,
>
>> I looked into that code again and noticed a long-pending bug here, and a=
lso in the MSI hand-over logic. The effect was that actually no event was g=
enerated at all when interrupt remapping (and x2APIC) was in use in the roo=
t cell. Your commenting out of the code above probably just made the loss o=
f the event (and, thus, the keystroke) less likely, but the proper fix is t=
o do the injection.
>>
>> There are a number of commits in the next branch now that should fix the=
 issue without the need for commenting out code. Please test.
>
>
> I test your last commit with 2 laptop at next branch. (commit d235bde2a47=
38b4cddb1df926a39b8a1e11c0acc)
>
> I was only changed all pio bitmap values to zero.
>
> On "HP EliteBook 8460p Notebook", works very well. ENTER keyboard strike =
was disappered. Root Cell CPUs were not crashed.
>
> On "HP EliteBook 8470p Notebook", ENTER key strike was disappeared too. B=
ut it is generating some crashes. I think they are not related your last pa=
tch.
>
> I have installed Fedora 29 Workstation with "4.18.16-300.fc29.x86_64" ker=
nel at "HP EliteBook 8470p Notebook"
>
>
> But I have received below exceptions. Do you have any advice?
>
> I have attached sysconfig.c, data collection archive, dmesg output and ls=
pci outputs for "HP EliteBook 8470p Notebook".
>
>
> Activating hypervisor
> VT-d fault event reported by IOMMU 1:
>   Source Identifier (bus:dev.func): 24:00.0
>   Fault Reason: 0x25 Fault Info: ee00000000000 Type 0

Does this one still appear, even if you enable the device only after jailho=
use
is running?

>
> FATAL: Invalid MMIO/RAM read, addr: 0x00000000b9c34010 size: 4

proc/iomem reports this as "reserved" but it is still used, likely for BIOS
topics. Expand the region at b9c7f000 to include RAM down to b88ff000 as we=
ll.

> RIP: 0xffffffffbc04eb25 RSP: 0xffffbb66c0e17ab0 FLAGS: 10046
> RAX: 0xffffbb66c0002000 RBX: 0xffff998a76d52000 RCX: 0x0000000000000001
> RDX: 0x0000000000000001 RSI: 0x0000000000000202 RDI: 0xffffbb66c0002010
> CS: 10 BASE: 0x0000000000000000 AR-BYTES: a09b EFER.LMA 1
> CR0: 0x0000000080050033 CR3: 0x00000001df20a004 CR4: 0x00000000001626f0
> EFER: 0x0000000000000d01
> Parking CPU 0 (Cell: "RootCell")
>
> FATAL: unsupported instruction (0xf3 0x00 0x00 0x00)
> FATAL: Invalid MMIO/RAM read, addr: 0x00000000b9c3f000 size: 0

The above will address this, too.

> RIP: 0xffffffffbc901226 RSP: 0xffffbb66c1d1fe08 FLAGS: 10286
> RAX: 0xffff998a47ac5800 RBX: 0x000000000000060d RCX: 0x000000000000060d
> RDX: 0x000000000000060d RSI: 0xffffbb66c0d11000 RDI: 0xffff998a47ac5800
> CS: 10 BASE: 0x0000000000000000 AR-BYTES: a09b EFER.LMA 1
> CR0: 0x0000000080050033 CR3: 0x0000000218966001 CR4: 0x00000000001626e0
> EFER: 0x0000000000000d01
> Parking CPU 2 (Cell: "RootCell")
>
>
> Thanks.
>
> HAKKI
>
>

Jan

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
For more options, visit https://groups.google.com/d/optout.
