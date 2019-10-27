Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB75V2XWQKGQEGZIEFII@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x439.google.com (mail-wr1-x439.google.com [IPv6:2a00:1450:4864:20::439])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5D3E61B5
	for <lists+jailhouse-dev@lfdr.de>; Sun, 27 Oct 2019 09:53:19 +0100 (CET)
Received: by mail-wr1-x439.google.com with SMTP id 7sf4388418wrl.2
        for <lists+jailhouse-dev@lfdr.de>; Sun, 27 Oct 2019 01:53:19 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1572166399; cv=pass;
        d=google.com; s=arc-20160816;
        b=qmclmUAsLnE9bmWsvDkL1WvecY/3yakY/RZRjM6+s888B8i7qIRGnIIwZeVMO6cAY1
         WzO7f9yoR5cgW5TmGJRxNFoCE3QRSvzeOgwFbpePJEKugJ7YdBV0kiYJuzY6u3R2bs3Y
         sNs7F1UTa53jb3AuHFX5sLTHiam8U6n0PZbh7FQ9h91iHEN+BIf9qn4/Kc3xEJoJ5PDJ
         vClJheuP+bn6WBXdVVl2fcEphfnp35qDecxOJ7t5f5oBsO6jYsUPPKA+IgfVRfGUuSgm
         jZs2XQ6Tjo6ePHZstVOmSg/ubRvtXDuvKamEmJmn+BuMcn8nq6mYnFNwGtqrXdkid85V
         lx6g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=zJQfw7ISENqrDJliWjlwXn9//5lC923cIWvbw3mB+6E=;
        b=0U1oeKegJlvNnOoqzqWBrP/dLrh6LBN9y09ryXmZvaQskhgjOf9Hli1M3p6KTXY18E
         YJyuv5p4N5z/CIEYZKegEexDrYqlSFp/GO4w2Y3NaQEAXOnkk6sHpFnYGFecmfE1NQXU
         Ng2otBHlh79ZecVj/olKnOhQOHM6JnNyqr3hZz9k8jGR581TYIgDU9ZFMZpt2Q3X7EKc
         vTMiIHrEKooVeAKhwjOMqPS5CMylcHcxAd8uQhdg2ymPPso21HuVJg5oOGUv7z2kv0nr
         47bW6qeOAh1Z0lvwuiYrq0P1z/t5mdIS12TxKnVQX6EGSJHxaHPh/Xm00/FUqEQiGPoY
         Ll6w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=zJQfw7ISENqrDJliWjlwXn9//5lC923cIWvbw3mB+6E=;
        b=mJLvg5XJZVYTBpqPaq45CT7Da4qBx0mvPOUigJcgFlPmjXUIuDCWQ099kTbHylUTrG
         77gbJ7bVtYmQbSpbAViC7wG+RSy+HTad8y30onzTBEarB/3TR0rUki/XDaUOmPcAiClQ
         aqDyDQPaBgcvtsoThdHOhNO3dIXycLXD/jXIqpF52LHufKpNpKeOfApFUiL7sjzjXHZU
         OS60hiiBE4peb8wa/LFZJ1xvzpItPOk/zRH6jAb/tLmyvgZjKTUk4nRcpomaM4a47Xz1
         Sk69Zvt365C4Qb6mfjTQ2hghV+YdsJvUtO1N1rhN16RCWiedbAzM6GeV9aYd+K2i8vyQ
         HhRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=zJQfw7ISENqrDJliWjlwXn9//5lC923cIWvbw3mB+6E=;
        b=t0lgWxwRvFoaBV+CnNd47tPJ4vcKm8iP9q47sZEu1/EuwLbTqy61VLp7BnmChBpr5E
         5W75GkklKCpp3W+50wDxV5EF5xFjeQdSiP0lahScsudbA6RFd7MGutJemPLuxc0L2uxN
         l0M7D5qE1hh3ac3vdqZftMHP96oiVbe4tKYUoQjOG19MhN9nxxsBRL01HYsYBKlN4oOm
         wCD9u312ydXnqbJ/EFDKBT8NikGGm1SUSpLie6jVBOKVdDpSQVem3uExaHM3wCkAI/RB
         fCGKYH77ZfsnmVJ5a86buhDyyXKDtW/SD1PtrTE5YcZUaTyCq9xrTU2UkK8oLOmZBJe5
         Z7mg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAV0vL91JRxe/Tkf0ugtUyBk5GI6bjyZrV8t7e4lFMJU3ZVdTZx8
	S8vHfYfWCnXX/BVEAB1bktc=
