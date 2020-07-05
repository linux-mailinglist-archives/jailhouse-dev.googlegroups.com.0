Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBWX6RD4AKGQEGZRMUBY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43d.google.com (mail-wr1-x43d.google.com [IPv6:2a00:1450:4864:20::43d])
	by mail.lfdr.de (Postfix) with ESMTPS id DED79214FAF
	for <lists+jailhouse-dev@lfdr.de>; Sun,  5 Jul 2020 23:00:10 +0200 (CEST)
Received: by mail-wr1-x43d.google.com with SMTP id i10sf39250424wrn.21
        for <lists+jailhouse-dev@lfdr.de>; Sun, 05 Jul 2020 14:00:10 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1593982810; cv=pass;
        d=google.com; s=arc-20160816;
        b=Pqq3hbdqZq/pm8DK/CnDuI38u5AEN9MbtmojSouKXVpy/GsigaynOrRbI9u3sQV488
         BYwx2RYj3/P6ih3R6vfmRTxD+e//OoUmutfwJwt5bmu7+25SGWqvKcWyllcvOdOJHK7y
         ewMMJjOU0wE6je4FMyFwy6mWRi/MBFzLJ5IRf5QU7CuS0YAtuy7L3QDPVZso4D4YSI8Z
         PtUJFXGC8hh98HSNwlG5VHdT2ZX14/4sMFKXTPeNIA3y+KDIIsoC/1kI8RqV2DtxMD0E
         qE/hD+p48adOJ5hU6VMpFdO6IpVkWn/WnEbkpBaYi+VMBA/WmLXRMZgwQLzydUAUdeWr
         1BiQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=ToL/uIXkdmXWqATSuFvR2Z/B/5U1QEExM4WJ5F6L/Vs=;
        b=Ch/sM9fDPEH3ziABuX493lRhKrj4gAz9Vkq9dLzcxDI8BOplGDHUF51cYSN7nwvdSB
         85ATzfWUDqMm3eTHrcFAYTWNRt+CE0K9Mo442JIjQty0tvFXGlcLPXU2xc01EwO2QR3k
         a87257rwKmzRkdJPNyQTRnIFTjJy11A4EXf4j2hJZpIeVVSVl9p4LmPveO3r+W8PmCuP
         Rm/iBL1uxANOeBsWdEImFfvZSYgaP+DhWEZPahYUmhaEdT58XejWFmEwiNmZpjddoDz9
         QigiLp4On5mVwBMdMKVYVN9O+9aMqObKdKPoDrwYGeJJpACeuuCfGLUhFqDVezXW3XGG
         bMcQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b="r/giTFIe";
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=ToL/uIXkdmXWqATSuFvR2Z/B/5U1QEExM4WJ5F6L/Vs=;
        b=HvqFJt9I2nTzBOEAqe9t8JgmC5lUzze/vXpuei7Hp6n6lBeC8Dgpb4AojZAwtgRzAd
         9xfbu7Q8s3J9Pj+KmhV53y9YZ7JC8NdVkqI6BpRKepDIGjjsjS2ZKyyOLd+EYqN39nut
         n/VIrQVMzKlLA07BddjowgHtcmT9JNPeiVOi+agJ7OwORdfTwmQzkwExkzjpLc5vln+n
         JM0gVzxdKMjHg1DW0lw5OCXQAEMTHSKgtZ/APWASzoxgAQ6RHV0CQooEo+t1poRC1De7
         f3Z7n1ivdeR2Z+KJ7yZ5zPnPsOEjdOtE4GE6442Rf3X1kpxS5Us4BMohrXVVfN3NjUl+
         SlSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=ToL/uIXkdmXWqATSuFvR2Z/B/5U1QEExM4WJ5F6L/Vs=;
        b=gqQb/12O0qQa/2cPLHlj004dH7p/CwH9W/xMe+5ijfpgNQRFH/t85Jz+FaD1EDKlmM
         aG3cJrbk4L9bShNNWMlUCNTxgLK94DFRTjjVm7UxamqnMcfn13kyCoMCDjXYE4Awgj0b
         ksu8e5QH+W25wRm/29F+aKixC7fk9XF6/LbbNcmmsIVsSO8kIG8Wyzgn9mmGPSq5NIPj
         Opn54GZikBm/EUILqDVwQFJM23QeooPtfhd7ukJs+Y+76BWCUSR5fF5Nr3juZcknGRR3
         pJGFrDViuFjvT5P6q7rEgVWmHjfUsKNyZAmAZmMLm9/Os8EHhRTQWqy3x7mI2EdZqb5K
         FLGw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530u3eM+i1WulT1QZuqYJvtOGB7mo3ig3rG+nQDcygBevoLUUU2D
	VXKc730nT8gWp+sqB4SiNXY=
