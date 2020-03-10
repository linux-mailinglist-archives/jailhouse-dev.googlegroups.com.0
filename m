Return-Path: <jailhouse-dev+bncBAABBEWOT3ZQKGQENQIST6I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13f.google.com (mail-lf1-x13f.google.com [IPv6:2a00:1450:4864:20::13f])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2EF18006B
	for <lists+jailhouse-dev@lfdr.de>; Tue, 10 Mar 2020 15:41:23 +0100 (CET)
Received: by mail-lf1-x13f.google.com with SMTP id q4sf4117081lfp.3
        for <lists+jailhouse-dev@lfdr.de>; Tue, 10 Mar 2020 07:41:23 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1583851283; cv=pass;
        d=google.com; s=arc-20160816;
        b=0w/I+9k5/3jtL41lueHb1AtsoIbnqwr+ZCoPVrwYN+cUOipZil3AVz9Ja5ZuxI2ndZ
         KYSDY2XZytn3e73bENtQ8EEbsEDuBNEpsFzUgq6VFk8yNrp28hUFfujWZYV40gYVQzbg
         DyLD3bri/jtpy6urygHPJPR2ZcaVSgFWls6o1GDjXEUx7OXMiSH8yDBhfDW8x+PS5vwE
         bwyi6Dbfu9aEaE2RlsszMO8hxXNpWCWoarZyVuocnZnBQaLo/cuAHpVkA7dg+0iijj9h
         TcuD0kAAthBPbiBmO9nX5sU1FS9hA2DlGH0ETBKxgwM9iWNrRhT2KApDlNFeyky9cH6p
         sdSA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:mime-version
         :user-agent:date:message-id:organization:autocrypt:subject:from:to
         :sender:dkim-signature;
        bh=UMZUF+eqPvFzf3/LQtGksIwSde0VgfqhDWOLAIoN5d8=;
        b=yjxMV04u0gnMlkwheXBJ4dFtztlUQ1wSGkANPeaeU2tTVaSHW8goFStEqVVgXWUFxs
         msfmTdXonaK+eD/JZg6Wkduc6XIOtpt9H027e3AM3hVTft45O5na8rJ2Ur+YlcJKw6nh
         HfgLG2Mk3oUbO5lxeCKwQ8GuwCX0X0nDQ4VpwOymXsN0de0JM3/+OBa+hmebqwG5r9rP
         IizwalY5HOSqZAIm6nVHLJw5XiYs0BwldIYVuET60WRC4Gno/fjTcUFDdMgfLAebrwmp
         Cr4QgdPJ1Ct5MXbl6fR3WMyvfBEhpvkeDUCLLMzg24L05BU7uAEeE7OcxvFm3iMRfU9j
         i+Fg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: best guess record for domain of p.rosenberger@linutronix.de designates 2a0a:51c0:0:12e:550::1 as permitted sender) smtp.mailfrom=p.rosenberger@linutronix.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:to:from:subject:autocrypt:organization:message-id:date
         :user-agent:mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=UMZUF+eqPvFzf3/LQtGksIwSde0VgfqhDWOLAIoN5d8=;
        b=O6ynXIV4c6vXT/rmWfOFhSfv//lMJV54q6K6tVVsZb80l+ItnON8ouN8zPKuY6qiKQ
         mQB8a3UieUQcmHUUQr2AD0auRgdUGJWA74C68+A4M1Sr1+vwyXJPVNw5UqJSMG6eYYBC
         IK/vBVFRrtCJlqLWyfhqb9M9OnqJf9dsmxOYRWqjTlYd456sEzohZey3Q3+DcLQuZyOi
         XDA5UpDIq6jHI+m66Cl+oes1w4t82ZhIMoyHrH03tTNiJseLBRvI14631DgUZcys5WeY
         L/GT9ieLoUUlERQEuxh+VKWUVNPuWm3ixpGrodPI+pRot9AjfTQ0j9d5VdfQh3iasMCd
         O/Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:to:from:subject:autocrypt:organization
         :message-id:date:user-agent:mime-version:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=UMZUF+eqPvFzf3/LQtGksIwSde0VgfqhDWOLAIoN5d8=;
        b=J7fYReoLzx1BqegaDiXYJv/XevGF4M9HG3CEIxSAdceEcBuNUEZcTiczK9tV75OFR9
         kaqPNhVXZpxo6rzbrkVXD4F+x9J1AYcbzAcXVIP1QvEO4VuJLzq+t+Zexz1o81kjMQQ3
         Tn4Ea2ccN82rhz0/GEwdUsq8ixyoOAYeSIAND5GtnWjDGRSVhHg1aFm49yAocjIdn9jR
         r9kJYDmNR89FBIq4DiHHB7NUOkk0unBWXL9q/F/8y51RBRKy9gizd2jkGtum5Wxv+yxm
         OhErdqiLKVnVIixCkDJRKXNlUq6j2OnTA6Uj+PlpmnFkH3fynPj+GVH9GSw83fEE5Jko
         XNZA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANhLgQ1Ph36ZqHIR4oH1jSkcXZns9hBdv05LZmf0FpTgJgs+L5AnVeKz
	xHTpv/LBy1qbWeCCWCiYLpk=
