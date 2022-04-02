Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBB5ENUCJAMGQEZIBMEGA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x139.google.com (mail-lf1-x139.google.com [IPv6:2a00:1450:4864:20::139])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF724EFFA6
	for <lists+jailhouse-dev@lfdr.de>; Sat,  2 Apr 2022 10:19:01 +0200 (CEST)
Received: by mail-lf1-x139.google.com with SMTP id q19-20020ac24a73000000b0044a100bb508sf2148775lfp.14
        for <lists+jailhouse-dev@lfdr.de>; Sat, 02 Apr 2022 01:19:01 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1648887541; cv=pass;
        d=google.com; s=arc-20160816;
        b=ILubGFe3LhYxrxm6VKh66toMfx5bSUs0WYpwzh/b9Tt3029pmxtKPX7Ir7c9xg5nNT
         fe37SaFiFyFCMBZqB9YyhFW9ndU0Q31o+l0/j5Wv/0xYONC+oLGQIngrzcVu32gcHR0D
         MvIez6nYHJ3vZbPlxVT7ati4X9geOk26eSoTkp3ZPRgugAvkoTmDsl9W8V2ZqNTyVtq5
         htIk+hORoXeR5GbwN4eT5L1WMNZJR4/ds+wM/AhjFglrG645eeb2McxR7hcUAkf5irlm
         3rTZb1/dZ8ktkD0s/XntNLDa3DdBNis98hjtQrL9EDqiorefJgt1dU0K52ke8fWZt2qr
         x6UQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:dkim-signature;
        bh=pnx1AYD98X5SUZAclhQ2Lt/5Bviw9AbP8fMbMKukVeM=;
        b=r4bHr0+HRXld/yQ/IJnfxJLHWs/ZnO1m8TzcwO+oQmxsAobfc6/a5JDnnH7DGliGhT
         zOhnaFlgWuz1OJvaYsjGEBc+40xcxbYRtLgRT040yUZgUTZPWE9yM3bPNDuU3i+UUeMI
         +9t8E2cC9oVPsKVHA6ZTve0DCcqfdHg46IrUD2so/ohS/6FRM+11xs6rUhZyQkQz9miY
         NwPo9Y7c5PABw+XbS6sDLAo2O8TLbCoamlXi8vGP9fJRfUXK8CODxRz5L2gvLa+6003J
         1CKf3OyQMQGYWdZ7HwO+kqT2RtxjVvqzfPyi50MHQzoZNVkmGzk0gEDvc0apsvOU2qNa
         gNWA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b="p/qZxZju";
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=pnx1AYD98X5SUZAclhQ2Lt/5Bviw9AbP8fMbMKukVeM=;
        b=m91swmng9atJ09t91P7MmL+HG8r8gzZLV4tQAC3p6a7HiDx2DZn3OzNCTfH2AqYgk/
         CQSMhdx78qBc/GEzRAT4mCDlzN2vwwXGAgnRIx/hjNeD1ZDeBEhSgccCnNVq+ZEhG3eh
         aSyIXsZ4YBw12AHVOoYwl1fs7A57yVa1mEuXETbawZoiO+xME2hIfzY9XL2sCyz677YO
         y3qRvY+TiVIQzStoXUoumjntB47jNozM9ybAYJzVnt3Csbz8z/7KmATSLcUdEY7P4Fu9
         /nykHGczozKYJhK23KaosfDxTPbNEn4RTCDWwksVdFFw/th+uQfmR2UQgJC+XWvO+DNT
         vjNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:message-id:date:mime-version:user-agent
         :subject:content-language:to:references:from:in-reply-to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=pnx1AYD98X5SUZAclhQ2Lt/5Bviw9AbP8fMbMKukVeM=;
        b=5Py4/V6Paet3CZ0fNQMv7IJTua066F2/ui5kQpE7t9gBPa4E/KwrY+Mmf//NCX4ZE7
         IYGcX/WSjuqcq6TmU9qRfPT/KP2Uubxa+RP78/ZDlCxZGiAviUxqHJH0TFEJVMsq9RmA
         h5Z/zQrWmv/u0aWprRrHw+ziOSUZ8LW1cW/qPKxZdrHOn5ThK6sIgggRvRTNOdiQiEFW
         HFEg3T/o95qHpMd/G+Q/SVY8R4T3wEfJT+znpcuOFftCn/TKTyS+/YqY8mHeGq7tkwlN
         PpjIRNkNAnKJOsmcbH3HzcYOhOOKnW2jfMpHNXAFrblxD8rqQO/JitpyutL5y32UbiRn
         lHAQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530q8mVxBIncYvdsGqTgjiLTllORM0iRGbrdG7LpFIPMndV07bWN
	elDxrt9zPTHiISSZ+tuc5JY=
