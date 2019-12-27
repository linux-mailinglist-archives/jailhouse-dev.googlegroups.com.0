Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBB36LTDYAKGQETSHICSQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x539.google.com (mail-ed1-x539.google.com [IPv6:2a00:1450:4864:20::539])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B88112B5AC
	for <lists+jailhouse-dev@lfdr.de>; Fri, 27 Dec 2019 16:40:31 +0100 (CET)
Received: by mail-ed1-x539.google.com with SMTP id ck15sf17190473edb.6
        for <lists+jailhouse-dev@lfdr.de>; Fri, 27 Dec 2019 07:40:31 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1577461231; cv=pass;
        d=google.com; s=arc-20160816;
        b=scW0W94W5cAbQ+U2phhUey6AkI6XR86G5gTTSGwbNoHoPoo3R4+UggOEME6r37CVOd
         O/354ahnV5B462HTtLMYLqFwGR9XZF2qIoSl8eeSEePTaHy8P/P04klXySql54FMR3TV
         lhXdlCPZ7LeOmAS6OYvqUA7I6i8t2VMSYS9XhNAoDC4hBu9UfjA7R88O8I8Kgv0JrlM9
         JgAiOupUtgO55ZbSPCxRDi3HjfElrHNkp63KqiHlW6PGdViLUcTUXYoPcLVqpZBGTwur
         eAkyhYceDwYsAgQRWPzr5zQWjR0No/Pp8GAk828RHet12HNFeiCE59kCKPJ7FgvWrCy8
         HsHQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=rJLH6r1Yyw8VGFwHE7FfBvQ1UO9egTuJrVAwOAFUluw=;
        b=e8KdHwyBsRXkia84rucc/FniazPglxpS8+Iu3hO0hKIjvdwxcuPnuUIhewKyfdls6w
         q3G2Tq84ntCQSRTMF4BcpCsJdxWhJQvbCkvdc/zRbY6d86Rf/LJr6z6Php5aqgwjpCgn
         CB8MmRdVF3I3/+CjXFsimbySuR5LVXELTUihiVdB4sT1oAEbZLqoZI4PhzCDBQ2JYP0o
         Dqy3VCM+jHx5zpjgVr4AmbnpjqOPcfnf5pZnUrLlPSM9C8iJG0vSINGFrF3YMcmziBI/
         Gfoqmz1S1ZaLHxAbqC9RKxN+JMQ1RkivOTZm4bAdqQuh8T9Iq0EPUC5WsDzYt/MR6XUI
         4qCQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=o4QyP01H;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=rJLH6r1Yyw8VGFwHE7FfBvQ1UO9egTuJrVAwOAFUluw=;
        b=mCt0jkewIiwf5FiXknL+q38h9CGEgp//A4SVitiDYp5Eq8hITcuEVUijIgbsBaA8I/
         YIvJbKoFcElVGhT7oQQIu8805yVMQTbyuWB28aPKj2zJjeGEw+nT66CI+tKUcFuiefhr
         mqzEBqOIIytbrRX6uq0LyYodkY4D92sVaTx5KzjzFoFV/grbe/93KEgiMwRWYde7zvTo
         1j99MkuI2cD9mH4+8nEItE/K29zvPM8sKlFfgV1emdMys8DpM0f95iNnMsiAmc52RxHP
         Y0xuIEGmGSGqvQwDA4ZuRCQ03ZtjY177eZz81N8AWpJF57iCCI9QXQeVeAOchJ0b8dxx
         vkFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=rJLH6r1Yyw8VGFwHE7FfBvQ1UO9egTuJrVAwOAFUluw=;
        b=gaqAmOmCqqHHu3hlMPTKIMxdbRKT/UEgqC37BRcKjWcbGtWeTv9RAkV0JEqEdj8OmN
         PsGgJl5niT7gKR6vuJgRn91mqC2bH0tzQy3scFcTBhhlcqHW451CcWT1uHGDm0tH6Bw4
         WDLc5F+p8fN6mdWSmtfDi72QdnEawgGz/nW2R8uhu6SjRYpr5EuhBQfcj5xb5W8TzHdC
         +BL9el+BggbTqg/gxi/swYaZrS4JVusioyQZ/oc/jc4ZkMcby6ihPXqMc4RU2YR9sYv/
         ogXO48qTfB/S40kV5pop59sJtsC9c62reZSb36jx0z+J0DcsZb8DbVT6MfuZ/zJOeyT1
         4+cQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVkvCHjqwp9BRzl9aLhCQFPhOXtazGthjMSBKZyvPKVP4YfL+e3
	tSILA9XQ4pdOhn78YjlWLew=
X-Google-Smtp-Source: APXvYqya3lPwdfpdXaEd9r0mhLb96CKCPmTAYzmeAlCN2LwjYaLwEZb/RaAagIdVkqW+BWP2NNiJuA==
X-Received: by 2002:aa7:cf86:: with SMTP id z6mr55969398edx.85.1577461231164;
        Fri, 27 Dec 2019 07:40:31 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6402:1248:: with SMTP id l8ls8127603edw.16.gmail; Fri,
 27 Dec 2019 07:40:30 -0800 (PST)