X-Google-Smtp-Source: APXvYqyesEp27/5e5WcKRfrX4EEROu9SvqnYxCUc7RWczVNhCZGVAF10WrT0G15WAVst3DElWqAS+A==
X-Received: by 2002:a05:600c:2489:: with SMTP id 9mr6456935wms.62.1572166399522;
        Sun, 27 Oct 2019 01:53:19 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:66c6:: with SMTP id k6ls5863735wrw.1.gmail; Sun, 27 Oct
 2019 01:53:18 -0700 (PDT)
X-Received: by 2002:a05:6000:343:: with SMTP id e3mr10858578wre.20.1572166398842;
        Sun, 27 Oct 2019 01:53:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1572166398; cv=none;
        d=google.com; s=arc-20160816;
        b=ngcWi/44Vy55kIogL9RHKJ8goJ61SLUDTOdO+rdSNUowtyQ0sqlvQQT/XdMuFjOZ5B
         xQSIJk569zaWjiVljSUGOO/ozeauV50k4mD0rnWsNX64jHmh3d0kP6uhKnDJgauj6il/
         XxgRZ8AV/PvnELWSHFWGn2YiI4mBg7oK04rnzLc1z52YmSl3chUNHawbEjqnr0dff5S7
         v84+HKinIEpt8hyES6skEEuJZe5nWXOTuITlh9brTNCy1fpv59Ugaq3K/a/jD9UyA2UT
         CJPuc2v4vfR5fG4UsWCxw0X6czuzylLXNGDQrY6p3pUVCUpCNZeSf3JGrwuiw4+LBXdZ
         KWiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=mmxquWzaxLfKL7MJJg9lK+OZHqlTrY0NzIQnqpFSQYs=;
        b=khoRu42XxioNH/t26ZET/2O40GjfGPATsRFmwqist8FyTwzivNSxsXGJrtRPySHV5Y
         nCkDhMD4lzxCtKfhIA8Ec0uAv8yHq/znhCmtbNTWEoANQhTHajTvtQyjjT4p3YLoJFX9
         mpdcdDnN2BkCKiITkiXPdpBSjsmlEHQKjMRCCfB+zltZSQJ0GzEIpwRru1q/oOZl4nRt
         r27O8d+C+SNgkK9Q37M0mY1HMIa1299LZzXkeWWCdDVOHW79BDiWgbOGgQn5FYmuNT8T
         wMC+EEtgSDbuyFz0DM6AqtuHImU/N/izpT2Q+FQ6hdXd0Gafc8E3P2TDOwQSL13BWi2i
         PIaA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id y140si408516wmd.0.2019.10.27.01.53.18
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 27 Oct 2019 01:53:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id x9R8rIHK008091
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 27 Oct 2019 09:53:18 +0100
Received: from [139.22.33.136] ([139.22.33.136])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x9R8rHkR026150;
	Sun, 27 Oct 2019 09:53:17 +0100
Subject: Re: [PATCH 2/3] inmates: demos: add PL irq lattency measurement test
 for baremetal inmate
To: Alex Largacha <alexlargacha@gmail.com>, jailhouse-dev@googlegroups.com
References: <1571935318-25453-1-git-send-email-alexlargacha@gmail.com>
 <1571935318-25453-3-git-send-email-alexlargacha@gmail.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <053853b9-9e71-fad3-ef60-6152e43ece8a@siemens.com>
Date: Sun, 27 Oct 2019 09:53:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <1571935318-25453-3-git-send-email-alexlargacha@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

Could you explain <here> why we would like to have this test case,
compared to the gic-demo?

Jan