X-Google-Smtp-Source: ABdhPJx5Am0/+BFLIqYxW46vT0fojBvstiBfA9vqBtWeQ62yLq2vzE7uG9aJq31Ukebtoak58KrGGA==
X-Received: by 2002:a05:6512:3b97:b0:44a:9848:33f0 with SMTP id g23-20020a0565123b9700b0044a984833f0mr16381618lfv.637.1648887541206;
        Sat, 02 Apr 2022 01:19:01 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:5285:0:b0:44a:94d2:1d8f with SMTP id q5-20020ac25285000000b0044a94d21d8fls838678lfm.0.gmail;
 Sat, 02 Apr 2022 01:18:59 -0700 (PDT)
X-Received: by 2002:a05:6512:158e:b0:44a:12b5:7fea with SMTP id bp14-20020a056512158e00b0044a12b57feamr15996977lfb.411.1648887539867;
        Sat, 02 Apr 2022 01:18:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648887539; cv=none;
        d=google.com; s=arc-20160816;
        b=l1Pvx7LQEYCVq7bzAafLeiKkE34mGeMJwd7IoHSiQx2hjQqLLue/hCQbcIOo5Xjt1W
         2aQVu6YFcNSVrX3dXOz5H57vaxy3ObyqPHxquHBuhhPYiDL0GBnA7mARTBrnGI3Et1Tp
         z8ag9MVtOU5xGctf7LLm4hgNqTB8BSHHA8mpvsfKcKwju4FkX1FDk7sPnybL/OqcfZZ+
         BAac0cvnNLM49MdFqGzX6WRPLfAIaxFmFSp7BSdqBStZA+ljxaYhwf6XrbkZ4e7QXIux
         d9XQcLh4ysIK8McRCoAwu6j+AZAuwjHPjxpzJDKhF85TgzyGVEjVpFaeWKRaha+dtYj3
         BXbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=p8BH6uK+O7I09pCK1XLqbVHoNCYzVzUUCh3QJbkeXCM=;
        b=RoZmk6/Gv1MTaOvpcZF2L385edpIdeO6fZ+94n3qnpZQmXkQ9Z70QoZe86kOXUrLPO
         S5RuZKo4es5GtHMB7MRbRzIbLNru8jbCTssLGfepo90aJnzEL/Da+ud0GcX9UCKuPtQH
         q8Zi68sl13cIryYj5+fvu5xl9oULl54hDCOy/kmoOrujPYRvjib3dL7pPePCrqac4toJ
         BICBBFo+oBwv0BqCx6qJfQsRv7NFE6BQ1DwxbbAO1vWsyWUny6WUFBw8+lcVEDvDZEn8
         9RUC+biCCDds02fv0XMMASfVf3prd9SVfZyIp/FjyowZusigfuBLOLEch/nljrsn/Z/0
         80WA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b="p/qZxZju";
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
Received: from mout.web.de (mout.web.de. [212.227.15.4])
        by gmr-mx.google.com with ESMTPS id o3-20020a198c03000000b0044a4ca0a067si119977lfd.0.2022.04.02.01.18.59
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Apr 2022 01:18:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) client-ip=212.227.15.4;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.178.20] ([82.83.53.221]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Mav6t-1o8Wwj2Zrv-00cDwE; Sat, 02
 Apr 2022 10:18:59 +0200
Message-ID: <6f2a091c-4617-4ffc-86c4-0c9b121349be@web.de>
Date: Sat, 2 Apr 2022 10:18:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] configs: arm64: resolve overlapping memory regions in
 k3-am654-idk cell