X-Google-Smtp-Source: ADFU+vuoAdySMK7ISQ3MyNHsOtVthHsWs1HEs/FeNROpAdye0QeRvzNHA2fu0am6N9fdnl0OPx3CWw==
X-Received: by 2002:a2e:165c:: with SMTP id 28mr10373116ljw.195.1583851283002;
        Tue, 10 Mar 2020 07:41:23 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:5476:: with SMTP id e22ls1872492lfn.7.gmail; Tue, 10 Mar
 2020 07:41:22 -0700 (PDT)
X-Received: by 2002:ac2:5111:: with SMTP id q17mr13133085lfb.51.1583851282368;
        Tue, 10 Mar 2020 07:41:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583851282; cv=none;
        d=google.com; s=arc-20160816;
        b=BdWCm4A3i8pfPNXbTOXXESLP4RQjFmVjKjFzT1lkU5icCilZtiqEosBY4xOhHPjpl4
         m+D2x6jcfJzyQhaoZOI+MDet3cr6ADSpxq5NixoBWckoB4JQbs5kLio8kixS9zMxw2qi
         tEieE9baM3P2wAQhwMXjz9DjpCb1NRSIfSjtpP7UxfqgI1PswXrOs60n5xOhOf89GJ5D
         VSba4ttaYC/47IbjMwLBW6EcmmfjaAwwsx28EREIx/+zTkLaT/NJJL0DAvkgVpIN8m2i
         BPtNRPGe3NGKs7/2Mh19s5M625/0EpuWdy2vUpfFbtU28DCE7qLgA5ro7zPOteGF8O8/
         EJfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:organization:autocrypt:subject:from:to;
        bh=MYEB2pxaJ6oAzuhr5wVrgm6o4Vz9MxCYwD0KpKRyrU8=;
        b=0pdXb7MjexHWdlDMp2J/xcUwyw1/U47Hoh978VnPemF5wOXHb3Jiz8asQ/P0isi5mc
         wz+U88xRznFhAfn356TKGOqq24FmKsZkf+wgSZSbw7kyWsUUiuODqW29Eq87qRf3FwE4
         QwAJNZ14vzvS+KLLhsQgE9g1fZER7qAHbmLIvw7ns/qN9LE9E/KIQqIDOpfumVvyTcAV
         Tg2MxaJb7DiMTie3Lbwji3sC9RqDLu2gNCfOAqa7RYKKGBFHL9WvM/qkMZoGa3qJQy1z
         g8aibowDOxRtuy9HeIba/HGAp4hNgD8TUgewEx0sOKwBr5+iyBOB3AwXeBh3ApL69NwT
         wo3g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: best guess record for domain of p.rosenberger@linutronix.de designates 2a0a:51c0:0:12e:550::1 as permitted sender) smtp.mailfrom=p.rosenberger@linutronix.de
