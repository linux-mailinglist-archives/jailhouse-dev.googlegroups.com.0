Return-Path: <jailhouse-dev+bncBAABBQMWX3ZAKGQEWGUITZY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x237.google.com (mail-lj1-x237.google.com [IPv6:2a00:1450:4864:20::237])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A40A1670C1
	for <lists+jailhouse-dev@lfdr.de>; Fri, 21 Feb 2020 08:48:18 +0100 (CET)
Received: by mail-lj1-x237.google.com with SMTP id t6sf119430ljh.11
        for <lists+jailhouse-dev@lfdr.de>; Thu, 20 Feb 2020 23:48:18 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1582271298; cv=pass;
        d=google.com; s=arc-20160816;
        b=tX392WdnLhP7oP/4LOAKzLbSyd5EBP0iOJKTtJDBauwGx6JcxjnV1HPSh+WJ8ApYTE
         pXxDTwDX4HZavRuDFWvHJoLMdfZYEJbsX/kqQFktiDER1aMz74YUwF3H1gPiyeejW3Hg
         aJl6dgEZZ2SVBVF6Pvlm6tW7pZm/E231G4DRhH7Xh9GzWWOoOScXweV7DJkKdNF59ySi
         iZhwlfW/yobmIXm6kEMFtvhhenmg3qfJF5JfR9zUjhplEPvT2AMhcZT+sGN5nSs2aUEl
         3wkmYuHTtUtF8QhnkXcTgn+hVEIrYM469D7a9l5+BTNvUfqtOZSEVt94YSynHV2jAEIx
         0zNw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:mime-version
         :user-agent:date:message-id:organization:autocrypt:subject:from:to
         :sender:dkim-signature;
        bh=dBJM94Hkbo41PpI7jVL6oEWFRT0/hlP2knpcWtLNJfI=;
        b=eswHAbi6jT3hIlGSBjFqmjCoaMh6P7jEpigh6WGvYAk0urr7iJ8PP2TboUXFt0uBl4
         x6x9KK4HgcoVsIFetRk0z14B5pgRieojg8ps27eqWsx8BbVOesF7gUhRAse/rlLhF08I
         Y0IM8400uOvArrUyvRtE0RxnFYknY7v9yYaoZUrY87nUFWqqYpg91Ryn71FQiZa/AYt7
         ocB9lU0NxvMxN7MslCp01oGjOAliWM2kTDwZucOYlOxmcqlB5cR1V/l+jePqdDxUlQnh
         97brxAYp67jJGYpQmKnw5bJXGjoDAQB0qxLRKZgsUX3wzU5z0OX17JmLpPjv/MA0mbzG
         JrKw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: best guess record for domain of p.rosenberger@linutronix.de designates 2a0a:51c0:0:12e:550::1 as permitted sender) smtp.mailfrom=p.rosenberger@linutronix.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:to:from:subject:autocrypt:organization:message-id:date
         :user-agent:mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=dBJM94Hkbo41PpI7jVL6oEWFRT0/hlP2knpcWtLNJfI=;
        b=kXSkDTUFFy/fTnM1IDqpJfkPpOXzyWcD2fF1yQFVrlKTO2Ee4bXcX28K/TGZV+e558
         /3SSE6CqPov4BRTzJ2hn9M/wSDfzF4if0g5kGogRg3Otv4qMI4QbpLe7p16QakUAE9+s
         omsvoTzUGQVtoGIA9znPKbqFKgG+c8JAT0e6j2NXtYoF/Ypl/WPNee4FXUbsgGBx+9Lw
         uQpB8FCOPZlAymNkQxKR9XF9iWwz7I2lISUCaDvzTjlvr2CgWf617UtBqUq0SLrOPmKY
         W6S8/FN9CC3yhmMZUKex9oDz1a+AHQyZbIqghg2rTONRA1LokjMOM/D5/DN0TrygDsqv
         1F4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:to:from:subject:autocrypt:organization
         :message-id:date:user-agent:mime-version:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=dBJM94Hkbo41PpI7jVL6oEWFRT0/hlP2knpcWtLNJfI=;
        b=e9xEMP5SFL2A6c0/S3WlHNWFDDr+wXe2Zk55k+CiIofHuH+Zk/3wUkAMQTasr8curG
         /Qc2XH5KuWIgI8DvRIF5pdedSSLqDcXojH9u9XX0rRmWLrdcohaePaOq0dsxmlB1k/W6
         KrgVOKwHWRJ9VucRH4uELRNF0ZPCwJAxGB0S6fCOO4KfilKj0edQfKinXr7Ix9J76MTF
         uOA/iRu1NAAjLh+8YyobmT7D6UqIMDr2vrvPIpgjIlPW/wc2nM7d8QnS1kwquLVuCuZU
         vg/XO8cVcDWbSwAlMwctVWCYhO4k1I9ARjIQmBwcX5l7zO6e0DprV1wuMnAu9pAYd5Kn
         /ceA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAW/tBvgmw2V8OcyiGEItXSt/sgNUOCH3YRpzzqmGTH3GnmCVBq7
	OTrP0s12oknenA3BTWUDzok=
X-Google-Smtp-Source: APXvYqzL4ASJCubBYRYqCiGflFkVgAMocAENwmQEMx6CweOfeH4KHVK9ShRHdxSQXsnBf5bfOq/rQg==
X-Received: by 2002:ac2:4573:: with SMTP id k19mr567470lfm.66.1582271297882;
        Thu, 20 Feb 2020 23:48:17 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9786:: with SMTP id y6ls176988lji.4.gmail; Thu, 20 Feb
 2020 23:48:17 -0800 (PST)
X-Received: by 2002:a2e:98a:: with SMTP id 132mr21505094ljj.170.1582271297112;
        Thu, 20 Feb 2020 23:48:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582271297; cv=none;
        d=google.com; s=arc-20160816;
        b=HoGjeR3P/vey7rHTaiapBXs3ALmFFqczhwg9IakAwx90dvbfCzJZyUwQkqQgkrPeAA
         u3xXgDzPptf4FeLQm/YAEObMYwghMyQUjjCM6BLF1fd+UHW3JcmozT2yF5J2igG3KqKV
         wwLqO8A9yRpaE8ocRly4DdWqD4EBbE6GL6C3eKOaL1wFIkf/gCxXrEh+8jP1/d1bv57i
         tNCRVqV1iPmONuXh0sbpR5XvBZ59GPRJ39XCcZCAV3umpFsXRbE9MRwZlq9Vv8a9dUZI
         x5MVnNAtYmp0taGHXCaYgsKXzk1tXSNY3j5HFjCbA28giRZuHiRTW89Y/A+DZprIkUKR
         jBRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:organization:autocrypt:subject:from:to;
        bh=FZYQFnAgPtn3oW4WdaEGjZVCX6VSJ/HqtijVDCFObH4=;
        b=RjLe+XVwMHxb+Sm0G+E5KW5w4aNI7r7nV7crHqMdRV8BpiPDJjz/iYfSfstkE03wS8
         /83Im18oqNhqpSD9PPiRPehryetUPMdoD4X6YzJVDEZ07WvffL6uPaP/ylaMSamM/uc7
         O3vjEd7ikOoxsrFRJzD3EU33+tHzp22t2ybsPxKruAwnMz68I9GD/zrBGZYfYhDDWPSE
         nADtxp3QAW/nykAuDbUGn8jCV4Iwzy+vUApY2YPajdx4Y0ECNL3YFRdg5vecgY0HPTTg
         7pqZvfe26Gh0LGAnBDAuscyoRCTDwVqq3OvUU+oYR+sW8Ml2BMQ/NNEZVer4QUkg7V/S
         qfnw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: best guess record for domain of p.rosenberger@linutronix.de designates 2a0a:51c0:0:12e:550::1 as permitted sender) smtp.mailfrom=p.rosenberger@linutronix.de