On 24.10.19 18:41, Alex Largacha wrote:
> Signed-off-by: Alex Largacha <alexlargacha@gmail.com>
> ---
>  inmates/demos/arm/pl-irq-demo.c | 170 ++++++++++++++++++++++++++++++++++++++++
>  inmates/demos/arm64/Makefile    |   3 +-
>  2 files changed, 172 insertions(+), 1 deletion(-)
>  create mode 100644 inmates/demos/arm/pl-irq-demo.c
> 
> diff --git a/inmates/demos/arm/pl-irq-demo.c b/inmates/demos/arm/pl-irq-demo.c
> new file mode 100644
> index 0000000..9f7c539
> --- /dev/null
> +++ b/inmates/demos/arm/pl-irq-demo.c
> @@ -0,0 +1,170 @@
> +/*
> + * Jailhouse, a Linux-based partitioning hypervisor
> + *
> + * Authors:
> + *  Alejandro Largacha <alexlargacha@gmail.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2.  See
> + * the COPYING file in the top-level directory.
> + */
> +
> +#include <inmate.h>
> +#include <gic.h>
> +
> +#define NSEC_PER_SEC 1000000000
> +
> +#define GPIO_IRQ_NUM 136
> +
> +#define PWM_TIMER_BASE_ADDRESS 0xA0004000
> +#define TIMER_0_CAPTURE_BASE_ADDRESS 0xA0002000
> +#define GPIO_STOP_TMR_BASE_ADDRESS 0xA0003000
> +#define GPIO_LEDS_BASE_ADDRESS 0xA0001000
> +#define GPIO_SWITCH_BASE_ADDRESS 0xA0000000
> +#define PL_DEVICES_BASE_ADDRESS GPIO_SWITCH_BASE_ADDRESS
> +#define PL_DEVICES_SIZE 0x5000
> +
> +/* AXI GPIO offsets */
> +#define GPIO_DATA (0x0 / 4)
> +#define GPIO_TRI (0x4 / 4)
> +#define GIER (0x11C / 4)
> +#define IP_IER (0x128 / 4)
> +#define IP_ISR (0x120 / 4)
> +
> +/* AXI GPIO offsets */
> +#define GBL_INTR (1 << 31)
> +
> +/* AXI Timer offsets */
> +#define XTC_TCSR0_OFFSET (0x0 / 4)
> +#define XTC_TLR0_OFFSET (0x4 / 4)
> +#define XTC_TCSR1_OFFSET (0x10 / 4)
> +#define XTC_TLR1_OFFSET (0x14 / 4)
> +
> +/* AXI Timer PWM */
> +#define CNT_PER_SECOND 100000000
> +#define NSEC_PER_CNT (NSEC_PER_SEC / CNT_PER_SECOND)
> +#define PWM_PERIOD (100E-3 * CNT_PER_SECOND)
> +#define PWM_DUTY (PWM_PERIOD / 2)
> +
> +/* AXI Timer registers bits */
> +#define MDT (1 << 0)
> +#define UDT (1 << 1)
> +#define GENT (1 << 2)
> +#define CAPT (1 << 3)
> +#define ARHT (1 << 4)
> +#define LOAD (1 << 5)
> +#define T0INT (1 << 8)
> +#define PWMA (1 << 9)
> +#define ENALL (1 << 10)
> +
> +unsigned int *p_capture_timer = (unsigned int *)TIMER_0_CAPTURE_BASE_ADDRESS;
> +unsigned int *p_gpio_capture = (unsigned int *)GPIO_STOP_TMR_BASE_ADDRESS;
> +unsigned int *p_gpio_irq = (unsigned int *)GPIO_SWITCH_BASE_ADDRESS;
> +
> +unsigned int t1;
> +unsigned int t2;
> +
> +static void pwm_timer_init(void) {
> +  unsigned int *p_pwm_timer = (unsigned int *)PWM_TIMER_BASE_ADDRESS;
> +
> +  mmio_write32((p_pwm_timer + XTC_TCSR0_OFFSET), ARHT | UDT);
> +  mmio_write32((p_pwm_timer + XTC_TCSR1_OFFSET), ARHT | UDT);
> +
> +  mmio_write32((p_pwm_timer + XTC_TLR0_OFFSET), PWM_PERIOD);
> +  mmio_write32((p_pwm_timer + XTC_TLR1_OFFSET), PWM_DUTY);
> +
> +  mmio_write32((p_pwm_timer + XTC_TCSR0_OFFSET), PWMA | ARHT | GENT | UDT);
> +  mmio_write32((p_pwm_timer + XTC_TCSR1_OFFSET), PWMA | ARHT | GENT | UDT);
> +}
> +static void pwm_timer_enable(void) {
> +  unsigned int reg = 0;
> +  unsigned int *p_pwm_timer = (unsigned int *)PWM_TIMER_BASE_ADDRESS;
> +
> +  reg = mmio_read32(p_pwm_timer);
> +
> +  reg |= ENALL;
> +  mmio_write32((p_pwm_timer + XTC_TCSR0_OFFSET), reg);
> +}
> +
> +static void capture_timer_init(void) {
> +  unsigned int reg = 0;
> +
> +  reg |= T0INT;
> +  mmio_write32((p_capture_timer + XTC_TCSR0_OFFSET), reg);
> +  mmio_write32((p_capture_timer + XTC_TCSR1_OFFSET), reg);
> +
> +  reg |= CAPT | MDT;
> +
> +  mmio_write32((p_capture_timer + XTC_TCSR0_OFFSET), reg);
> +  mmio_write32((p_capture_timer + XTC_TCSR1_OFFSET), reg);
> +
> +  reg |= ENALL;
> +  mmio_write32((p_capture_timer + XTC_TCSR1_OFFSET), reg);
> +}
> +
> +static void capture_timer_reload(void) {
> +
> +  unsigned int reg = 0;
> +
> +  mmio_write32((p_capture_timer + XTC_TCSR0_OFFSET), reg);
> +  mmio_write32((p_capture_timer + XTC_TCSR1_OFFSET), reg);
> +  mmio_write32((p_capture_timer + XTC_TLR0_OFFSET), 0);
> +  mmio_write32((p_capture_timer + XTC_TLR1_OFFSET), 0);
> +
> +  reg |= T0INT | LOAD;
> +  mmio_write32((p_capture_timer + XTC_TCSR0_OFFSET), reg);
> +  mmio_write32((p_capture_timer + XTC_TCSR1_OFFSET), reg);
> +
> +  reg = 0;
> +  reg |= CAPT | MDT;
> +
> +  mmio_write32((p_capture_timer + XTC_TCSR0_OFFSET), reg);
> +  mmio_write32((p_capture_timer + XTC_TCSR1_OFFSET), reg);
> +
> +  reg |= ENALL;
> +
> +  mmio_write32((p_capture_timer + XTC_TCSR1_OFFSET), reg);
> +}
> +static void gpio_init(void) {
> +  /* AXI GPIO IRQ config */
> +  /* All inputs */
> +  mmio_write32((p_gpio_irq + GPIO_TRI), 0xFF);
> +  /* Enable channel 1 interrupts */
> +  mmio_write32((p_gpio_irq + IP_IER), 0x1);
> +  /* Enable global interrupt */
> +  mmio_write32((p_gpio_irq + GIER), GBL_INTR);
> +}
> +
> +static void handle_IRQ(unsigned int irqn) {
> +  unsigned int taux = 0;
> +  /* gpio to 1  */
> +  mmio_write32((p_gpio_capture + GPIO_DATA), 0x1);
> +
> +  /* Clear channel 1 interrupts */
> +  mmio_write32((p_gpio_irq + IP_ISR), 0x1);
> +
> +  t1 = mmio_read32(p_capture_timer + XTC_TLR0_OFFSET);
> +  t2 = mmio_read32(p_capture_timer + XTC_TLR1_OFFSET);
> +  taux = t2 - t1;
> +
> +  /* gpio to 0  */
> +  mmio_write32((p_gpio_capture + GPIO_DATA), 0x0);
> +  printk("IRQ fired: lattency %u ns\n", taux * NSEC_PER_CNT);
> +  capture_timer_reload();
> +}
> +
> +void inmate_main(void) {
> +  printk("Jailhouse IRQ lattency test ...\n");
> +
> +  map_range((void *)PL_DEVICES_BASE_ADDRESS, PL_DEVICES_SIZE, MAP_UNCACHED);
> +
> +  capture_timer_init();
> +  gpio_init();
> +  pwm_timer_init();
> +
> +  gic_setup(handle_IRQ);
> +  gic_enable_irq(GPIO_IRQ_NUM);
> +
> +  pwm_timer_enable();
> +
> +  halt();
> +}
> diff --git a/inmates/demos/arm64/Makefile b/inmates/demos/arm64/Makefile
> index 49abe09..9378eb9 100644
> --- a/inmates/demos/arm64/Makefile
> +++ b/inmates/demos/arm64/Makefile
> @@ -12,9 +12,10 @@
>  
>  include $(INMATES_LIB)/Makefile.lib
>  
> -INMATES := gic-demo.bin uart-demo.bin
> +INMATES := gic-demo.bin uart-demo.bin pl-irq-demo.bin
>  
>  gic-demo-y	:= ../arm/gic-demo.o
>  uart-demo-y	:= ../arm/uart-demo.o
> +pl-irq-demo-y	:= ../arm/pl-irq-demo.o
>  
>  $(eval $(call DECLARE_TARGETS,$(INMATES)))
> 


-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/053853b9-9e71-fad3-ef60-6152e43ece8a%40siemens.com.