Received: from Galois.linutronix.de (Galois.linutronix.de. [2a0a:51c0:0:12e:550::1])
        by gmr-mx.google.com with ESMTPS id r6si761975ljk.1.2020.03.10.07.41.22
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 10 Mar 2020 07:41:22 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of p.rosenberger@linutronix.de designates 2a0a:51c0:0:12e:550::1 as permitted sender) client-ip=2a0a:51c0:0:12e:550::1;
Received: from b2b-130-180-90-162.unitymedia.biz ([130.180.90.162] helo=[10.23.2.107])
	by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80)
	(envelope-from <p.rosenberger@linutronix.de>)
	id 1jBg4O-0004ZQ-Nc
	for jailhouse-dev@googlegroups.com; Tue, 10 Mar 2020 15:41:20 +0100
To: jailhouse-dev <jailhouse-dev@googlegroups.com>
From: Philipp Rosenberger <p.rosenberger@linutronix.de>
Subject: virtio-ivshmem-*: only works on the 2nd try
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
Message-ID: <0203ac1b-87f4-177c-1fcd-c6e10d3d5dfd@linutronix.de>
Date: Tue, 10 Mar 2020 15:41:15 +0100
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

I have managed to get virtio-ivshmem console and block running. But I
observed a strange behavior. I do the following:

1. Boot up the board.
2. Enable the rootcell.
3. echo "110a 4106 110a 4106 ffc002 ffffff" > \
  /sys/bus/pci/drivers/uio_ivshmem/new_id
4. virtio-ivshmem-block /dev/uio0 /path/to/disk.image
5. boot linux-inmate
6. virtio-ivshmem 0000:00:0f.0: backend not ready
7. kernel panic

If I redo the sets 4 and 5 the inmates starts as expected and I can
access the disk.image via /dev/vda.

I found, the the virtio-ivshmem-block tool waits for an interrupt if
'state[peer_id] != VIRTIO_STATE_RESET'. But there is no interrupt.

> 129:          0          0          0  IR-PCI-MSI 245760-edge      uio_ivshmem[0000:00:0f.0]
> 130:          0          0          0  IR-PCI-MSI 245761-edge      uio_ivshmem[0000:00:0f.0]

After the first run the 'state[peer_id]' is already set to
VIRTIO_STATE_RESET. Now the linux inmate starts as expected.

> 129:          0         18          0  IR-PCI-MSI 245760-edge      uio_ivshmem[0000:00:0f.0]
> 130:          0          0        136  IR-PCI-MSI 245761-edge      uio_ivshmem[0000:00:0f.0]

Best regards,
Philipp