Content-Language: en-US
To: Matt Ranostay <mranostay@ti.com>, jailhouse-dev@googlegroups.com
References: <20220324012326.3001-1-mranostay@ti.com>
From: Jan Kiszka <jan.kiszka@web.de>
In-Reply-To: <20220324012326.3001-1-mranostay@ti.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:6RRPpcJjC/7frcaT20bt9qZNO4m73GdTtYqzhruLQRZ3R8kkE5j
 j3FHGdiv9zkK/YfHfVbo3irkHWDggIp7cXXRwD43SPb4lpaXQYG4jtwhgnOGQc4bg8BFy90
 YKhUVg99/AbFStf6gcm7wwXT+80RppLbMVp6PvdakyaKq4VvRhitDdInOB85YlzHVy8NeCh
 fjWodDvGPawsXqDaEnhNA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:yRt0Ok0KdGw=:/Q+g0PDy7iAE2O2tJSfqaF
 TwvydRBxRXPeOQpAiqXCyhDHPeTZ6d2jDBZY/I6LgmrarLnmeSJ1rMw3xAaIQ7XYI7M04uI/5
 nrDto5FnuvvswFhyENAdAFQoPPTewU9swTpUpSRKq5c9M2C2///6bW3cJV+OmFLPKTO4aIqVv
 heYzc/NHLAhE19f+AFjSWYqXCw7XmAvJOJZvOXPAeVuM7PJusfTIBFfr+KhS1ONAbH3w5Fb1Q
 0WxAJZjD+VBoK5B9bMwWXaAjdSuUR0ONmbH3k1JFPMxkZmh+SsIwxlcTLlVqwTm51RI7Gizr1
 nSXv8bIN0BaQxtHLU1Zywvd0taNcfq6z9rZ6Ncs4o9l1mI24UC7qRlsrE5yK6kR5EqZvBrxtt
 GD1b0D+Y96lCUzhVoeZPgcd6BlzZOYldJ9Nq03IigDm9he3WuCiJz3XOMNviiscse9GAmv6Pu
 /LZ2bkeH04Eo2GGwO/A3LMj1MqxSUvjkwzMGn53sEm66mFV4BsGVMK0Wm4eOVXT6dQzbkKvvA
 /lPcNykiURCLI2rpLXKWlcpxbuZbnRdn1sh9uhUUg5NIMa7ZI7cIOWSCoNIjXOE0dhsqYu+jY
 XIF6hXqbJVLGEb45M4QaskBR/3f+PwzYlAvYeCuK8Wtu3ADzEchTSz1NIYsK0VbLC2JKCD4La
 wohulT6fwlnk4ubSMtynHvbQztmVg8Z+GTvhXWyXwRpTD0WqQrXpojkzsNY6tfm6AbD3+IWQV
 zhUs9ngKNyfrNcQ+urGybutUiV85JXisec6/jKymJ570/6zrClkbyBHwEosR6AnAEwS5Y5xBg
 4IG1V4EBYvO29mvd06sMqufShOhaWHqisGtR3GqCZ/CadHW5YVbFBSFK6uaECZFYJcQtvc+H8
 g+SgSTd71aXXSfVh44M0qVMlMaq9sxX0hxWuOZUuIH2I7Vdv8+bGskbnCaLTDW71MN1FJ1bXt
 pDBZ6QHoPceiTOjstBLkImO1mxyz9Z7h8VhejgMhOIAJph+TvIGpM4rnHidANI+DFVUe3Tgkt
 na7n52P3JEIfsP037S+ZhqQxvVljkE9wBKYI6mhgBqJdQXWwaETvWFke/4vwB10UWAYvrVKnK
 S9aYJYLhM4/ngU=
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b="p/qZxZju";       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted
 sender) smtp.mailfrom=jan.kiszka@web.de;       dmarc=pass (p=NONE
 sp=QUARANTINE dis=NONE) header.from=web.de
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

On 24.03.22 02:23, 'Matt Ranostay' via Jailhouse wrote:
> There were several memory regions overlapping in current k3-am654-idk
> configuration including GICD/GICR regions for the interrupt controller.
>
> These issues have been resolved by changing region sizes and adding
> addition regions to avoid conflicts.
>
> Signed-off-by: Matt Ranostay <mranostay@ti.com>
> ---
>  configs/arm64/k3-am654-idk.c | 20 +++++++++++++++++---
>  1 file changed, 17 insertions(+), 3 deletions(-)
>
> diff --git a/configs/arm64/k3-am654-idk.c b/configs/arm64/k3-am654-idk.c
> index ddd770fe..4e6857f8 100644
> --- a/configs/arm64/k3-am654-idk.c
> +++ b/configs/arm64/k3-am654-idk.c
> @@ -18,7 +18,7 @@
>  struct {
>  	struct jailhouse_system header;
>  	__u64 cpus[1];
> -	struct jailhouse_memory mem_regions[18];
> +	struct jailhouse_memory mem_regions[20];
>  	struct jailhouse_irqchip irqchips[5];
>  	struct jailhouse_pci_device pci_devices[1];
>  } __attribute__((packed)) config = {
> @@ -112,7 +112,21 @@ struct {
>  		/* Most MAIN domain peripherals */ {
>  			.phys_start = 0x01000000,
>  			.virt_start = 0x01000000,
> -			.size = 0x0af04000,
> +			.size = 0x00800000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		{
> +			.phys_start = 0x01810000,
> +			.virt_start = 0x01810000,
> +			.size = 0x00070000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		{
> +			.phys_start = 0x018a0000,
> +			.virt_start = 0x018a0000,
> +			.size = 0xa664000,
>  			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>  				JAILHOUSE_MEM_IO,
>  		},
> @@ -140,7 +154,7 @@ struct {
>  		/* MCUSS */ {
>  			.phys_start = 0x42040000,
>  			.virt_start = 0x42040000,
> -			.size = 0x03ac3000,
> +			.size = 0x030c0000,
>  			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>  				JAILHOUSE_MEM_IO,
>  		},

Thanks, rebased and applied over next.

Jan

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/6f2a091c-4617-4ffc-86c4-0c9b121349be%40web.de.