Received: from Galois.linutronix.de (Galois.linutronix.de. [2a0a:51c0:0:12e:550::1])
        by gmr-mx.google.com with ESMTPS id d8si118266lji.0.2020.02.20.23.48.16
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 20 Feb 2020 23:48:17 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of p.rosenberger@linutronix.de designates 2a0a:51c0:0:12e:550::1 as permitted sender) client-ip=2a0a:51c0:0:12e:550::1;
Received: from b2b-130-180-90-162.unitymedia.biz ([130.180.90.162] helo=[10.23.2.107])
	by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80)
	(envelope-from <p.rosenberger@linutronix.de>)
	id 1j532l-0000d1-Th
	for jailhouse-dev@googlegroups.com; Fri, 21 Feb 2020 08:48:16 +0100
To: jailhouse-dev <jailhouse-dev@googlegroups.com>
From: Philipp Rosenberger <p.rosenberger@linutronix.de>
Subject: Linux non-rootcell with IVSHMEM
Autocrypt: addr=p.rosenberger@linutronix.de; prefer-encrypt=mutual; keydata=
 mQINBFZPLjUBEADc2KKhjl1qTC2RR9Zhsq3TuBB834Ovh2Tj0Kz2sTxS/LVZsdBFkqVEDTfE
 JAurOoZn7dGZWEljyM1ECs/kkZAmdjxsuEqCAJMXl44nKNx7gtuolClOIe7lbDl0o8DvBe2i
 gfoeWYH3EL/VhcpdXgJ8+YVmVjbQjQnJs7F/N7dsCfeSfg4zicm4FCDTvhL3eZQ1z7MlFqNI
 saJSkJh/zR5KV8Gan8sASj9NS5gYN8v73kaSSgFjVpyLwUkSzAiea9ct548jiuIxaCioiP15
 J1OJj2nr62Ao+W/YJ0UcIIOATNtHvy144saxyYXzZeAwzbAnJgw5cbeJ3NfYRVru3tA1QBOD
 k0WQC0kzd1xOQpPoECWbDfKCv8TNg2L5UvBeH4IcvymxbkYwcWLjR2d7cWm0VT5Cd0/KKgX9
 xNXpRssHAGXkOkHSH5EiGH0Bg7VIIe1zdHLBhHUCZsKk98qVvUpquch9CNmeEyZO/xTtj2JA
 QWchPpWINiPT7I+CC8GdixDnXN2phzQkh2Go4n/pVuOgWn8lII86z5WEIq8XEk0zlCMBA7z1
 QDB4UzCt9NAoX66GhjRYXePHGhwr6wAMk0KUJLu0u8b+pmXFJPpoT6z806/LUvL0pDjl193f
 QL/RZN+cYBV3+P8t6qmNOCvw8HSBSqlU0uPLsPr7pJvKdFlz+wARAQABtDFQaGlsaXBwIFJv
 c2VuYmVyZ2VyIDxwLnJvc2VuYmVyZ2VyQGxpbnV0cm9uaXguZGU+iQI+BBMBAgAoBQJWTzTi
 AhsjBQkPCZwABgsJCAcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRAjLQxtMqs54wFyD/0cArCz
 jZhfEZHCrpNwm55OesRNqbN0J4LoR2SuTpV2XxaEJ810KaKHpmUSBlJ6B3NTt/4tB3sgYSGl
 3B2WlSepRe47ZX+1Qms/JO0xTUg9AUCg4WPLraBWgfmXhkOVdhV9e68/h6PpbfL2nDlqGfTA
 mqW/jt3fm3TUvmkXPGjPKCfbswAV+yqY0chpAcg8Tjxg5+ovBHidkDq2uJqTPUpZ1Hn8T+Tv
 2zvhoibwxdqs/F1GFJ7FX9Z3dExAdXv1ijIUwtzZ1npu7VncrwW0g6lnSlDTnSafRaow6oHJ
 NxDHPamW2cWuKleWVIipM2i4IiP3yDntTVXlZ/CmtPCAt2z2I2VrvNT3HuvQyaQJpiJ0NLOz
 9FIGeiA43mWo+cmhKa8NMOWqsK9seYNmwQB/tVNbY7Tfmz+fGmmG7Lf6i5pEFxCEdBjcGgXr
 euL3R1NS2HwrXiuoYLlEcEgQdAWpF2/LsF2JrVDWuYlvtdxbx9021mgmp3JRSZ4IIbv4Sd+A
 Xl351NU8Qlp0h1WWayOHGd31qNNJWDbim1DXREMtffukGcxvzkN9M1Sa4JHQ6D6wB456dyIb
 wplprcEF+40rVKzJk8VMkt4Gkri89FNoYZaxfo+HeSq8/BYFjzEMmAx8Lou1DS1VqnJojp95
 bZgAUnjmRQezbFRdFjQbg2qM4n9+CrkCDQRWTy41ARAAzu6CkXlOf1qhMLFFrVZB3BqnLhOE
 iHdEhlN+/y8kc3ks+psdjeH3wTYk7vUTnWJ4staQr0PTW4DH8pLxLGk4a/3FM1OW1mbHf9MH
 do/A2k1sqndWfDAOBQNKivU+e0AJz8bPpFVFL4TU4Ozsg3vnqV71a+c5N9LMirhbEFlDftx3
 beR7sBfNpcJpjywGh31eawmFu6ryZF362FrgfBaKTpMPr2hUYEVWrZ7iM9ZIU3u3SkbliQyQ
 u+eFvGF1E2NaQsnbeA6x48myFP89m3ocbMVzRw7RckpXl1thstkdpi8emDPGD2IS8LYbBm2e
 b8Rjc63rt7H5PQ1fAkMfK/6YMvj/Xx6E82AsoL8jm0+ptJz89xaNxO/snCgJqtKXr5TCS5xs
 v5rubXa1jJvXTc+RuixwxFEAeNrIrx40SLyx6hhvZF4WLLvAMut5HFPOGp6V4oFUVyn7o/4i
 89QcmT5XyaT8dFa+aWJJ8y31y3RgmHMObjkzCtL/FJBkXPiYB9TbwMn5k+GubLDwLQVX0HNj
 opj01FI58uhk8nmOYHJStpEpG+KmO+xuh5b+e+fnmzf+ab2bXmXS64tVq1wKNfSh/7hR5hxK
 uERYwp+7nVyU7K6QA5u07vtPB5H5YAM0tikDrbO/IsBuZQ3b5pfKtxvW+6Jzv0T3WsqVCqjJ
 GEK3ad8AEQEAAYkCJQQYAQIADwUCVk8uNQIbDAUJDwmcAAAKCRAjLQxtMqs540i6EACR6rZQ
 LgDDDQ8rKm7y7VY0q3PpEeZqvPsXkBTXkC3Lcc2GQj5hISi/kt41rMzYHhjAGnn6q2Uvqe1H
 YJlY0u9R4dI/+LYsBQ7TEKdnN41THadepowgMCwDSzoN8XiLeE7lylQqrWzUzrIcofzSdaBN
 wGi9d+44NyhhoUWnZNZs2yiMS7lkozfAvFskZ+pNR/VWqupjY6kVf3KBWl3Dk86giPmf2Fe0
 O9PgNEdpXHHvleNakWzUURkV3cyAMyq1uUfELGu4iObCsm5SxobeANDMYH50mY1+edhTNObL
 4EypGLNiA5Ali4ej4Ex2S9mRyyJbBjcN6KsarvGnjZF6w+mpDE4hnaGp/AWLbBNgn7XEYlIy
 ozw2ybWAyN40Tt7HuNl0SwybPXNH9Ckr8Bjetz/DEfVj/BmpcQbWUcLSzocFbvTZfI2yfWFE
 EzUivJQDhLzNmFYmr3gVXqvJsqfN2WBg1LEupKzaz7FkbtEl3r8ztXHFQVusMvwSiOKPmR+J
 Krz5x2CP5dlFgPWSK4sfhOAWWEqh5ULwQYiyqVm/2FioQt+qys1qNZ95tZ7Jje58PrNNhpIw
 pbxNIl48EdMIFNTH4jJuOue6QgBfZBAx4YOD9hR9PtUy2Hap0ESAahEMYe0EQWsF+nvig1ZY
 c7AAe3l97AutscBJpp+BBQBj4nPXfw==