My root-cell:
> #define USE_VIRTIO_BLK
> 
> #ifndef USE_IVSHMEM_NET
> #	define NET_MEM 0
> #	define NET_PCI 0
> #else
> #	define NET_MEM 4
> #	define NET_PCI 1
> #endif
> 
> #ifndef USE_IVSHMEM_DEMO
> #	define DEMO_MEM 0
> #	define DEMO_PCI 0
> #else
> #	define DEMO_MEM 5
> #	define DEMO_PCI 1
> #endif
> 
> #ifndef	USE_VIRTIO_CON
> #	define CON_MEM 0
> #	define CON_PCI 0
> #else
> #	define CON_MEM 4
> #	define CON_PCI 1
> #endif
> 
> #ifndef USE_VIRTIO_BLK
> #	define BLK_MEM 0
> #	define BLK_PCI 0
> #else
> #	define BLK_MEM 4
> #	define BLK_PCI 1
> #endif
> 
> #define INTERCELL_MEM (NET_MEM + DEMO_MEM + CON_MEM + BLK_MEM)
> #define INTERCELL_PCI (NET_PCI + DEMO_PCI + CON_PCI + BLK_PCI)
> 
> #include <jailhouse/types.h>
> #include <jailhouse/cell-config.h>
> 
> struct {
> 	struct jailhouse_system header;
> 	__u64 cpus[1];
> 	struct jailhouse_memory mem_regions[43 + INTERCELL_MEM];
> 	struct jailhouse_irqchip irqchips[1];
> 	struct jailhouse_pio pio_regions[15];
> 	struct jailhouse_pci_device pci_devices[14 + INTERCELL_PCI];
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
> #if defined(USE_IVSHMEM_NET)
> 		/* IVSHMEM shared memory regions (networking) */
> 		JAILHOUSE_SHMEM_NET_REGIONS(0x16f000000, 0),
> #endif /* USE_IVSHMEM_NET */
> 
> #if defined(USE_IVSHMEM_DEMO)
> 		/* IVSHMEM shared memory regions (demo) */
> 		{
> 			.phys_start = 0x16f100000,
> 			.virt_start = 0x16f100000,
> 			.size = 0x1000,
> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
> 		},
> 		{
> 			.phys_start = 0x16f101000,
> 			.virt_start = 0x16f101000,
> 			.size = 0x9000,
> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> 				JAILHOUSE_MEM_ROOTSHARED,
> 		},
> 		{
> 			.phys_start = 0x16f10a000,
> 			.virt_start = 0x16f10a000,
> 			.size = 0x2000,
> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
> 		},
> 		{
> 			.phys_start = 0x16f10c000,
> 			.virt_start = 0x16f10c000,
> 			.size = 0x2000,
> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
> 		},
> 		{
> 			.phys_start = 0x16f10e000,
> 			.virt_start = 0x16f10e000,
> 			.size = 0x2000,
> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> 				JAILHOUSE_MEM_ROOTSHARED,
> 		},
> #endif /* USE_IVSHMEM_DEMO */
> 
> #if defined(USE_VIRTIO_CON)
> 		/* IVSHMEM shared memory region (virtio-con back-end) */
> 		{
> 			.phys_start = 0x16f200000,
> 			.virt_start = 0x16f200000,
> 			.size = 0x1000,
> 			.flags = JAILHOUSE_MEM_READ,
> 		},
> 		{
> 			.phys_start = 0x16f201000,
> 			.virt_start = 0x16f201000,
> 			.size = 0xf000,
> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
> 		},
> 		{ 0 },
> 		{ 0 },
> #endif /* USE_VIRTIO_CON */
> 
> #if defined(USE_VIRTIO_BLK)
> 		/* IVSHMEM shared memory region (virtio-blk back-end) */
> 		{
> 			.phys_start = 0x16f300000,
> 			.virt_start = 0x16f300000,
> 			.size = 0x1000,
> 			.flags = JAILHOUSE_MEM_READ,
> 		},
> 		{
> 			.phys_start = 0x16f301000,
> 			.virt_start = 0x16f301000,
> 			.size = 0xdf000,
> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
> 		},
> 		{ 0 },
> 		{ 0 },
> #endif /* USE_VIRTIO_BLK */
> 
> 		/* MemRegion: 00000000-0009dbff : System RAM */
> 		{
> 			.phys_start = 0x0,
> 			.virt_start = 0x0,
> 			.size = 0x9e000,
> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> 				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
> 		},
> 		/* MemRegion: 00100000-4e1fffff : System RAM */
> 		{
> 			.phys_start = 0x100000,
> 			.virt_start = 0x100000,
> 			.size = 0x4e100000,
> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> 				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
> 		},
> 		/* MemRegion: 4e200000-4fffffff : Kernel */
> 		{
> 			.phys_start = 0x4e200000,
> 			.virt_start = 0x4e200000,
> 			.size = 0x1e00000,
> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> 				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
> 		},
> 		/* MemRegion: 50000000-87d9ffff : System RAM */
> 		{
> 			.phys_start = 0x50000000,
> 			.virt_start = 0x50000000,
> 			.size = 0x37da0000,
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
> 		/* MemRegion: dffe0000-dfffffff : pnp 00:08 */
> 		{
> 			.phys_start = 0xdffe0000,
> 			.virt_start = 0xdffe0000,
> 			.size = 0x20000,
> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
> 		},
> 		/* MemRegion: fd000000-fdabffff : pnp 00:09 */
> 		{
> 			.phys_start = 0xfd000000,
> 			.virt_start = 0xfd000000,
> 			.size = 0xac0000,
> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
> 		},
> 		/* MemRegion: fdac0000-fdacffff : pnp 00:0b */
> 		{
> 			.phys_start = 0xfdac0000,
> 			.virt_start = 0xfdac0000,
> 			.size = 0x10000,
> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
> 		},
> 		/* MemRegion: fdad0000-fdadffff : pnp 00:09 */
> 		{
> 			.phys_start = 0xfdad0000,
> 			.virt_start = 0xfdad0000,
> 			.size = 0x10000,
> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
> 		},
> 		/* MemRegion: fdae0000-fdaeffff : pnp 00:0b */
> 		{
> 			.phys_start = 0xfdae0000,
> 			.virt_start = 0xfdae0000,
> 			.size = 0x10000,
> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
> 		},
> 		/* MemRegion: fdaf0000-fdafffff : pnp 00:0b */
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
> 		/* MemRegion: fe036000-fe03bfff : pnp 00:09 */
> 		{
> 			.phys_start = 0xfe036000,
> 			.virt_start = 0xfe036000,
> 			.size = 0x6000,
> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
> 		},
> 		/* MemRegion: fe03d000-fe3fffff : pnp 00:09 */
> 		{
> 			.phys_start = 0xfe03d000,
> 			.virt_start = 0xfe03d000,
> 			.size = 0x3c3000,
> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
> 		},
> 		/* MemRegion: fe410000-fe7fffff : pnp 00:09 */
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
> 		/* MemRegion: fed10000-fed17fff : pnp 00:08 */
> 		{
> 			.phys_start = 0xfed10000,
> 			.virt_start = 0xfed10000,
> 			.size = 0x8000,
> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
> 		},
> 		/* MemRegion: fed18000-fed18fff : pnp 00:08 */
> 		{
> 			.phys_start = 0xfed18000,
> 			.virt_start = 0xfed18000,
> 			.size = 0x1000,
> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
> 		},
> 		/* MemRegion: fed19000-fed19fff : pnp 00:08 */
> 		{
> 			.phys_start = 0xfed19000,
> 			.virt_start = 0xfed19000,
> 			.size = 0x1000,
> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
> 		},
> 		/* MemRegion: fed20000-fed3ffff : pnp 00:08 */
> 		{
> 			.phys_start = 0xfed20000,
> 			.virt_start = 0xfed20000,
> 			.size = 0x20000,
> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
> 		},
> 		/* MemRegion: fed45000-fed8ffff : pnp 00:08 */
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
> 		/* Port I/O: 0000-001f : dma1 */
> 		/* PIO_RANGE(0x0, 0x20), */
> 		/* Port I/O: 0020-0021 : pic1 */
> 		/* PIO_RANGE(0x20, 0x2), */
> 		/* Port I/O: 0040-0043 : timer0 */
> 		PIO_RANGE(0x40, 0x4),
> 		/* Port I/O: 0050-0053 : timer1 */
> 		/* PIO_RANGE(0x50, 0x4), */
> 		/* Port I/O: 0060-0060 : keyboard */
> 		PIO_RANGE(0x60, 0x1),
> 		/* Port I/O: 0064-0064 : keyboard */
> 		PIO_RANGE(0x64, 0x1),
> 		/* Port I/O: 0070-0077 : rtc0 */
> 		PIO_RANGE(0x70, 0x8),
> 		/* Port I/O: 0080-008f : dma page reg */
> 		/* PIO_RANGE(0x80, 0x10), */
> 		/* Port I/O: 00a0-00a1 : pic2 */
> 		/* PIO_RANGE(0xa0, 0x2), */
> 		/* Port I/O: 00c0-00df : dma2 */
> 		/* PIO_RANGE(0xc0, 0x20), */
> 		/* Port I/O: 00f0-00f0 : PNP0C04:00 */
> 		/* PIO_RANGE(0xf0, 0x1), */
> 		/* Port I/O: 02e8-02ef : CGT0502:00 */
> 		/* PIO_RANGE(0x2e8, 0x8), */
> 		/* Port I/O: 02f8-02ff : serial */
> 		PIO_RANGE(0x2f8, 0x8),
> 		/* Port I/O: 03c0-03df : vga+ */
> 		PIO_RANGE(0x3c0, 0x20),
> 		/* Port I/O: 03e8-03ef : CGT0501:00 */
> 		/* PIO_RANGE(0x3e8, 0x8), */
> 		/* Port I/O: 03f8-03ff : serial */
> 		PIO_RANGE(0x3f8, 0x8),
> 		/* Port I/O: 0400-041f : iTCO_wdt */
> 		/* PIO_RANGE(0x400, 0x20), */
> 		/* Port I/O: 0680-069f : pnp 00:03 */
> 		/* PIO_RANGE(0x680, 0x20), */
> 		/* Port I/O: 0800-087f : pnp 00:04 */
> 		/* PIO_RANGE(0x800, 0x80), */
> 		/* Port I/O: 0a00-0a1f : pnp 00:07 */
> 		/* PIO_RANGE(0xa00, 0x20), */
> 		/* Port I/O: 0d00-17ff : PCI Bus 0000:00 (partial/HACK) */
> 		PIO_RANGE(0x0d00, 0xb00),
> 		/* Port I/O: 1800-1803 : ACPI PM1a_EVT_BLK */
> 		PIO_RANGE(0x1800, 0x4),
> 		/* Port I/O: 1880-189f : ACPI GPE0_BLK */
> 		PIO_RANGE(0x1880, 0x20),
> 		/* Port I/O: f000-f03f : 0000:00:02.0 */
> 		PIO_RANGE(0xf000, 0x40),
> 		/* Port I/O: f040-f05f : 0000:00:1f.4 */
> 		PIO_RANGE(0xf040, 0x20),
> 		/* Port I/O: f060-f07f : 0000:00:17.0 */
> 		PIO_RANGE(0xf060, 0x20),
> 		/* Port I/O: f080-f083 : 0000:00:17.0 */
> 		PIO_RANGE(0xf080, 0x4),
> 		/* Port I/O: f090-f097 : 0000:00:17.0 */
> 		PIO_RANGE(0xf090, 0x8),
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
> #if defined(USE_IVSHMEM_NET)
> 		{ /* IVSHMEM (networking) */
> 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
> 			.iommu = 1,
> 			.domain = 0x0000,
> 			.bdf = 0x0c << 3,
> 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
> 			.num_msix_vectors = 2,
> 			.shmem_regions_start = 0,
> 			.shmem_dev_id = 0,
> 			.shmem_peers = 2,
> 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
> 		},
> #endif /* USE_IVSHMEM_NET */
> 
> #if defined(USE_IVSHMEM_DEMO)
> 		{ /* IVSHMEM (demo) */
> 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
> 			.iommu = 1,
> 			.domain = 0x0000,
> 			.bdf = 0x0d << 3,
> 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
> 			.num_msix_vectors = 16,
> 			.shmem_regions_start = NET_MEM,
> 			.shmem_dev_id = 0,
> 			.shmem_peers = 3,
> 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
> 		},
> #endif /* USE_IVSHMEM_DEMO */
> 
> #if defined(USE_VIRTIO_CON)
> 		{ /* IVSHMEM (virtio-con back-end) */
> 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
> 			.iommu = 1,
> 			.domain = 0x0,
> 			.bdf = 0x0e << 3,
> 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
> 			.num_msix_vectors = 3,
> 			.shmem_regions_start = NET_MEM + DEMO_MEM,
> 			.shmem_dev_id = 0,
> 			.shmem_peers = 2,
> 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VIRTIO_BACK +
> 				VIRTIO_DEV_CONSOLE,
> 		},
> #endif /* USE_VIRTIO_CON */
> 
> #if defined(USE_VIRTIO_BLK)
> 		{ /* IVSHMEM (virtio-blk back-end) */
> 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
> 			.iommu = 1,
> 			.domain = 0x0,
> 			.bdf = 0x0f << 3,
> 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
> 			.num_msix_vectors = 2,
> 			.shmem_regions_start = NET_MEM + DEMO_MEM + CON_MEM,
> 			.shmem_dev_id = 0,
> 			.shmem_peers = 2,
> 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VIRTIO_BACK +
> 				VIRTIO_DEV_BLOCK,
> 		},
> #endif /* USE_VIRTIO_BLK*/
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


My inmate:
> #define USE_VIRTIO_BLK
> 
> #ifndef USE_IVSHMEM_NET
> #	define NET_MEM 0
> #	define NET_PCI 0
> #else
> #	define NET_MEM 4
> #	define NET_PCI 1
> #endif
> 
> #ifndef USE_IVSHMEM_DEMO
> #	define DEMO_MEM 0
> #	define DEMO_PCI 0
> #else
> #	define DEMO_MEM 5
> #	define DEMO_PCI 1
> #endif
> 
> #ifndef	USE_VIRTIO_CON
> #	define CON_MEM 0
> #	define CON_PCI 0
> #else
> #	define CON_MEM 4
> #	define CON_PCI 1
> #endif
> 
> #ifndef USE_VIRTIO_BLK
> #	define BLK_MEM 0
> #	define BLK_PCI 0
> #else
> #	define BLK_MEM 4
> #	define BLK_PCI 1
> #endif
> 
> #define INTERCELL_MEM (NET_MEM + DEMO_MEM + CON_MEM + BLK_MEM)
> #define INTERCELL_PCI (NET_PCI + DEMO_PCI + CON_PCI + BLK_PCI)
> 
> #include <jailhouse/types.h>
> #include <jailhouse/cell-config.h>
> 
> struct {
> 	struct jailhouse_cell_desc cell;
> 	__u64 cpus[1];
> 	struct jailhouse_memory mem_regions[5 + INTERCELL_MEM];
> 	struct jailhouse_cache cache_regions[1];
> 	struct jailhouse_irqchip irqchips[1];
> 	struct jailhouse_pio pio_regions[4];
> 	struct jailhouse_pci_device pci_devices[1 + INTERCELL_PCI];
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
> #if defined(USE_IVSHMEM_NET)
> 		/* IVSHMEM shared memory regions (networking) */
> 		JAILHOUSE_SHMEM_NET_REGIONS(0x16f000000, 1),
> #endif /* USE_IVSHMEM_NET */
> 
> #if defined(USE_IVSHMEM_DEMO)
> 		/* IVSHMEM shared memory regions (demo) */
> 		{
> 			.phys_start = 0x16f100000,
> 			.virt_start = 0x16f100000,
> 			.size = 0x1000,
> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
> 		},
> 		{
> 			.phys_start = 0x16f101000,
> 			.virt_start = 0x16f101000,
> 			.size = 0x9000,
> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> 				JAILHOUSE_MEM_ROOTSHARED,
> 		},
> 		{
> 			.phys_start = 0x16f10a000,
> 			.virt_start = 0x16f10a000,
> 			.size = 0x2000,
> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
> 		},
> 		{
> 			.phys_start = 0x16f10c000,
> 			.virt_start = 0x16f10c000,
> 			.size = 0x2000,
> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
> 		},
> 		{
> 			.phys_start = 0x16f10e000,
> 			.virt_start = 0x16f10e000,
> 			.size = 0x2000,
> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> 				JAILHOUSE_MEM_ROOTSHARED,
> 		},
> #endif /* USE_IVSHMEM_DEMO */
> 
> #if defined(USE_VIRTIO_CON)
> 		/* IVSHMEM shared memory region (virtio-con front) */
> 		{
> 			.phys_start = 0x16f200000,
> 			.virt_start = 0x16f200000,
> 			.size = 0x1000,
> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
> 		},
> 		{
> 			.phys_start = 0x16f201000,
> 			.virt_start = 0x16f201000,
> 			.size = 0xf000,
> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> 				JAILHOUSE_MEM_ROOTSHARED,
> 		},
> 		{ 0 },
> 		{ 0 },
> #endif /* USE_VIRTIO_CON */
> 
> #if defined(USE_VIRTIO_BLK)
> 		/* IVSHMEM shared memory region (virtio-blk front) */
> 		{
> 			.phys_start = 0x16f300000,
> 			.virt_start = 0x16f300000,
> 			.size = 0x1000,
> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
> 		},
> 		{
> 			.phys_start = 0x16f301000,
> 			.virt_start = 0x16f301000,
> 			.size = 0xdf000,
> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> 				JAILHOUSE_MEM_ROOTSHARED,
> 		},
> 		{ 0 },
> 		{ 0 },
> #endif /* USE_VIRTIO_BLK) */
> 
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
> 		PIO_RANGE(0x110, 8),
> 		/* Serial device: ttyS0 with IRQ 4 (see above) */
> 		PIO_RANGE(0x3f8, 8),
> 	},
> 
> 	.pci_devices = {
> #if defined(USE_IVSHMEM_NET)
> 		{
> 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
> 			.iommu = 1,
> 			.domain = 0x0,
> 			.bdf = 0x0c << 3,
> 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
> 			.num_msix_vectors = 2,
> 			.shmem_regions_start = 0,
> 			.shmem_dev_id = 1,
> 			.shmem_peers = 2,
> 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
> 		},
> #endif /* USE_IVSHMEM_NET */
> 
> #if defined(USE_IVSHMEM_DEMO)
> 		{
> 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
> 			.iommu = 1,
> 			.domain = 0x0,
> 			.bdf = 0x0d << 3,
> 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
> 			.num_msix_vectors = 16,
> 			.shmem_regions_start = NET_MEM,
> 			.shmem_dev_id = 2,
> 			.shmem_peers = 3,
> 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
> 		},
> #endif /* USE_IVSHMEM_DEMO */
> 
> #if defined(USE_VIRTIO_CON)
> 		{
> 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
> 			.iommu = 1,
> 			.domain = 0x0,
> 			.bdf = 0x0e << 3,
> 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
> 			.num_msix_vectors = 3,
> 			.shmem_regions_start = NET_MEM + DEMO_MEM,
> 			.shmem_dev_id = 1,
> 			.shmem_peers = 2,
> 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VIRTIO_FRONT +
> 				VIRTIO_DEV_CONSOLE,
> 		},
> #endif /* USE_VIRTIO_CON */
> 
> #if defined(USE_VIRTIO_BLK)
> 		{
> 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
> 			.iommu = 1,
> 			.domain = 0x0,
> 			.bdf = 0x0f << 3,
> 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
> 			.num_msix_vectors = 2,
> 			.shmem_regions_start = NET_MEM + DEMO_MEM + CON_MEM,
> 			.shmem_dev_id = 1,
> 			.shmem_peers = 2,
> 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VIRTIO_FRONT +
> 				VIRTIO_DEV_BLOCK,
> 		},
> #endif /* USE_VIRTIO_BLK */
> 
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
> 
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

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/0203ac1b-87f4-177c-1fcd-c6e10d3d5dfd%40linutronix.de.
