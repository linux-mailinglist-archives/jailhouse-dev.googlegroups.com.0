Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBYHYZPYAKGQE2CQKBCI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43c.google.com (mail-wr1-x43c.google.com [IPv6:2a00:1450:4864:20::43c])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A8A6130F55
	for <lists+jailhouse-dev@lfdr.de>; Mon,  6 Jan 2020 10:22:41 +0100 (CET)
Received: by mail-wr1-x43c.google.com with SMTP id r2sf24656772wrp.7
        for <lists+jailhouse-dev@lfdr.de>; Mon, 06 Jan 2020 01:22:41 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578302560; cv=pass;
        d=google.com; s=arc-20160816;
        b=mj+h/3smNjJukqbNOXGTB3rdnVhbOqd8UFULeOhy03dgQaA0vA1qEZvRd3QWzAMFXc
         xZju1eM9mqok73d6ApWDY+6RBnk5MIYL0eaL4o8CMCHWD1hObq3b5IdQowfuSpNJc3Fw
         qLTrtWlzZ8FU0g4371+KXrrhOaCwlvOkIyvRhZhCZ4LnW8A7SxCvXA1NjUZzO6T0cylm
         DfK633eAkV4HGc7qo0xu06xJQ1pyOjprIceKRsBmBebhC0wxM9u5W1wsg8I63yW/zWwN
         u5Alh88KNK5O5/6QiKSYFLAfoAP2rLI3FL6mKj4Yl4gqFpghP/SQ1bWqEDSz+zqgQ4NE
         HIXA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=DBmK4jKI4S9SrtJa6Mhp9NXfRZqxQv9Eq+xzmUdZFcs=;
        b=moQWViYExNTpGn2AYHGTgaUcgJRmUTxwsLge8OV09SIDzrkLA1EoDIidEEeLHDcfHd
         ZnMM18ysPduekRRaoKuShD/UOkRmbqqrJ/sn27CyvrnWKH8qa5WPvlBzpMcVdBPsu9zK
         G1G1NId5bYJjbbL9asx7DfOteceScNbxth2NYV/k13cVbt5r2UCiESAr2cAC1ZcleTz0
         6KEopgFD6ieScZcw0cBdCzRZNnkiuZpyE4nBDCMyUuJ/c2ViFWORDnAT621OJ7Vohj0b
         xRam3Uz6XZc4L9jfCeXB2msg0eKK/UqJA4feUFLiENV6pQl4DhKyGjU0zGEVOitVz8V6
         sPmg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=VdWRBPag;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=DBmK4jKI4S9SrtJa6Mhp9NXfRZqxQv9Eq+xzmUdZFcs=;
        b=br+mozIlgLZaPSfQuphYESN6y/q9tgM7KhAaOKzoFHXXPJLZ/CEAo3rZxAP0XEQFhF
         6xO3YdsLOzHFaBW9gFthlfYixg+YEVnn0buvCuZlR4ocpdMEaoQBeyut7ojyU1NsWkht
         cjRWlnsH2f8XVe0y25SDswbD/Zgdo3qqZoHcir0pNrMJ+zk1qDby6BooZh7eu/PVx3uQ
         OxupavdwbKxj0S30Hcd3OpHqY5OhzMNUrSHYFtB2ReVM4ln/V4u2ukAxEhjn3yRHh3CW
         4P7OH50WZ9xzOqNThsHkLZ/WEPoVXXBqg+KfnRbvoofG8+HHl/Q/KFnUE6yceBfPYWab
         HHWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=DBmK4jKI4S9SrtJa6Mhp9NXfRZqxQv9Eq+xzmUdZFcs=;
        b=C422HZlGkOUEplAsbMeVgG7liBYkuQHdTQ/Mpb2mcgATifaL6xDN7cI7gS9gdCIvn8
         L+TQE9jfIyKQXIQoaaY8EMJxxQ7hcNSNpuFhTz14REr3zjvs3R9gcCTElnPyEQGTyzvp
         Wh25nYV5vLrOPN3gNTwEt5V9kRwZaDpowg5jK1hSAjpvjQ5Ym5W5YnQCP8rkZbbWcKge
         8Ep+tSON8ocCkbiYsYGn4po792iYm81BbInvU/5K+PBxcLsqbpP36YfJIHZuNcp0OTXq
         wAez6B7lKD0Uqnu4G02ClbRrKJItwYriN7LiTNdy9enHirw84SOb7671hNwzjWHTG3RA
         xptA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUyPo1nUTvQZDOtfA6y+LcXagzRtoVVMIvkIlZAKTabD1TD+4qn
	B0sVKeoQUEU+w8dpCWhOKbY=