X-Google-Smtp-Source: ABdhPJwwPPraye4popzbDnoIEMWmevoG4npCU5d1bf7P+cIsTdcMYLU3ClrOdzUNvAlSmnD3q7TYTA==
X-Received: by 2002:adf:f2c5:: with SMTP id d5mr46733126wrp.96.1593982810625;
        Sun, 05 Jul 2020 14:00:10 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:b1cf:: with SMTP id r15ls6761363wra.3.gmail; Sun, 05 Jul
 2020 14:00:10 -0700 (PDT)
X-Received: by 2002:a5d:65cd:: with SMTP id e13mr49972541wrw.213.1593982810020;
        Sun, 05 Jul 2020 14:00:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593982810; cv=none;
        d=google.com; s=arc-20160816;
        b=fNL5WYTxNVLT0TXaxXXN6s+8eHxzTm402xaRSbOLgtYhdTnSQswDhnC1fIG1XPO+Ct
         StGerTPiwhOS2xNS7nyXfse2M/K2x7O0xtTGA0ipdshZPvMcVY2wTCAybBe849tWrY2r
         Z8gB3bomropzT/fjV86A1l3QhazdPYHTUsE1NCYeVlZob3xyUZmRuB+kIKECdvSG/JCT
         Z4kRCcye1kxLKLbEIjhXw/N7WfvAYnVSVkbu8BuDsvk2pfbEHj9iVU1jTOv0oy45vtQR
         fAs1JvMDQ4LCKGUszWIy99p+cTza9yoa+Bop3mSod8ZQJFUqG3ndNH9bTL3o/G0VCdT6
         k43Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=XX/I+jZp4iIneg5hJFlX630dOKtYd9mJAdetG4QFHJI=;
        b=tQ0Ay1JOvNH9JtCXmP1WGoxGBLoNftv9YBRUpBi0EaHIy40lVWsYPM3dK408eByUTB
         YVndoNGU5b8aXiFOjIWj7V5cqJnnDhV6LYnOav9Vuax+ek/+d0aiVxeHErz0T1TFiT1P
         18kkw0UJHFvMf7wd+tmOuZ8/FUpN2rYT5yPhkK9heTmuz8j6Xj+cUBm4vX9D7VsSvthX
         16T2HOE8yx9RTTHfgOVnZvqoeucI6XaENzfmIzNtDIhMk2//O+0pqUe/gunq4aaHfU9p
         cLs5exgGNQD7zNv8FnwNFFEePu1dYBwYdJURKfIWGlF18F2tOJCOluZ01SfH+9L2/Hxq
         XFfg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b="r/giTFIe";
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.14])
        by gmr-mx.google.com with ESMTPS id h21si886571wmb.0.2020.07.05.14.00.09
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2020 14:00:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) client-ip=212.227.15.14;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.11.10] ([95.157.53.180]) by smtp.web.de (mrweb001
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0Lym5H-1kx9m22Ev1-016AJG; Sun, 05
 Jul 2020 23:00:09 +0200
Subject: Re: [PATCH 06/11] pyjailhouse: config_parser: strip tailing
 null-terminator from cell name
To: Andrej Utz <andrej.utz@st.oth-regensburg.de>,
 jailhouse-dev@googlegroups.com
References: <20200630064228.4742-1-andrej.utz@st.oth-regensburg.de>
 <20200630064228.4742-6-andrej.utz@st.oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <871f2a52-37d1-a7dc-c0e0-0a4eb899a776@web.de>
Date: Sun, 5 Jul 2020 23:00:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200630064228.4742-6-andrej.utz@st.oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Provags-ID: V03:K1:2WGOlkhHXttsLwFoWxpY36nO+kbTHiEr3NDaquoJU4Phr01LHqf
 suJ7Lox5lGumPesE2v21mT6WtbscKjDGnc5NPV6OhtjZ4VGJPBxtVm80AXTxWc+PVC19aFj
 qyA7Mmg11+7fLJDvgaHR1suVjpXQbSDH/0fLcOi4xDjV4efOtKioO8HbINoyA1zTUeRh7GU
 fEno7czekK6XWeuOjsDCg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Krl9WENr0o4=:nrRJ8l0D4fFOxhZLy+yMTa
 zKEmKic5XDEvnzIQ2OWzm6WCsPZMu469HiHGxBU3+/Xi99Nm/F7Q/43MIe4dHsmy9GCeMWrSA
 RUHBeSRYNQOKpdJ/49sSkNCQcA3IVU3LQzrnkda1Q0qbfdxeVB4S4XioZQeXjiT8632ryO7ED
 +XY7xBDscL5SeGRN8ibBJr+13vt8cSW4WPJ9bpGyUsIvHk+4RCRf/kvLkMPd/CJCKI96okTuQ
 3a5eLlgFaZaqHys4ONJZ5WkCXRnK1VIh2H9zr3TQediF7zMnm/BO3xfIap81CZKzzPe11xZ4a
 mn7crxNkRTe8+bi/2hkM3f7fYP7KIufpWdi3R6m45C35wq1zRBuZcEyZc+PSzPD/nhp7evSe2
 i79ppZx8Ua8OhcVgkdXDYfvQacJiS7UQ3iJEgChywIXPJZk2lhUqlyMJPn+0WeDuzuoECO0IM
 B3dtNeEenqoNWmmUC5NroSglrONvoPhtUyhRiJpkkFcG99ihCFdM7/KMHyMM/U3lyrg4wrPox
 e1VGe8NqupfKafJjncOH02jkR69a6HogC967qlSBp1hOOfIshIYmPpQrTDSBh9TWrOOQ0cabc
 1dshqoofUmnOpa0r0+MXLJhF6lQfLk0JVfJr1aNEPPEAdXtzG6LssQ2HNg4LtyTxxA/KM77wz
 m6v8DIXb+xUqKDeB/YCTNhHKEc3rRr4kTjZk/aqF68XhmWp/M5AfJb0Gpdw4Hde7hWFDmA6Wk
 R7Gevu5lJ93Mw/GC8Mf5BMawvGfBocYEV+a+zF9LMz598RwM9k7D2fgnXLLRahC55fbWY4zyG
 9bjUU40EHKIpeWpTSU3ZKV+HzE6jK5K1wOn31OYE1gjT2IIzg7fw0yHS9Su90S+duGiVRvi5v
 Sm1T0f/yKXRzQ4e8TVl07MFf2d+Wt2jdiBACOWk6qkrDpqRQqjijN3gjHfELDIPSN4axnUxQ6
 4ci+3WaETQcdqPzl1FWNaNeoAYy59y4q2u13jKQgN+1L63XgsDKgGb93/GdzieNP4m6bqoBFn
 EoHmGco5bV+8qOpLeN7ebo+g8ZPNlpsaRMIsVD5dvU1NWY5dgQtkNc+N7MM9aYfwnZEauN1qi
 01sJO1r177teMSptUuCaJnVOA94mTpTZlzyN37MJwaVsO+mgsLDzLn8koyRtg56DgUeWKvvHg
 DbDIRdSjpKf2iPuq5dtFM07OL8vz6qIzh5iQHwPcuilevDFtQ5w+77WyEwR0xI0+G6Y5ydYFs
 bpXGFiJo+oNmCybFq
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b="r/giTFIe";       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as
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

On 30.06.20 08:42, Andrej Utz wrote:
> Signed-off-by: Andrej Utz <andrej.utz@st.oth-regensburg.de>
> ---
>   pyjailhouse/config_parser.py | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/pyjailhouse/config_parser.py b/pyjailhouse/config_parser.py
> index 7b4872e0..a45aa7d7 100644
> --- a/pyjailhouse/config_parser.py
> +++ b/pyjailhouse/config_parser.py
> @@ -220,7 +220,7 @@ class CellConfig(CStruct):
>                       raise RuntimeError('Configuration file revision mismatch')
>
>               self = cls.parse_class(cls, stream)
> -            self.name = self.name.decode()
> +            self.name = self.name.decode().strip('\0')
>               stream.seek(self._cpu_sets, io.SEEK_CUR) # skip CPU set
>
>               self.memory_regions = \
>

Sorry, missed that this was part of your series as well.

Jan

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/871f2a52-37d1-a7dc-c0e0-0a4eb899a776%40web.de.