Organization: linutronix GmbH
Message-ID: <f7fabeb5-5a7e-a886-03ec-417733aa985c@linutronix.de>
Date: Fri, 21 Feb 2020 08:48:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required,  ALL_TRUSTED=-1,SHORTCIRCUIT=-0.0001
X-Original-Sender: p.rosenberger@linutronix.de
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: best guess record for domain of p.rosenberger@linutronix.de
 designates 2a0a:51c0:0:12e:550::1 as permitted sender) smtp.mailfrom=p.rosenberger@linutronix.de
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

Hi,

I'm trying to get a non-rootcell with IVSHMEM running. I used the qemu
configuration as example to copy from. When I start the non-rootcell I
don't get any errors but the Linux inside the cell dosen't start either.

This is my rootcell configuration:
> /*
>  * created with '/usr/local/libexec/jailhouse/jailhouse config create asdf.c'
>  *
>  * NOTE: This config expects the following to be appended to your kernel cmdline
>  *       "memmap=0x70000000$0x100000000"
>  */
> 
> #include <jailhouse/types.h>
> #include <jailhouse/cell-config.h>
> 
> struct {
> 	struct jailhouse_system header;
> 	__u64 cpus[1];
> 	struct jailhouse_memory mem_regions[60];
> 	struct jailhouse_irqchip irqchips[1];
> 	struct jailhouse_pio pio_regions[6];
> 	struct jailhouse_pci_device pci_devices[17];
> 	struct jailhouse_pci_capability pci_caps[35];
> } __attribute__((packed)) config = {
> 	.header = {
> 		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
> 		.revision = JAILHOUSE_CONFIG_REVISION,
> 		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
> 		.hypervisor_memory = {
> 			.phys_start = 0x100000000,
> 			.size = 0x600000,
> 		},
> 		.debug_console = {
> 			.address = 0x3f8,
> 			.type = JAILHOUSE_CON_TYPE_8250,
> 			.flags = JAILHOUSE_CON_ACCESS_PIO |
> 				 JAILHOUSE_CON_REGDIST_1,
> 		},
> 		.platform_info = {
> 			.pci_mmconfig_base = 0xe0000000,
> 			.pci_mmconfig_end_bus = 0xff,
> 			.x86 = {
> 				.pm_timer_address = 0x1808,
> 				.vtd_interrupt_limit = 256,
> 				.iommu_units = {
> 					{
> 						.type = JAILHOUSE_IOMMU_INTEL,
> 						.base = 0xfed90000,
> 						.size = 0x1000,
> 					},
> 					{
> 						.type = JAILHOUSE_IOMMU_INTEL,
> 						.base = 0xfed91000,
> 						.size = 0x1000,
> 					},
> 				},
> 			},
> 		},
> 		.root_cell = {
> 			.name = "RootCell",
> 			.cpu_set_size = sizeof(config.cpus),
> 			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
> 			.num_irqchips = ARRAY_SIZE(config.irqchips),
> 			.num_pio_regions = ARRAY_SIZE(config.pio_regions),
> 			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
> 			.num_pci_caps = ARRAY_SIZE(config.pci_caps),
> 		},
> 	},
> 
> 	.cpus = {
> 		0x000000000000000f,
> 	},
> 
> 	.mem_regions = {
> 		/* IVSHMEM shared memory region (virtio-blk back-end) */
> 		{
> 			.phys_start = 0x100600000,
> 			.virt_start = 0x100600000,
> 			.size = 0x1000,
> 			.flags = JAILHOUSE_MEM_READ,
> 		},
> 		{
> 			.phys_start = 0x100601000,
> 			.virt_start = 0x100601000,
> 			.size = 0xdf000,
> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
> 		},
> 		{ 0 },
> 		{ 0 },
> 		/* IVSHMEM shared memory region (virtio-con back-end) */
> 		{
> 			.phys_start = 0x1006e0000,
> 			.virt_start = 0x1006e0000,
> 			.size = 0x1000,
> 			.flags = JAILHOUSE_MEM_READ,
> 		},
> 		{
> 			.phys_start = 0x1006e1000,
> 			.virt_start = 0x1006e1000,
> 			.size = 0xf000,
> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
> 		},
> 		{ 0 },
> 		{ 0 },
> 		/* IVSHMEM shared memory regions (demo) */
> 		{
> 			.phys_start = 0x1006f0000,
> 			.virt_start = 0x1006f0000,
> 			.size = 0x1000,
> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
> 		},
> 		{
> 			.phys_start = 0x1006f1000,
> 			.virt_start = 0x1006f1000,
> 			.size = 0x9000,
> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> 				JAILHOUSE_MEM_ROOTSHARED,
> 		},
> 		{
> 			.phys_start = 0x1006fa000,
> 			.virt_start = 0x1006fa000,
> 			.size = 0x2000,
> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
> 		},
> 		{
> 			.phys_start = 0x1006fc000,
> 			.virt_start = 0x1006fc000,
> 			.size = 0x2000,
> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
> 		},
> 		{
> 			.phys_start = 0x1006fe000,
> 			.virt_start = 0x1006fe000,
> 			.size = 0x2000,
> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> 				JAILHOUSE_MEM_ROOTSHARED,
> 		},
> 		/* IVSHMEM shared memory regions (networking) */
> 		JAILHOUSE_SHMEM_NET_REGIONS(0x100700000, 0),
> 		/* MemRegion: 00000000-0009dbff : System RAM */
> 		{
> 			.phys_start = 0x0,
> 			.virt_start = 0x0,
> 			.size = 0x9e000,
> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> 				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
> 		},
> 		/* MemRegion: 00100000-445fffff : System RAM */
> 		{
> 			.phys_start = 0x100000,
> 			.virt_start = 0x100000,
> 			.size = 0x44500000,
> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> 				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
> 		},
> 		/* MemRegion: 44600000-45ffffff : Kernel */
> 		{
> 			.phys_start = 0x44600000,
> 			.virt_start = 0x44600000,
> 			.size = 0x1a00000,
> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> 				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
> 		},
> 		/* MemRegion: 46000000-87d9ffff : System RAM */
> 		{
> 			.phys_start = 0x46000000,
> 			.virt_start = 0x46000000,
> 			.size = 0x41da0000,
> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> 				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
> 		},
> 		/* MemRegion: 87da0000-87da0fff : ACPI Non-volatile Storage */
> 		{
> 			.phys_start = 0x87da0000,
> 			.virt_start = 0x87da0000,
> 			.size = 0x1000,
> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
> 		},
> 		/* MemRegion: 87dcb000-8c4f8fff : System RAM */
> 		{
> 			.phys_start = 0x87dcb000,
> 			.virt_start = 0x87dcb000,
> 			.size = 0x472e000,
> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> 				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
> 		},
> 		/* MemRegion: 8c56f000-8c5a3fff : ACPI Tables */
> 		{
> 			.phys_start = 0x8c56f000,
> 			.virt_start = 0x8c56f000,
> 			.size = 0x35000,
> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
> 		},
> 		/* MemRegion: 8c5a4000-8ce96fff : ACPI Non-volatile Storage */
> 		{
> 			.phys_start = 0x8c5a4000,
> 			.virt_start = 0x8c5a4000,
> 			.size = 0x8f3000,
> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
> 		},
> 		/* MemRegion: 8d2ff000-8d2fffff : System RAM */
> 		{
> 			.phys_start = 0x8d2ff000,
> 			.virt_start = 0x8d2ff000,
> 			.size = 0x1000,
> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> 				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
> 		},
> 		/* MemRegion: 8d400000-8dffffff : RAM buffer */
> 		{
> 			.phys_start = 0x8d400000,
> 			.virt_start = 0x8d400000,
> 			.size = 0xc00000,
> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> 				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
> 		},
> 		/* MemRegion: c0000000-cfffffff : 0000:00:02.0 */
> 		{
> 			.phys_start = 0xc0000000,
> 			.virt_start = 0xc0000000,
> 			.size = 0x10000000,
> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
> 		},
> 		/* MemRegion: de000000-deffffff : 0000:00:02.0 */
> 		{
> 			.phys_start = 0xde000000,
> 			.virt_start = 0xde000000,
> 			.size = 0x1000000,
> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
> 		},
> 		/* MemRegion: df100000-df11ffff : e1000e */
> 		{
> 			.phys_start = 0xdf100000,
> 			.virt_start = 0xdf100000,
> 			.size = 0x20000,
> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
> 		},
> 		/* MemRegion: df120000-df12ffff : ICH HD audio */
> 		{
> 			.phys_start = 0xdf120000,
> 			.virt_start = 0xdf120000,
> 			.size = 0x10000,
> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
> 		},
> 		/* MemRegion: df130000-df13ffff : xhci-hcd */
> 		{
> 			.phys_start = 0xdf130000,
> 			.virt_start = 0xdf130000,
> 			.size = 0x10000,
> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
> 		},
> 		/* MemRegion: df140000-df143fff : ICH HD audio */
> 		{
> 			.phys_start = 0xdf140000,
> 			.virt_start = 0xdf140000,
> 			.size = 0x4000,
> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
> 		},
> 		/* MemRegion: df144000-df147fff : 0000:00:1f.2 */
> 		{
> 			.phys_start = 0xdf144000,
> 			.virt_start = 0xdf144000,
> 			.size = 0x4000,
> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
> 		},
> 		/* MemRegion: df148000-df149fff : ahci */
> 		{
> 			.phys_start = 0xdf148000,
> 			.virt_start = 0xdf148000,
> 			.size = 0x2000,
> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
> 		},
> 		/* MemRegion: df14a000-df14a0ff : 0000:00:1f.4 */
> 		{
> 			.phys_start = 0xdf14a000,
> 			.virt_start = 0xdf14a000,
> 			.size = 0x1000,
> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
> 		},
> 		/* MemRegion: df14b000-df14b7ff : ahci */
> 		{
> 			.phys_start = 0xdf14b000,
> 			.virt_start = 0xdf14b000,
> 			.size = 0x1000,
> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
> 		},
> 		/* MemRegion: df14c000-df14c0ff : ahci */
> 		{
> 			.phys_start = 0xdf14c000,
> 			.virt_start = 0xdf14c000,
> 			.size = 0x1000,
> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
> 		},
> 		/* MemRegion: df14d000-df14dfff : 0000:00:14.2 */
> 		{
> 			.phys_start = 0xdf14d000,
> 			.virt_start = 0xdf14d000,
> 			.size = 0x1000,
> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
> 		},
> 		/* MemRegion: df14e000-df14efff : 0000:00:08.0 */
> 		{
> 			.phys_start = 0xdf14e000,
> 			.virt_start = 0xdf14e000,
> 			.size = 0x1000,
> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
> 		},
> 		/* MemRegion: dffe0000-dfffffff : pnp 00:0a */
> 		{
> 			.phys_start = 0xdffe0000,
> 			.virt_start = 0xdffe0000,
> 			.size = 0x20000,
> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
> 		},
> 		/* MemRegion: fd000000-fdabffff : pnp 00:0b */
> 		{
> 			.phys_start = 0xfd000000,
> 			.virt_start = 0xfd000000,
> 			.size = 0xac0000,
> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
> 		},
> 		/* MemRegion: fdac0000-fdacffff : pnp 00:0d */
> 		{
> 			.phys_start = 0xfdac0000,
> 			.virt_start = 0xfdac0000,
> 			.size = 0x10000,
> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
> 		},
> 		/* MemRegion: fdad0000-fdadffff : pnp 00:0b */
> 		{
> 			.phys_start = 0xfdad0000,
> 			.virt_start = 0xfdad0000,
> 			.size = 0x10000,
> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
> 		},
> 		/* MemRegion: fdae0000-fdaeffff : pnp 00:0d */
> 		{
> 			.phys_start = 0xfdae0000,
> 			.virt_start = 0xfdae0000,
> 			.size = 0x10000,
> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
> 		},
> 		/* MemRegion: fdaf0000-fdafffff : pnp 00:0d */
> 		{
> 			.phys_start = 0xfdaf0000,
> 			.virt_start = 0xfdaf0000,
> 			.size = 0x10000,
> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
> 		},
> 		/* MemRegion: fdc6000c-fdc6000f : iTCO_wdt */
> 		{
> 			.phys_start = 0xfdc6000c,
> 			.virt_start = 0xfdc6000c,
> 			.size = 0x1000,
> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
> 		},
> 		/* MemRegion: fe036000-fe03bfff : pnp 00:0b */
> 		{
> 			.phys_start = 0xfe036000,
> 			.virt_start = 0xfe036000,
> 			.size = 0x6000,
> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
> 		},
> 		/* MemRegion: fe03d000-fe3fffff : pnp 00:0b */
> 		{
> 			.phys_start = 0xfe03d000,
> 			.virt_start = 0xfe03d000,
> 			.size = 0x3c3000,
> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
> 		},
> 		/* MemRegion: fe410000-fe7fffff : pnp 00:0b */
> 		{
> 			.phys_start = 0xfe410000,
> 			.virt_start = 0xfe410000,
> 			.size = 0x3f0000,
> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
> 		},
> 		/* MemRegion: fed00000-fed003ff : PNP0103:00 */
> 		{
> 			.phys_start = 0xfed00000,
> 			.virt_start = 0xfed00000,
> 			.size = 0x1000,
> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
> 		},
> 		/* MemRegion: fed10000-fed17fff : pnp 00:0a */
> 		{
> 			.phys_start = 0xfed10000,
> 			.virt_start = 0xfed10000,
> 			.size = 0x8000,
> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
> 		},
> 		/* MemRegion: fed18000-fed18fff : pnp 00:0a */
> 		{
> 			.phys_start = 0xfed18000,
> 			.virt_start = 0xfed18000,
> 			.size = 0x1000,
> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
> 		},
> 		/* MemRegion: fed19000-fed19fff : pnp 00:0a */
> 		{
> 			.phys_start = 0xfed19000,
> 			.virt_start = 0xfed19000,
> 			.size = 0x1000,
> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
> 		},
> 		/* MemRegion: fed20000-fed3ffff : pnp 00:0a */
> 		{
> 			.phys_start = 0xfed20000,
> 			.virt_start = 0xfed20000,
> 			.size = 0x20000,
> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
> 		},
> 		/* MemRegion: fed45000-fed8ffff : pnp 00:0a */
> 		{
> 			.phys_start = 0xfed45000,
> 			.virt_start = 0xfed45000,
> 			.size = 0x4b000,
> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
> 		},
> 		/* MemRegion: 000c0000-000dffff : ROMs */
> 		{
> 			.phys_start = 0xc0000,
> 			.virt_start = 0xc0000,
> 			.size = 0x20000,
> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
> 		},
> 		/* MemRegion: 8c51b000-8c53afff : ACPI DMAR RMRR */
> 		/* PCI device: 00:14.0 */
> 		{
> 			.phys_start = 0x8c51b000,
> 			.virt_start = 0x8c51b000,
> 			.size = 0x20000,
> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> 				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
> 		},
> 		/* MemRegion: 8d800000-8fffffff : ACPI DMAR RMRR */
> 		/* PCI device: 00:02.0 */
> 		{
> 			.phys_start = 0x8d800000,
> 			.virt_start = 0x8d800000,
> 			.size = 0x2800000,
> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> 				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
> 		},
> 		/* MemRegion: 100600000-1051fffff : JAILHOUSE Inmate Memory */
> 		{
> 			.phys_start = 0x100600000,
> 			.virt_start = 0x100600000,
> 			.size = 0x4c00000,
> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
> 		},
> 	},
> 
> 	.irqchips = {
> 		/* IOAPIC 2, GSI base 0 */
> 		{
> 			.address = 0xfec00000,
> 			.id = 0x1f0f8,
> 			.pin_bitmap = {
> 				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff
> 			},
> 		},
> 	},
> 
> 	.pio_regions = {
> 		PIO_RANGE(0x40, 4), /* PIT */
> 		PIO_RANGE(0x60, 2), /* HACK: NMI status/control */
> 		PIO_RANGE(0x64, 1), /* I8042 */
> 		PIO_RANGE(0x70, 2), /* RTC */
> 		PIO_RANGE(0x3b0, 0x30), /* VGA */
> 		PIO_RANGE(0xd00, 0xf300), /* HACK: PCI bus */
> 	},
> 
> 	.pci_devices = {
> 		/* PCIDevice: 00:00.0 */
> 		{
> 			.type = JAILHOUSE_PCI_TYPE_DEVICE,
> 			.iommu = 1,
> 			.domain = 0x0,
> 			.bdf = 0x0,
> 			.bar_mask = {
> 				0x00000000, 0x00000000, 0x00000000,
> 				0x00000000, 0x00000000, 0x00000000,
> 			},
> 			.caps_start = 0,
> 			.num_caps = 1,
> 			.num_msi_vectors = 0,
> 			.msi_64bits = 0,
> 			.msi_maskable = 0,
> 			.num_msix_vectors = 0,
> 			.msix_region_size = 0x0,
> 			.msix_address = 0x0,
> 		},
> 		/* PCIDevice: 00:02.0 */
> 		{
> 			.type = JAILHOUSE_PCI_TYPE_DEVICE,
> 			.iommu = 0,
> 			.domain = 0x0,
> 			.bdf = 0x10,
> 			.bar_mask = {
> 				0xff000000, 0xffffffff, 0xf0000000,
> 				0xffffffff, 0xffffffc0, 0x00000000,
> 			},
> 			.caps_start = 1,
> 			.num_caps = 7,
> 			.num_msi_vectors = 1,
> 			.msi_64bits = 0,
> 			.msi_maskable = 0,
> 			.num_msix_vectors = 0,
> 			.msix_region_size = 0x0,
> 			.msix_address = 0x0,
> 		},
> 		/* PCIDevice: 00:08.0 */
> 		{
> 			.type = JAILHOUSE_PCI_TYPE_DEVICE,
> 			.iommu = 1,
> 			.domain = 0x0,
> 			.bdf = 0x40,
> 			.bar_mask = {
> 				0xfffff000, 0xffffffff, 0x00000000,
> 				0x00000000, 0x00000000, 0x00000000,
> 			},
> 			.caps_start = 8,
> 			.num_caps = 3,
> 			.num_msi_vectors = 1,
> 			.msi_64bits = 0,
> 			.msi_maskable = 0,
> 			.num_msix_vectors = 0,
> 			.msix_region_size = 0x0,
> 			.msix_address = 0x0,
> 		},
> 		/* PCIDevice: 00:14.0 */
> 		{
> 			.type = JAILHOUSE_PCI_TYPE_DEVICE,
> 			.iommu = 1,
> 			.domain = 0x0,
> 			.bdf = 0xa0,
> 			.bar_mask = {
> 				0xffff0000, 0xffffffff, 0x00000000,
> 				0x00000000, 0x00000000, 0x00000000,
> 			},
> 			.caps_start = 11,
> 			.num_caps = 2,
> 			.num_msi_vectors = 8,
> 			.msi_64bits = 1,
> 			.msi_maskable = 0,
> 			.num_msix_vectors = 0,
> 			.msix_region_size = 0x0,
> 			.msix_address = 0x0,
> 		},
> 		/* PCIDevice: 00:14.2 */
> 		{
> 			.type = JAILHOUSE_PCI_TYPE_DEVICE,
> 			.iommu = 1,
> 			.domain = 0x0,
> 			.bdf = 0xa2,
> 			.bar_mask = {
> 				0xfffff000, 0xffffffff, 0x00000000,
> 				0x00000000, 0x00000000, 0x00000000,
> 			},
> 			.caps_start = 13,
> 			.num_caps = 2,
> 			.num_msi_vectors = 1,
> 			.msi_64bits = 0,
> 			.msi_maskable = 0,
> 			.num_msix_vectors = 0,
> 			.msix_region_size = 0x0,
> 			.msix_address = 0x0,
> 		},
> 		/* PCIDevice: 00:17.0 */
> 		{
> 			.type = JAILHOUSE_PCI_TYPE_DEVICE,
> 			.iommu = 1,
> 			.domain = 0x0,
> 			.bdf = 0xb8,
> 			.bar_mask = {
> 				0xffffe000, 0xffffff00, 0xfffffff8,
> 				0xfffffffc, 0xffffffe0, 0xfffff800,
> 			},
> 			.caps_start = 15,
> 			.num_caps = 3,
> 			.num_msi_vectors = 1,
> 			.msi_64bits = 0,
> 			.msi_maskable = 0,
> 			.num_msix_vectors = 0,
> 			.msix_region_size = 0x0,
> 			.msix_address = 0x0,
> 		},
> 		/* PCIDevice: 00:1c.0 */
> 		{
> 			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
> 			.iommu = 1,
> 			.domain = 0x0,
> 			.bdf = 0xe0,
> 			.bar_mask = {
> 				0x00000000, 0x00000000, 0x00000000,
> 				0x00000000, 0x00000000, 0x00000000,
> 			},
> 			.caps_start = 18,
> 			.num_caps = 5,
> 			.num_msi_vectors = 1,
> 			.msi_64bits = 0,
> 			.msi_maskable = 0,
> 			.num_msix_vectors = 0,
> 			.msix_region_size = 0x0,
> 			.msix_address = 0x0,
> 		},
> 		/* PCIDevice: 00:1c.6 */
> 		{
> 			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
> 			.iommu = 1,
> 			.domain = 0x0,
> 			.bdf = 0xe6,
> 			.bar_mask = {
> 				0x00000000, 0x00000000, 0x00000000,
> 				0x00000000, 0x00000000, 0x00000000,
> 			},
> 			.caps_start = 23,
> 			.num_caps = 7,
> 			.num_msi_vectors = 1,
> 			.msi_64bits = 0,
> 			.msi_maskable = 0,
> 			.num_msix_vectors = 0,
> 			.msix_region_size = 0x0,
> 			.msix_address = 0x0,
> 		},
> 		/* PCIDevice: 00:1f.0 */
> 		{
> 			.type = JAILHOUSE_PCI_TYPE_DEVICE,
> 			.iommu = 1,
> 			.domain = 0x0,
> 			.bdf = 0xf8,
> 			.bar_mask = {
> 				0x00000000, 0x00000000, 0x00000000,
> 				0x00000000, 0x00000000, 0x00000000,
> 			},
> 			.caps_start = 0,
> 			.num_caps = 0,
> 			.num_msi_vectors = 0,
> 			.msi_64bits = 0,
> 			.msi_maskable = 0,
> 			.num_msix_vectors = 0,
> 			.msix_region_size = 0x0,
> 			.msix_address = 0x0,
> 		},
> 		/* PCIDevice: 00:1f.2 */
> 		{
> 			.type = JAILHOUSE_PCI_TYPE_DEVICE,
> 			.iommu = 1,
> 			.domain = 0x0,
> 			.bdf = 0xfa,
> 			.bar_mask = {
> 				0xffffc000, 0x00000000, 0x00000000,
> 				0x00000000, 0x00000000, 0x00000000,
> 			},
> 			.caps_start = 0,
> 			.num_caps = 0,
> 			.num_msi_vectors = 0,
> 			.msi_64bits = 0,
> 			.msi_maskable = 0,
> 			.num_msix_vectors = 0,
> 			.msix_region_size = 0x0,
> 			.msix_address = 0x0,
> 		},
> 		/* PCIDevice: 00:1f.3 */
> 		{
> 			.type = JAILHOUSE_PCI_TYPE_DEVICE,
> 			.iommu = 1,
> 			.domain = 0x0,
> 			.bdf = 0xfb,
> 			.bar_mask = {
> 				0xffffc000, 0xffffffff, 0x00000000,
> 				0x00000000, 0xffff0000, 0xffffffff,
> 			},
> 			.caps_start = 30,
> 			.num_caps = 2,
> 			.num_msi_vectors = 1,
> 			.msi_64bits = 1,
> 			.msi_maskable = 0,
> 			.num_msix_vectors = 0,
> 			.msix_region_size = 0x0,
> 			.msix_address = 0x0,
> 		},
> 		/* PCIDevice: 00:1f.4 */
> 		{
> 			.type = JAILHOUSE_PCI_TYPE_DEVICE,
> 			.iommu = 1,
> 			.domain = 0x0,
> 			.bdf = 0xfc,
> 			.bar_mask = {
> 				0xffffff00, 0xffffffff, 0x00000000,
> 				0x00000000, 0xffffffe0, 0x00000000,
> 			},
> 			.caps_start = 0,
> 			.num_caps = 0,
> 			.num_msi_vectors = 0,
> 			.msi_64bits = 0,
> 			.msi_maskable = 0,
> 			.num_msix_vectors = 0,
> 			.msix_region_size = 0x0,
> 			.msix_address = 0x0,
> 		},
> 		/* PCIDevice: 00:1f.6 */
> 		{
> 			.type = JAILHOUSE_PCI_TYPE_DEVICE,
> 			.iommu = 1,
> 			.domain = 0x0,
> 			.bdf = 0xfe,
> 			.bar_mask = {
> 				0xfffe0000, 0x00000000, 0x00000000,
> 				0x00000000, 0x00000000, 0x00000000,
> 			},
> 			.caps_start = 32,
> 			.num_caps = 3,
> 			.num_msi_vectors = 1,
> 			.msi_64bits = 1,
> 			.msi_maskable = 0,
> 			.num_msix_vectors = 0,
> 			.msix_region_size = 0x0,
> 			.msix_address = 0x0,
> 		},
> 		{ /* IVSHMEM (virtio-blk back-end) */
> 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
> 			.domain = 0x0,
> 			.bdf = 0x0c << 3,
> 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
> 			.num_msix_vectors = 2,
> 			.shmem_regions_start = 0,
> 			.shmem_dev_id = 0,
> 			.shmem_peers = 2,
> 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VIRTIO_BACK +
> 				VIRTIO_DEV_BLOCK,
> 		},
> 		{ /* IVSHMEM (virtio-con back-end) */
> 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
> 			.domain = 0x0,
> 			.bdf = 0x0d << 3,
> 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
> 			.num_msix_vectors = 3,
> 			.shmem_regions_start = 4,
> 			.shmem_dev_id = 0,
> 			.shmem_peers = 2,
> 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VIRTIO_BACK +
> 				VIRTIO_DEV_CONSOLE,
> 		},
> 		{ /* IVSHMEM (demo) */
> 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
> 			.domain = 0x0000,
> 			.bdf = 0x0e << 3,
> 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
> 			.num_msix_vectors = 16,
> 			.shmem_regions_start = 8,
> 			.shmem_dev_id = 0,
> 			.shmem_peers = 3,
> 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
> 		},
> 		{ /* IVSHMEM (networking) */
> 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
> 			.domain = 0x0000,
> 			.bdf = 0x0f << 3,
> 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
> 			.num_msix_vectors = 2,
> 			.shmem_regions_start = 13,
> 			.shmem_dev_id = 0,
> 			.shmem_peers = 2,
> 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
> 		},
> 	},
> 
> 	.pci_caps = {
> 		/* PCIDevice: 00:00.0 */
> 		{
> 			.id = PCI_CAP_ID_VNDR,
> 			.start = 0xe0,
> 			.len = 0x2,
> 			.flags = 0,
> 		},
> 		/* PCIDevice: 00:02.0 */
> 		{
> 			.id = PCI_CAP_ID_VNDR,
> 			.start = 0x40,
> 			.len = 0x2,
> 			.flags = 0,
> 		},
> 		{
> 			.id = PCI_CAP_ID_EXP,
> 			.start = 0x70,
> 			.len = 0x3c,
> 			.flags = 0,
> 		},
> 		{
> 			.id = PCI_CAP_ID_MSI,
> 			.start = 0xac,
> 			.len = 0xa,
> 			.flags = JAILHOUSE_PCICAPS_WRITE,
> 		},
> 		{
> 			.id = PCI_CAP_ID_PM,
> 			.start = 0xd0,
> 			.len = 0x8,
> 			.flags = JAILHOUSE_PCICAPS_WRITE,
> 		},
> 		{
> 			.id = PCI_EXT_CAP_ID_PASID | JAILHOUSE_PCI_EXT_CAP,
> 			.start = 0x100,
> 			.len = 0x8,
> 			.flags = 0,
> 		},
> 		{
> 			.id = PCI_EXT_CAP_ID_ATS | JAILHOUSE_PCI_EXT_CAP,
> 			.start = 0x200,
> 			.len = 0x4,
> 			.flags = 0,
> 		},
> 		{
> 			.id = PCI_EXT_CAP_ID_PRI | JAILHOUSE_PCI_EXT_CAP,
> 			.start = 0x300,
> 			.len = 0x4,
> 			.flags = 0,
> 		},
> 		/* PCIDevice: 00:08.0 */
> 		{
> 			.id = PCI_CAP_ID_MSI,
> 			.start = 0x90,
> 			.len = 0xa,
> 			.flags = JAILHOUSE_PCICAPS_WRITE,
> 		},
> 		{
> 			.id = PCI_CAP_ID_PM,
> 			.start = 0xdc,
> 			.len = 0x8,
> 			.flags = JAILHOUSE_PCICAPS_WRITE,
> 		},
> 		{
> 			.id = PCI_CAP_ID_AF,
> 			.start = 0xf0,
> 			.len = 0x2,
> 			.flags = 0,
> 		},
> 		/* PCIDevice: 00:14.0 */
> 		{
> 			.id = PCI_CAP_ID_PM,
> 			.start = 0x70,
> 			.len = 0x8,
> 			.flags = JAILHOUSE_PCICAPS_WRITE,
> 		},
> 		{
> 			.id = PCI_CAP_ID_MSI,
> 			.start = 0x80,
> 			.len = 0xe,
> 			.flags = JAILHOUSE_PCICAPS_WRITE,
> 		},
> 		/* PCIDevice: 00:14.2 */
> 		{
> 			.id = PCI_CAP_ID_PM,
> 			.start = 0x50,
> 			.len = 0x8,
> 			.flags = JAILHOUSE_PCICAPS_WRITE,
> 		},
> 		{
> 			.id = PCI_CAP_ID_MSI,
> 			.start = 0x80,
> 			.len = 0xa,
> 			.flags = JAILHOUSE_PCICAPS_WRITE,
> 		},
> 		/* PCIDevice: 00:17.0 */
> 		{
> 			.id = PCI_CAP_ID_MSI,
> 			.start = 0x80,
> 			.len = 0xa,
> 			.flags = JAILHOUSE_PCICAPS_WRITE,
> 		},
> 		{
> 			.id = PCI_CAP_ID_PM,
> 			.start = 0x70,
> 			.len = 0x8,
> 			.flags = JAILHOUSE_PCICAPS_WRITE,
> 		},
> 		{
> 			.id = PCI_CAP_ID_SATA,
> 			.start = 0xa8,
> 			.len = 0x2,
> 			.flags = 0,
> 		},
> 		/* PCIDevice: 00:1c.0 */
> 		{
> 			.id = PCI_CAP_ID_EXP,
> 			.start = 0x40,
> 			.len = 0x3c,
> 			.flags = 0,
> 		},
> 		{
> 			.id = PCI_CAP_ID_MSI,
> 			.start = 0x80,
> 			.len = 0xa,
> 			.flags = JAILHOUSE_PCICAPS_WRITE,
> 		},
> 		{
> 			.id = PCI_CAP_ID_SSVID,
> 			.start = 0x90,
> 			.len = 0x2,
> 			.flags = 0,
> 		},
> 		{
> 			.id = PCI_CAP_ID_PM,
> 			.start = 0xa0,
> 			.len = 0x8,
> 			.flags = JAILHOUSE_PCICAPS_WRITE,
> 		},
> 		{
> 			.id = 0x0 | JAILHOUSE_PCI_EXT_CAP,
> 			.start = 0x100,
> 			.len = 0x4,
> 			.flags = 0,
> 		},
> 		/* PCIDevice: 00:1c.6 */
> 		{
> 			.id = PCI_CAP_ID_EXP,
> 			.start = 0x40,
> 			.len = 0x3c,
> 			.flags = 0,
> 		},
> 		{
> 			.id = PCI_CAP_ID_MSI,
> 			.start = 0x80,
> 			.len = 0xa,
> 			.flags = JAILHOUSE_PCICAPS_WRITE,
> 		},
> 		{
> 			.id = PCI_CAP_ID_SSVID,
> 			.start = 0x90,
> 			.len = 0x2,
> 			.flags = 0,
> 		},
> 		{
> 			.id = PCI_CAP_ID_PM,
> 			.start = 0xa0,
> 			.len = 0x8,
> 			.flags = JAILHOUSE_PCICAPS_WRITE,
> 		},
> 		{
> 			.id = PCI_EXT_CAP_ID_ERR | JAILHOUSE_PCI_EXT_CAP,
> 			.start = 0x100,
> 			.len = 0x40,
> 			.flags = 0,
> 		},
> 		{
> 			.id = PCI_EXT_CAP_ID_ACS | JAILHOUSE_PCI_EXT_CAP,
> 			.start = 0x140,
> 			.len = 0x8,
> 			.flags = 0,
> 		},
> 		{
> 			.id = PCI_EXT_CAP_ID_SECPCI | JAILHOUSE_PCI_EXT_CAP,
> 			.start = 0x220,
> 			.len = 0x10,
> 			.flags = 0,
> 		},
> 		/* PCIDevice: 00:1f.3 */
> 		{
> 			.id = PCI_CAP_ID_PM,
> 			.start = 0x50,
> 			.len = 0x8,
> 			.flags = JAILHOUSE_PCICAPS_WRITE,
> 		},
> 		{
> 			.id = PCI_CAP_ID_MSI,
> 			.start = 0x60,
> 			.len = 0xe,
> 			.flags = JAILHOUSE_PCICAPS_WRITE,
> 		},
> 		/* PCIDevice: 00:1f.6 */
> 		{
> 			.id = PCI_CAP_ID_PM,
> 			.start = 0xc8,
> 			.len = 0x8,
> 			.flags = JAILHOUSE_PCICAPS_WRITE,
> 		},
> 		{
> 			.id = PCI_CAP_ID_MSI,
> 			.start = 0xd0,
> 			.len = 0xe,
> 			.flags = JAILHOUSE_PCICAPS_WRITE,
> 		},
> 		{
> 			.id = PCI_CAP_ID_AF,
> 			.start = 0xe0,
> 			.len = 0x2,
> 			.flags = 0,
> 		},
> 	},
> };