X-Google-Smtp-Source: APXvYqzlapfF/NkZoM8lVFR6VLxzkVVouyNMEZG/Yx4HgRHw1WTRUd6Ohz7AdW081bx0hZt5Qaevuw==
X-Received: by 2002:a7b:c847:: with SMTP id c7mr33265107wml.3.1578302560696;
        Mon, 06 Jan 2020 01:22:40 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:4fc2:: with SMTP id h2ls12762031wrw.2.gmail; Mon, 06 Jan
 2020 01:22:40 -0800 (PST)
X-Received: by 2002:adf:d184:: with SMTP id v4mr102099417wrc.76.1578302560086;
        Mon, 06 Jan 2020 01:22:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578302560; cv=none;
        d=google.com; s=arc-20160816;
        b=TXDFEFyA6whwk3fxsPpNLadEAUhXy/FCNL2FsKnIDbq+/ufGLMaDbguVfIcRbbLwWQ
         LsY18O1GDER531BhvkwOfIie+wJ/j6PIn9E2HSrb8gG1z37f7KEih/4ztas43nS8j0n+
         IkspvNpaJzes42UbFphmGRS8ueRBoiPYJBtsIG4ixoFiFDiV45voamxIFOglDODvvOr9
         YHtZbSh4AnTPePAWsTJpTK3t5dD1/gTa9A8aPueRyihHkMtj3dp3HhTjJjpG+52uws2E
         wvTvp0tNUBJZ1b0CJ4ahOXj1coRDpiHtNb4TyLHcBaqCWVoFhgICxzq2nh2kJBSQrszf
         A+kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=FfWV8U70iiMgbYCXN8cG0BVXzd5FGWIf/eqvZBR6y00=;
        b=Z6PH7TOydUvvsmFqSHBhDNo6ll+p9nZUquJ5LHQxDBS8mudDz0MZZHpF7agsPJp5xg
         lo0JE3APiPMgEeywMS+orQu+CaGmJtGOiTrvb3vF4OQNBuPgB/jXmsutPvVWKCh2ITet
         qwWhN6b9LWyCUAMy5AawZf/OUzwk9HdN3I97NxIoX5HJItNj3UOfdiEW0hU9sa+hkTa1
         xMvyJRXGqvRPZBZY5Rmejagu6SX9QzdvVfcC3tmikSzNRQjrM0kv/XWASoepEmHrRod8
         VTWpICGENboCVoAs4ZS72dnxeouQjgoXJDkSzb07qzIzWTiprVpRD3cTFk5qJMvb9Xqi
         Rl/Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=VdWRBPag;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.17.12])
        by gmr-mx.google.com with ESMTPS id 80si730355wme.4.2020.01.06.01.22.40
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Jan 2020 01:22:40 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) client-ip=212.227.17.12;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.55.156]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MD8BU-1iw1y72JGW-00Gbml; Mon, 06
 Jan 2020 10:22:39 +0100
Subject: Re: [PATCH v1 1/4] arm64: ti-pvu: Add support for ti-pvu iommu unit
To: Nikhil Devshatwar <nikhil.nd@ti.com>, jailhouse-dev@googlegroups.com
Cc: lokeshvutla@ti.com
References: <20191230132406.19985-1-nikhil.nd@ti.com>
 <20191230132406.19985-2-nikhil.nd@ti.com>
 <ca2ab556-aa49-0525-29f1-67eff0d119a1@web.de>
 <22d04be0-c674-16a7-f36f-89f06419372c@ti.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <7cc22bb1-4b6e-3e5c-2ed8-0fb78dc31af3@web.de>