X-Received: by 2002:a05:6402:2206:: with SMTP id cq6mr55575574edb.295.1577461230644;
        Fri, 27 Dec 2019 07:40:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1577461230; cv=none;
        d=google.com; s=arc-20160816;
        b=gq9pvNzMoWKjliBTShNnbemCth3I/T75d8XqBLrZz7rDjhxRpXQ13mGHVdeFXTz94X
         Tnyq4EajrGpPk82ydXez8MkFzW2mJ1Ktmw0hEdhNo//bmT8vWWO98MlJPgx8cwnf/cJv
         q/1TqdupLKs2DMzdugsz23yGKwIc1c3zMf8aq67Yap0+AntCaE5HnqgYEFtUOUD6Fem/
         /YiwaxXKaKYuvGggR9RgGM13Y8EIcYUWiz8ZptjeKsSdxxPEz52Cd4Hce6NkyQ5I/5Dl
         FKQUkSoIsLRNUTqdoevYODtXt7T7+uiOsvhGKTnWO+b8L//invFfLioOAoL69P7StlkU
         s+Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=F7OwekTENz5K0a8yj9DNJIy/c9DWwKnToEOhJUS8jww=;
        b=kfOp2vwNMf+S78Dm8GitGwpdVeBz61xaat4sFBcECvLjtiq4wa5qR85JPMTrirWZzX
         47a1FohA7X7ry16pUc7XqynotU8jgDihDRMAB6ceVwmLlcwhYMnmQBtClAtOQ12sL+jg
         eVAdJt78ixXKTl44Jm6RR4FTAVY0Nss4vc+6cYqiJ8A7wzZ51eAFsNYlA1H4bYfL/Wlo
         YtbnQHkbf5mvjwg0AfmI4QbMtRRcgFyq6/ZGx7f0NmS3mAUrhAkgcWgldGUOWGPGgj4r
         GzdQrtJuTiaOX1PQQ7RnnaiTOwM5nwRZorF8YP32gbf3b3qxwCPk5hgvAXoZcYr7IOgF
         sFqw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=o4QyP01H;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.17.11])
        by gmr-mx.google.com with ESMTPS id cc24si1207317edb.5.2019.12.27.07.40.30
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 27 Dec 2019 07:40:30 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) client-ip=212.227.17.11;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.2.196] ([84.61.93.39]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0LbJCQ-1jUcrP3wmw-00ktve; Fri, 27
 Dec 2019 16:40:30 +0100
Subject: Re: [PATCH v1] configs: amr64: k3-j721e-evm-linux: Fix GPIO failures
To: Nikhil Devshatwar <nikhil.nd@ti.com>, jailhouse-dev@googlegroups.com
Cc: lokeshvutla@ti.com
References: <20191224121333.10214-1-nikhil.nd@ti.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <04440629-5afc-68af-c6dd-2c27f5a55f35@web.de>
Date: Fri, 27 Dec 2019 16:40:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191224121333.10214-1-nikhil.nd@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Provags-ID: V03:K1:b+kYif2mhrZCP6w9kvrL4Mzj7UsBYL57H6v360I9awNFBg/zR1w
 CmQN9QqZcTcF9Fw/6yNKDWANNlHE9zGseG0aKcK5f5rLixGMu55tLYSSWDb2TwsgNuYwlW3
 +hpYq0PShLaoGm58aNthj7PCDZ6UK99NXclMY4vv/HHLla094nHMtW9AutkeaVAkJ9hISlq
 dQVvS/mIuECOiyllzFt7Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:HV3aJZnNa4E=:RbIeLZNnhs3B3SAVSfCAQo
 SSaoJROs3NikE7PCH59oC9OuCX9HO+ExYKAoxh3ADJGiNpTjsv/CFC6oNYys2zojJvlYEGk0W
 sO9RDn95zB99ACWbbKBE3sEGYSBJhZn2doY7Oglfudp89F0B7wPXpbZA5GzhVaf7MCmshYKLe
 0KLkVYcbjMa+fvN18Ir+XzeSBq2v+eZH1TLNrx2POgXxLQqvTwp5IaZ4DG53O5klGLNpO742G
 eLPLevRyNMnwJrQyLVe+aGuZzHi+0MEcL776yzyWfyDcMy4Rap1s1YvmXHqHHqJZDHCNDD0ZG
 mF77DH7JWVjflN2ztTb9dyMtovfEOrkEYkxSbLhcgcCQUi0hsbO3yJcPH4M/d/DB4nT843lm+
 /jEVGaCBSFM53YrhiFMJdr4yp7Q3gUqKWT5Toc3MrsE76ckTZaiBVl0p/cDOrjDznvKrd31en
 jpu9xrwdVwbfaseMPD/j9WNTJjP3ytmeab04g0QI/UDKBSTp3jSjmP+yfSfPhBCVzCppOC2N0
 SXJLLKt2HYNOmVuiraVNECeRQ+oHvSGRfYGCVKPPzqs70ZYmC31Pc5NwJmdu2iPTEF0+LDp2M
 OwOHIO+XKLjIgWonqEPA8UMUrHRbvcWY5H3XrkhON0WK2WTshWmSv15E2SlimF+DLbAIU6CpP
 nE0p7/zjG+LI09aoQR2evGiTxHuO2noIEHeyLPxk/taF+CEdNoEweQ4xTsgLlFEzSAKBaHKJM
 r20ZTUhiEDts4NQiowICIYt+7IHI6dYYOSu6ISZIHW0QwDB5eUN+5dYzgFyImnPsZpIPKxe20
 Sa7Z40mpFHa2QHlAoQ72NlmYfoL9178hI2+qSEpRxLjFMH3nzSL2I/pyERE3f+TzRgQEiQjws
 XZktjTSAkcRIwStYjwX2WHHz42hDqk9jypGysYJt/aekTXulge4BNdNeG+tzha1rr5kveJajo
 NT4EZNxQ5cwBqnw9MPKKqzjcPxJibCLIiWq4bE2vU4Gq2VfuxsKdcVjLXSlmaZjkNJUoYa5yU
 herEJL6m5pxYFasZgAp2H2N6KcCtiR3EHzrZcvZQacPlyWSIelmjELX3ZtRYiOM47gkorVMbR
 Zw7E5QNen5yUdxi0i0sz+7thjFZD+t8EU2PjMTd1ow79IQMQ8MBWQsfmHaU6IjQ0K1oOzTD0t
 ZYUFGI2oBFOQ/iQ30KKpKLXtR6Tx+FI78DboQm9Lu2Wv8YS06C90J7RoQDiCyU3GSQEkRLWNK
 8tdXVql/HHPKWD+hHdeZXcH0fRm0XhtQS7cSv0g2+k1N1QJXVfpzmAcBeEZQ=
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=o4QyP01H;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as
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

On 24.12.19 13:13, 'Nikhil Devshatwar' via Jailhouse wrote:
> For K3-J721e devices, gpio virtualization is achieved by
> replicating copies of GPIO controller.
>
> Each cell gets a dedicated GPIO controller. However, there is
> additional field in the pinctrl to select the GPIO group.
>
> Add the mem_regions for main_gpio2 and main_gpio3
> Program gpio_group in the pinctrl node for SW10 gpio_keys
>
> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> ---
>   configs/arm64/dts/inmate-k3-j721e-evm.dts |  3 ++-
>   configs/arm64/k3-j721e-evm-linux-demo.c   | 16 +++++++++++++++-
>   2 files changed, 17 insertions(+), 2 deletions(-)
>
> diff --git a/configs/arm64/dts/inmate-k3-j721e-evm.dts b/configs/arm64/dts/inmate-k3-j721e-evm.dts
> index 51470a57..7edecda1 100644
> --- a/configs/arm64/dts/inmate-k3-j721e-evm.dts
> +++ b/configs/arm64/dts/inmate-k3-j721e-evm.dts
> @@ -403,7 +403,8 @@
>   &main_pmx0 {
>   	sw10_button_pins_default: sw10_button_pins_default {
>   		pinctrl-single,pins = <
> -			J721E_IOPAD(0x0, PIN_INPUT, 7) /* (AC18) EXTINTn.GPIO0_0 */
> +			/* PADCONFIG[5:4] = GPIO group select = 1 */
> +			J721E_IOPAD(0x0, PIN_INPUT, 23) /* (AC18) EXTINTn.GPIO2_0 */
>   		>;
>   	};
>
> diff --git a/configs/arm64/k3-j721e-evm-linux-demo.c b/configs/arm64/k3-j721e-evm-linux-demo.c
> index 12351ab3..55938b85 100644
> --- a/configs/arm64/k3-j721e-evm-linux-demo.c
> +++ b/configs/arm64/k3-j721e-evm-linux-demo.c
> @@ -24,7 +24,7 @@
>   struct {
>   	struct jailhouse_cell_desc cell;
>   	__u64 cpus[1];
> -	struct jailhouse_memory mem_regions[20];
> +	struct jailhouse_memory mem_regions[22];
>   	struct jailhouse_irqchip irqchips[4];
>   	struct jailhouse_pci_device pci_devices[1];
>   } __attribute__((packed)) config = {
> @@ -89,6 +89,20 @@ struct {
>   			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>   				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
>   		},
> +		/* main_gpio2 */ {
> +			.phys_start = 0x00610000,
> +			.virt_start = 0x00610000,
> +			.size = 0x1000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* main_gpio3 */ {
> +			.phys_start = 0x00611000,
> +			.virt_start = 0x00611000,
> +			.size = 0x1000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
>   		/* main sproxy target_data host_id=A72_3 */ {
>   			.phys_start = 0x3240f000,
>   			.virt_start = 0x3240f000,
>

Thanks, applied to next.

Jan

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/04440629-5afc-68af-c6dd-2c27f5a55f35%40web.de.