This is my non-rootcell configuration:
> #include <jailhouse/types.h>
> #include <jailhouse/cell-config.h>
> 
> struct {
> 	struct jailhouse_cell_desc cell;
> 	__u64 cpus[1];
> 	struct jailhouse_memory mem_regions[22];
> 	struct jailhouse_cache cache_regions[1];
> 	struct jailhouse_irqchip irqchips[1];
> 	struct jailhouse_pio pio_regions[5];
> 	struct jailhouse_pci_device pci_devices[6];
> 	struct jailhouse_pci_capability pci_caps[13];
> 
> } __attribute__((packed)) config = {
> 	.cell = {
> 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
> 		.revision = JAILHOUSE_CONFIG_REVISION,
> 		.name = "my-inmate",
> 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG |
> 			 JAILHOUSE_CELL_VIRTUAL_CONSOLE_PERMITTED,
> 
> 		.cpu_set_size = sizeof(config.cpus),
> 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
> 		.num_cache_regions = ARRAY_SIZE(config.cache_regions),
> 		.num_irqchips = ARRAY_SIZE(config.irqchips),
> 		.num_pio_regions = ARRAY_SIZE(config.pio_regions),
> 		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
> 		.num_pci_caps = ARRAY_SIZE(config.pci_caps),
> 	},
> 
> 	/* CPU 4 */
> 	.cpus = {
> 		0x8,
> 	},
> 
> 	.mem_regions = {
> 		/* IVSHMEM shared memory region (virtio-blk front) */
> 		{
> 			.phys_start = 0x100600000,
> 			.virt_start = 0x100600000,
> 			.size = 0x1000,
> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
> 		},
> 		{
> 			.phys_start = 0x100601000,
> 			.virt_start = 0x100601000,
> 			.size = 0xdf000,
> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> 				JAILHOUSE_MEM_ROOTSHARED,
> 		},
> 		{ 0 },
> 		{ 0 },
> 		/* IVSHMEM shared memory region (virtio-con front) */
> 		{
> 			.phys_start = 0x1006e0000,
> 			.virt_start = 0x1006e0000,
> 			.size = 0x1000,
> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
> 		},
> 		{
> 			.phys_start = 0x1006e1000,
> 			.virt_start = 0x1006e1000,
> 			.size = 0xf000,
> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> 				JAILHOUSE_MEM_ROOTSHARED,
> 		},
> 		{ 0 },
> 		{ 0 },
> 		/* IVSHMEM shared memory regions (demo) */
> 		{
> 			.phys_start = 0x1006f0000,
> 			.virt_start = 0x1006f0000,
> 			.size = 0x1000,
> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
> 		},
> 		{
> 			.phys_start = 0x1006f1000,
> 			.virt_start = 0x1006f1000,
> 			.size = 0x9000,
> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> 				JAILHOUSE_MEM_ROOTSHARED,
> 		},
> 		{
> 			.phys_start = 0x1006fa000,
> 			.virt_start = 0x1006fa000,
> 			.size = 0x2000,
> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
> 		},
> 		{
> 			.phys_start = 0x1006fc000,
> 			.virt_start = 0x1006fc000,
> 			.size = 0x2000,
> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
> 		},
> 		{
> 			.phys_start = 0x1006fe000,
> 			.virt_start = 0x1006fe000,
> 			.size = 0x2000,
> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> 				JAILHOUSE_MEM_ROOTSHARED,
> 		},
> 		/* IVSHMEM shared memory regions (networking) */
> 		JAILHOUSE_SHMEM_NET_REGIONS(0x100700000, 1),
> 		/* low RAM: 1 MiB */ {
> 			.phys_start = 0x100700000,
> 			.virt_start = 0,
> 			.size = 0x00100000,
> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> 				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
> 				JAILHOUSE_MEM_LOADABLE,
> 		},
> 		/* communication region */ 
> 		{
>                         .virt_start = 0x00100000,
>                         .size = 0x00001000,
>                         .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>                                 JAILHOUSE_MEM_COMM_REGION,
>                 },
> 		/* high RAM: 249 MiB */ {
> 			.phys_start = 0x100800000,
> 			.virt_start = 0x00200000,
> 			.size = 0xf900000,
> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> 				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
> 				JAILHOUSE_MEM_LOADABLE,
> 		},
> 		/* MemRegion: df000000-df01ffff : 02:00.0/igb */
> 		{
> 			.phys_start = 0xdf000000,
> 			.virt_start = 0xdf000000,
> 			.size = 0x20000,
> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
> 		},
> 		/* MemRegion: df021000-df023fff : 02:00.0/igb */
> 		{
> 			.phys_start = 0xdf021000,
> 			.virt_start = 0xdf021000,
> 			.size = 0x3000,
> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
> 		},
> 	},
> 
> 	.cache_regions = {
> 		{
> 			.start = 0,
> 			.size = 2,
> 			.type = JAILHOUSE_CACHE_L3,
> 		},
> 	},
> 
> 	.irqchips = {
> 		/* IOAPIC 2, GSI base 0 */
> 		{
> 			.address = 0xfec00000,
> 			.id = 0x1f0f8,
> 			.pin_bitmap = {
> 				(1 << 4),
> 			},
> 		},
> 	},
> 
> 	.pio_regions = {
> 		PIO_RANGE(0x4e, 4),
> 		PIO_RANGE(0x2e, 4),
> 		PIO_RANGE(0x70, 2), /* RTC */
> 		PIO_RANGE(0x110, 8),
> 		/* Serial device: ttyS0 with IRQ 4 (see above) */
> 		PIO_RANGE(0x3f8, 8),
> 	},
> 
> 	.pci_devices = {
> 		{
> 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
> 			.domain = 0x0,
> 			.bdf = 0x0c << 3,
> 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
> 			.num_msix_vectors = 2,
> 			.shmem_regions_start = 0,
> 			.shmem_dev_id = 1,
> 			.shmem_peers = 2,
> 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VIRTIO_FRONT +
> 				VIRTIO_DEV_BLOCK,
> 		},
> 		{
> 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
> 			.domain = 0x0,
> 			.bdf = 0x0d << 3,
> 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
> 			.num_msix_vectors = 3,
> 			.shmem_regions_start = 4,
> 			.shmem_dev_id = 1,
> 			.shmem_peers = 2,
> 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VIRTIO_FRONT +
> 				VIRTIO_DEV_CONSOLE,
> 		},
> 		{
> 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
> 			.domain = 0x0,
> 			.bdf = 0x0e << 3,
> 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
> 			.num_msix_vectors = 16,
> 			.shmem_regions_start = 8,
> 			.shmem_dev_id = 2,
> 			.shmem_peers = 3,
> 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
> 		},
> 		{
> 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
> 			.domain = 0x0,
> 			.bdf = 0x0f << 3,
> 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
> 			.num_msix_vectors = 2,
> 			.shmem_regions_start = 13,
> 			.shmem_dev_id = 1,
> 			.shmem_peers = 2,
> 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
> 		},
> 		/* PCIDevice: igb/02:00.0 */
> 		{
> 			.type = JAILHOUSE_PCI_TYPE_DEVICE,
> 			.iommu = 1,
> 			.domain = 0x0,
> 			.bdf = 0x200,
> 			.bar_mask = {
> 				0xfffe0000, 0x00000000, 0x00000000,
> 				0xffffc000, 0x00000000, 0x00000000,
> 			},
> 			.caps_start = 0,
> 			.num_caps = 6,
> 			.num_msi_vectors = 1,
> 			.msi_64bits = 1,
> 			.msi_maskable = 1,
> 			.num_msix_vectors = 5,
> 			.msix_region_size = 0x1000,
> 			.msix_address = 0xdf020000,
> 		},
> 	},
> 	.pci_caps = {
> 		/* PCIDevice: igb/02:00.0 */
> 		{
> 			.id = PCI_CAP_ID_PM,
> 			.start = 0x40,
> 			.len = 0x8,
> 			.flags = JAILHOUSE_PCICAPS_WRITE,
> 		},
> 		{
> 			.id = PCI_CAP_ID_MSI,
> 			.start = 0x50,
> 			.len = 0x18,
> 			.flags = JAILHOUSE_PCICAPS_WRITE,
> 		},
> 		{
> 			.id = PCI_CAP_ID_MSIX,
> 			.start = 0x70,
> 			.len = 0xc,
> 			.flags = JAILHOUSE_PCICAPS_WRITE,
> 		},
> 		{
> 			.id = PCI_CAP_ID_EXP,
> 			.start = 0xa0,
> 			.len = 0x3c,
> 			.flags = JAILHOUSE_PCICAPS_WRITE,
> 		},
> 		{
> 			.id = PCI_EXT_CAP_ID_ERR | JAILHOUSE_PCI_EXT_CAP,
> 			.start = 0x100,
> 			.len = 0x40,
> 			.flags = JAILHOUSE_PCICAPS_WRITE,
> 		},
> 		{
> 			.id = PCI_EXT_CAP_ID_TPH | JAILHOUSE_PCI_EXT_CAP,
> 			.start = 0x1a0,
> 			.len = 0x4,
> 			.flags = 0,
> 		},
> 	},
> };

