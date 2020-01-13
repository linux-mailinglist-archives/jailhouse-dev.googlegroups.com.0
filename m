Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBGEO6DYAKGQE2LGYNVI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43c.google.com (mail-wr1-x43c.google.com [IPv6:2a00:1450:4864:20::43c])
	by mail.lfdr.de (Postfix) with ESMTPS id 980E0138B80
	for <lists+jailhouse-dev@lfdr.de>; Mon, 13 Jan 2020 06:58:48 +0100 (CET)
Received: by mail-wr1-x43c.google.com with SMTP id z10sf4487597wrt.21
        for <lists+jailhouse-dev@lfdr.de>; Sun, 12 Jan 2020 21:58:48 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578895128; cv=pass;
        d=google.com; s=arc-20160816;
        b=gf9RLu1pFkBpSBu9haPFPmlhexqxEP4sXgEATjKwnQVxB1QAYF5tFnu6n4nIA6yewX
         4RsyHOAlf12bCfldp8GO6aExwnN0LUK4pcIirSvqQmonYZzyBOzxVGmx7zjwLvfxBToB
         OLB62BGg/HXo+vOyuL4d8s4MZL51eO+m4v/8yARV7UL4NDLycICP8k3Kq4B3bmGQRQw9
         7aMIjyAr2n6mK3cnD+1aPBQWbm/T63y2IgkpGzTda8dEMKRCy+iwRIMMwa3O4sktC2rH
         XPFICZ2y1IyaaDriLblai6hqly7CUZABiIw8/AQHPtTEDB5wYvN1dNuJTNE1OQTn3BoA
         z5LA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=LUgv5htgSCzi2k2Cq7kQ+RXrMbTzlqn59wvEXnVEtIo=;
        b=GBg0GOWEaP45GNK4A/O1VGyu9VnSg3f/dXMYoFyFiPye4IUuG1thSnhz/fG/zmRTVl
         lXuwCECVodI1Fdf7XisltDykF67Ay30rpQjO+ELMw82WVr6zY1S8186Fu3H2q6yXvoAv
         /ne5GgaJEuyNgyr16fFSATBi5g97AeTFlj1Kn8p5GOSefr3g7Nd/VTZFfFaHylnkiufX
         cG79orfUbTNIh2tm3cWjYIzgAoUP0WPbrbJPSIVHJGlIGH1G1BCp76Tg2cXwQeWSfu3B
         zcV8BCwT7Y0W1fvB5Cbab7AwKqoxLdEZUdo3cXa9tH5Yc5fOYWtV1dtz0uatXIkmD3Ai
         Q4VQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=jNYL9Zor;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=LUgv5htgSCzi2k2Cq7kQ+RXrMbTzlqn59wvEXnVEtIo=;
        b=sAT/M9bj0YrkUhVjldu88u0KXl5e6ye1lnKpmOcCdk08+BmqFxuFt+BYLzDcDcMDFK
         dlkEQZ8MoCQ7FBrWWKhyWY8NMeldPWimmSMcpMzTf11pBIOHzM0Nlr325eZ9UZnvIZkA
         KemF7voKSxbufybentO5L7xNsL36xM9cOoCVs1X8HZHI4wjEDzLiDMlTHFFCUYa0ERQ9
         v0mM72Tbf0ARstzWaQLHu9D917nFsyEGtRjrrwtMtsgM4rxHCubi7b2yqprScwZLXDaE
         jCL4fYmAVDhp3/GLnCiQLxOizCTOBXkrAlrmXM6X0MzCUIV5SfxLAclD9/biwIWeORCL
         36wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=LUgv5htgSCzi2k2Cq7kQ+RXrMbTzlqn59wvEXnVEtIo=;
        b=laiNiIAxBJPjPO0eADCXE9yzdgiYbZKWLMs5Pk70BybM/gi7IaG+bxfuzQrgehDiqM
         rkGzp3LA8tlr9wqGlw/gTIcVVcUWjqRG3PhSSdxkO+8SACi+Mhg2vrFb2KcJmHCMKFMT
         e3Q0IAIMvTJSQdPv3vIwefzl9BW1YQs9J7YmgdM4zGNdn4Es7AY9aCtFcKj8FqC2yh61
         tmpUsXJnqtIkuZUfML3s7l2ENWD3ZdexOCZHIrF0eiPC9lAQ9gdNCIhecNDZ3hzZPf85
         1K0dNbMUymv0DOu8UaUnCKks2GPtjZPkgyj96yO5z5uAPABnlMihJFbI/vVJqhKCIyUx
         DXcQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVAHwk74zFSlk31kDwlzxn6JR+0Tum7CZd8DV2xoCD7Y3/9h/cV
	ydtsRmHtZreAU8EeRGjKHDk=