Date: Mon, 6 Jan 2020 10:22:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <22d04be0-c674-16a7-f36f-89f06419372c@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:rNbnGSzxxYxgAXXwrVCuau7V5ivmdGx4DiRKngsakHmo9c/9G6g
 IXy4Sy15w3pYI1TOdaVQtl93xxe6GMg89jDuKjLbUBjo1XCwbb1N7BrAo1KrR+9mLDKVbl4
 MJqbrYRW97GRTrmyXvRG3GZctr4mr/248WF2ivIzz67qLBoOr8V5WhC2RgZWBwHPTWeL2SE
 UkNeI4lyP4wh/IUqz+YdQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:LfTvDIuVC/Q=:ukdUOiI2cxN+8YD2h+qVDh
 51CV6j9IA5I8yjitTcfDN4nxweDqQI5pMgRgiwUDXW9AIsIRqReqdcuuXt1iikDqwJLPs5Pl2
 H6HFkIwtyzZ2HyEPxWraBZ2Q6tq7pwnxCO+J+NsRGu/1XWbdHnVEdwOLHkBj/OmHXWaQcvmU7
 HUicYuFt0i2n91VzcFFn9yELNL2an5Bofh5OpUHVMXfFz4uoGercZs8H6JSoSBD4nEufdWcMm
 qZWbI0Wi1R0MAQkNK8W/CqamFp971WgqjN8ZNGDUDmA3TnVfi60RuK2vu4xFAV8rb39n0gNPe
 aTmd1YEjrjLI99B1oiT2Nz/1iYr7xY9LUE1eCZoIKmE9rqf0gp5w+EfcOkjb9Pmn20UwrUof6
 cQSDL+8RSBb5x7d0YTY7nEL0LxgbbuZL2SVrH+bFiYWcMSFZ/e+OGde0KhfArV/HfZf01PSHy
 n/5lPetfyXRw4jisqN2gwx1PVl/MHLeTR35ZpX3M/30mp8rAbLDoaVkMFos/MCp8LohPvzYps
 Ez+wf59OYXUkWDyUeCxcWn/BuCKODhYgFWFf5qUK6uPpp/nOqE0xgC9NkhYray9MOF1qgZlyw
 WlpqSz/9+mFIlaU9Jz/onK16tkdXw28ckFIBGWzZ3AC3aWPzFJbdUmP7+roKYMi1VvvxAmp9D
 aKrVsUdrSzP+Dtjtmjqho6x3oL6ONVxJ+3EkmJ+D/LhPaXxSvi7fxlukTxiAfngWW/Uilp8uY
 +LNBe6aE/GBIeOvvZi3cRH43EQjZ/aPxDgVXbskSI+DS3UjTUhfZhEpyIQj1n4/HExYc7w09W
 nvQCp2aB+JVnAiHNWQsnDZOlIZmOddnrbevd7JgB6+26COReLLZ9eGPyquWLVgMm3zw896qil
 lspn4PhvNel4Z2vQ8GqmLeWvXbfdHwWDgHWyD+pFAyuhJa4e+Y8L0gYyG4rrrHFjkmfxzOAWi
 YUKgKLvE7uiHeuGHVywT/n/aI9uO3yUP9slI/bQABPrYi77hTa69/pe2LkZKYyK3fVPw+58Zs
 YEONQqfx272/XH2J/EpFjV6gwlRnADD+0w4pkhhB/Jv3Vsr/WDdmbrZkSwpmtA4UPUAvrqmxB
 ySn7cwYDDEnwIyp5GYVh6Ggh5z0qlIPlqEccLuiNVzKzSEAzhbDr5IQoJPEcU0i+cNLMnykfR
 ve5AC0JcNOSOGgtY9Z0Ko2S2vz2lUh6ozbP6PukGNWTQnLjDcEYdaAbX+jK9L9kFLS5/Vv+Zf
 adgFH7GmKkt5GnJaIHkNNZFyPFEkMSeybsHf+j7BJjfcRZjrqQYdbRFjcJfk=
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=VdWRBPag;       spf=pass
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

On 06.01.20 09:12, Nikhil Devshatwar wrote:
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 /*
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * dummy unmap for now
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * PVU does not support dynamic unmap
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * Works well for static partitioning
>>
>> Huh!? But this breaks cell create/destroy cycles, without any user
>> notice, no? And will root cell devices keep access to inmate memory that
>> is carved out during cell creation?
>>
>> Is that a hardware limitation?
>>
>> Looks like a blocker...
> Yes, this is a hardware limitation. I it designed for static partitioning=
.

IOW, we can also not change the configuration by destroying and
recreating non-root cells with different memory layouts?

> Although, I made sure to not break memory isolatio with the following
> workaround:
>
> When booting a root cell for Jailhouse, you would typically carveout
> memory for the
> inmate cell. I have defined the cell configs such that, in the root cell
> config, RAM region for inmate is
> NOT marked with MEM_DMA, this way it never gets mapped in PVU.
>
> When creating cell, root cell maps the inmate RAM loadable region, here
> that memory is not
> mapped in IO space.
> ---> Limitation of this is that you cannot DMA copy the images in the
> loadable sections,
>  =C2=A0=C2=A0 which we are not doing anyways
>
> When destroying the cell, Jailhouse should map the memory back to the
> root cell.
> Here, again, the inmate RAM region gets ignored in IO mapping because of
> lacking flag MEM_DMA
>
> cell_create=C2=A0 and cell_destroy work in regression, tested successfull=
y.
>

Please add at least a test to the unmap function that warns when a
config is violating the hardware constraints. It's still not clear to
me, though, how well that goes with changing inmate cell configs.

Jan

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/7cc22bb1-4b6e-3e5c-2ed8-0fb78dc31af3%40web.de.