I start the non-rootcell with the following command:
jailhouse cell linux configs/x86/inmate.cell ~/nfs/bzImage -c
"console=ttyS0,115200 8250_core.skip_old_serial_uarts=0xE
earlyprintk=ttyS0,115200 ip=dhcp root=/dev/nfs rw
nfsroot=10.23.2.107:/home/ilu/projects/autojailhouse/rfs,v3"

Here is the log from the hypervisor:
> Adding virtual PCI device 00:0c.0 to cell "my-inmate"
> Shared memory connection established, peer cells:
>  "RootCell"
> Adding virtual PCI device 00:0d.0 to cell "my-inmate"
> Shared memory connection established, peer cells:
>  "RootCell"
> Adding virtual PCI device 00:0e.0 to cell "my-inmate"
> Shared memory connection established, peer cells:
>  "RootCell"
> Adding virtual PCI device 00:0f.0 to cell "my-inmate"
> Shared memory connection established, peer cells:
>  "RootCell"
> Adding PCI device 02:00.0 to cell "my-inmate"
> Reserving 5 interrupt(s) for device 02:00.0 at index 136
> Removing PCI device 00:00.0 from cell "RootCell"
> Adding PCI device 00:00.0 to cell "my-inmate"
> Created cell "my-inmate"
> Page pool usage after cell creation: mem 377/975, remap 65546/131072
> Cell "my-inmate" can be loaded
> CPU 3 received SIPI, vector 100
> Started cell "my-inmate"

I get no errors or anything. The cell starts without problems when I
remove the IVSHMEM parts from the config.

I use the following kernel:
http://git.kiszka.org/?p=linux.git;a=shortlog;h=refs/heads/queues/jailhouse

And the jailhouse from the current master branch
(5dbdcbc720c94f79913b1c1b966f87d314d333b5)

My system:
Intel(R) Core(TM) i5-6442EQ
4GB RAM
2 UARTs (ttyS0/ttyS1)

Best regards,
Philipp

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/f7fabeb5-5a7e-a886-03ec-417733aa985c%40linutronix.de.