X-Google-Smtp-Source: APXvYqxbcE5NmwKXHzXWRXwFDFBxVRQ4U4kKq4ctrpl3GQ9xCmQQg0MlRxRdNNtbw3waFLy2U0/ncw==
X-Received: by 2002:adf:ca07:: with SMTP id o7mr16692827wrh.49.1578895128220;
        Sun, 12 Jan 2020 21:58:48 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:f403:: with SMTP id g3ls4162427wro.3.gmail; Sun, 12 Jan
 2020 21:58:47 -0800 (PST)
X-Received: by 2002:adf:ee82:: with SMTP id b2mr17091436wro.194.1578895127650;
        Sun, 12 Jan 2020 21:58:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578895127; cv=none;
        d=google.com; s=arc-20160816;
        b=jDR3VzchAIEnVN9I+sYnPuPH/1Rvcl412IXoEaBeYYYdR8YzhoTk5wQFyr7/a4BLsv
         zy66r23NFwZCkeaWX1+k5PC4qt44UzKMFBv9m/Tn/Xg1IRiUSBy+Bi4KQ4c46/cRYYUc
         IDrvQDpk71DFAsg0owiU5ZSX9q0e1f7pakqBJ/lQf9S+ZPvUnGirAW9PSAnIyKJjy8le
         B4o+lUIu6TyHrYwAD4iFmaKrk+C416lzmqOmb9/pwh2ws9bvMpujLtqmHHTw/xR5ssR5
         O+CAfk6DDRi5VOcots96OlNckyJG4dL/4EQgNDkhmqcEsdweqerBhgZoNK86U+1rtKIF
         kFsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=vsNguMqbG3uuAwqQgAXv6x3U3NRBMAui+ao+lQ2aGD4=;
        b=kpfmEI2d+hShDfoiHyu2qKIl/kR2IfrBRckpVb862HXq6+DlPF/sn/2AlouJNSWDes
         WMV/hI0P67SbXhYRo1aE7NqDAaktdUNMqp7fcK4YayfbYXptlv0J4GIFO252ENm8Dy4p
         4ABopL9nHgR7qJg9AIpL4oahluyIpz3ajOTA6kz51SGrt5tZ+s1HEFIRnQa/NlyTtTrO
         mbYkwWWV8rFhtJGLqi3ugwsiF+h0J+cp9ZBOp1HcC5GJbXa0jrF0b9aOhw6WKlOgz29M
         82YjsPmhid4StnaaoYfeu7y3HKib1JAXR7FkdyVP1+tTMR5MmYs7JUn3qTwiL+ImTdBH
         z7VQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=jNYL9Zor;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.14])
        by gmr-mx.google.com with ESMTPS id t131si463506wmb.1.2020.01.12.21.58.47
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 12 Jan 2020 21:58:47 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) client-ip=212.227.15.14;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.55.156]) by smtp.web.de (mrweb003
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MUWCB-1jICo80Vet-00RGQY; Mon, 13
 Jan 2020 06:58:47 +0100
Subject: Re: [PATCH] arm-common: gic-v3: ensure LR writes are visible
To: Chase Conklin <Chase.Conklin@arm.com>,
 "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
References: <20200109155423.125000-1-chase.conklin@arm.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <3efc9991-a9d0-9681-de34-cf40664d6971@web.de>
Date: Mon, 13 Jan 2020 06:58:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20200109155423.125000-1-chase.conklin@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:cScHwX704ahKLxVuhedePzvxOtc05uG8QwEdjDkNPiEi7ut6eGb
 SbX8dR2/NH0jjkwgxn4GiupAITxSipmnWlc9hn5WBttNqyunTcPF3VQAdd02LCK9YUKbc7t
 EA4M3VUECR4oualS8+SZk/6/UXKI6TIYK+aYnHoB8fxpmgUwJSMgmeCv8t5h3+yVcZrMBXe
 ChQt/2TtqDdPTu1rO3DLg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:X+5lXd8rsoQ=:UlW9906EqCrtQCJ9p/3FtS
 fyzvvlgiJWQtmHAhUm8r1yxQJAwaDLKc1GTNlw2o0vLrJkQjkNoGSksWq6VQz1C0rvGNu8vvK
 9P2myeMTcud6vInfS8MlazBhq9JfixuPOf73xLCODNMhsr2Yvad/T6cl1nIy6JVuUtrQeVdvw
 9JPdc0iPjfVkvouOB3qcc0K8rHI2Llcgh+JMeEL040k/FmV0wwCpWrOF/OsvU3TC3hHgWrpSW
 SRG1UfwFq9oVsEaGsx+ROTMHKwJNGwsNkrvGuFA4sKFuLMOJnEISpdzLJTTTjVZLBbZkRSytW
 XjOGhwKTvWg70BaC5VzM7PXrnEQe09oQbtG0zlVLJYCnCI89974kVS/DP4USkh5gNMP6GAGvp
 syfvX6X0atwGgFZg/jqn96zcQmhG5uDiKO3bzjSe8NX//WKYuJuF++lP5jgQrQzxCKvfpzHYt
 LrczmLl+eR8FTsBigcoR2oL7RT5R6/ShuHzbFdW02YkpOCp1pgmcxDnxzT/jsbF0KyIUg3DvZ
 FClxSOr6mhP/4dAaCDoKq9sOyr5fB9pkCWLvDBG+AbpVP31n922olVVemFilT0gFATMtTrVbJ
 NpD6IxCH+AhpV3vdtu8XFMnJvYflYvaVITlm7AL0VU5Ufpw4hoASAjRQYW8DNzDnlnn0xiT5F
 EYxQ/tD3HztX0A+e4l/RwGrLpns+9aXVUsxa51+9N48yuYBjd2SO0oFCletLBdSccVPH3j0Zl
 MyqM1qDcUaB7UrNjqAJKE/HIuZEMJPB4uNUmKusyvvcNy3hvXhpY0+sZzgXf1U8gJdA9pV5Gh
 WIUA8+uYGqHhwWvSXesCVTdUq+FvtPVPvmxQIxxYboSWLNZqblnDvarna0+hg2hV6C+IsbMMR
 jE+84BDGAqnaruHfDa9wDrQkMEIyjDqiGBxmqrnO+6t+o0QZ1UvCzhW1MOyIdGXo/9cTq3/M7
 7EA7kGFUPhu+BXRtalK90nTNNDw9F+kkUJgmAnx5PVTvK0xv3KgBY3a3yp9DRZ55QMpvShrG0
 yCRQ1GfIBbf+kT1EuBnaa84GkkLcKKMKmZkRRVm8c/qQMGHcULEfGMoPz51WqL68EcyUv1TfU
 UQkOSFJUz5awgu+/CBs9Wk7CbbbpXLVa4FX/FHNq6Jmcb9qGcrvpMUdJQmxcgwuYrZmdWHH73
 YpQnSd/KoOx+qVj2c3oS5Gk5tSZ3JEz7G8TJiKhknZxoj7jQ1PzidqfkPUypGjPyijNB/iy7s
 HZKrkVyOQNLUGsw7cPYQkI52edz7boCgdCqp3+HFRCCKOn5p/9nVn9Ietovc=
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=jNYL9Zor;       spf=pass
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

On 09.01.20 16:55, Chase Conklin wrote:
> The GICv3 architecture does not guarantee that writes to the list
> registers are self-synchronizing. As a result, it is possible for a
> valid interrupt to be written into a list register but have the empty
> list register status register report that list register as not holding
> a valid interrupt. Since the empty list register status registers are
> used to indicate which list registers can be used to inject an
> interrupt to a cell, it is possible for a valid list register entry to
> be overwritten, dropping the corresponding interrupt.
>
> Fixes: 2ce9d14ca4e2 ("arm: GICv3 initialisation")
> Signed-off-by: Chase Conklin <chase.conklin@arm.com>
> ---
>   hypervisor/arch/arm-common/gic-v3.c | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/hypervisor/arch/arm-common/gic-v3.c b/hypervisor/arch/arm-co=
mmon/gic-v3.c
> index 906d9a8d..6a1d90f8 100644
> --- a/hypervisor/arch/arm-common/gic-v3.c
> +++ b/hypervisor/arch/arm-common/gic-v3.c
> @@ -113,6 +113,12 @@ static void gicv3_write_lr(unsigned int reg, u64 val=
)
>   __WRITE_LR8_15(7)
>   #undef __WRITE_LR8_15
>   }
> +
> +/*
> + * Ensure the write to the LR is visible to the GIC (so that ICH_ELRSR
> + * is updated to indicate that the just-written LR is no longer empty)
> + */
> +isb();

Ah, good to know. May we have such issues elsewhere as well? GICv2 is
not affected because it uses MMIO accesses, right?

Unfortunately, both your patches got mangled by your mail client. Can
you resent, maybe directly via git send-email?

Thanks,
Jan

>   }
>
>   static int gicv3_init(void)
> --
> 2.22.0
>
> IMPORTANT NOTICE: The contents of this email and any attachments are conf=
idential and may also be privileged. If you are not the intended recipient,=
 please notify the sender immediately and do not disclose the contents to a=
ny other person, use it for any purpose, or store or copy the information i=
n any medium. Thank you.
> IMPORTANT NOTICE: The contents of this email and any attachments are conf=
idential and may also be privileged. If you are not the intended recipient,=
 please notify the sender immediately and do not disclose the contents to a=
ny other person, use it for any purpose, or store or copy the information i=
n any medium. Thank you.
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/3efc9991-a9d0-9681-de34-cf40664d6971%40web.de.
