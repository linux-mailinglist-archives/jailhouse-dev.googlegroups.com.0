Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBRUV37TAKGQEZREEVRI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23f.google.com (mail-lj1-x23f.google.com [IPv6:2a00:1450:4864:20::23f])
	by mail.lfdr.de (Postfix) with ESMTPS id 331EC1AAFE
	for <lists+jailhouse-dev@lfdr.de>; Sun, 12 May 2019 09:27:03 +0200 (CEST)
Received: by mail-lj1-x23f.google.com with SMTP id n14sf419817ljj.19
        for <lists+jailhouse-dev@lfdr.de>; Sun, 12 May 2019 00:27:03 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1557646022; cv=pass;
        d=google.com; s=arc-20160816;
        b=ZOxw8cpGbRcWoD7ErcVv3ynyfDrRNWJS6IDoo7JYtqgC3i6c4FyIb9K+0mX5FYBosA
         JiAn1OT6VUObQW7rBNYC6ZyGHxfN3Mjx+/Ad8VDFvXCwySxQnZeSDCPcV5Z9BuQq51QY
         0hjkGPuOAmOgAroSCrjciBrwg4hXLCkVTkc62/cjAWCgv+kX+73EwIJqbponPnqOeXsU
         YeSN5/p9CxJT19T7CDNVSkYCBIb31E0exy+786IYKkDCy1Fu00qNsIiyPB/fRLHuVCS5
         nX5QGatNe2Lkvypd1EYrqzOOEwyJPluU+ro+wlfJkjOmAGI0VDjF626da3sNMw+uGknD
         vzYw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=fGTuqYkvFvtICmSvT+MXn6i55nfHNkyJAB6ABJsGMz4=;
        b=FVuHPDeuww7cETq0/czlOy3GoLuQRWH64rv2J1J6WZ0AMIQq+kuvVuR6fmoQP+acUU
         TBkz5Ug0KJIpHMeI3A2tfSEej8wRN4nKewVlkEXz6kaZeDVuEbbSm2VEdvnhD15rPjrZ
         4w7MGlkEpsHWqPELQOss67RLA3BdZVfN6y9C2yquVV0ONqGuy6K1NuXHg4H/j5brX8+a
         uvbyZfwXykkTGvivCNyRqa0v3cfMx0zWmAWMiZZmiVPmKdWnIsubZ5fCdNIgubGtkzGk
         FRW+nA0eeoJbWUlmgJarm/nXVGBPuEJgfhFbXxnRWqcc6fxz59IT7UFyZKsP5foNRGwR
         mCJw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=fuBSYN39;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=fGTuqYkvFvtICmSvT+MXn6i55nfHNkyJAB6ABJsGMz4=;
        b=V09J9GH0eZzHOTBb5mYYtVA8rrrBYOQdvNU35V0TmgYcovtMT+s4rBsQEi74zEjmyM
         U6tTiL92IQXfSSooLE4Pk7YkGKIhw3KLOlZ2l2/M1VSWtjAbxTcTVq1lnKXKmhgMcb0i
         8EoMQQvgsLDLafhrm0OD3Mx+5kfjX9EzF7dvUylGwSP/a8296MwEATeQQ48N4kE2SHK9
         s0B2XEd3oGvA7zIXG70U1Tfvkz/0o/zYRLxjXGHmAX9v87AKUVMz7G/82Vn+UwBWnY8d
         /S+QjomOeMBkzl7vhQXYZzuvATKZyrTIdBTVvab/Rwt5YTOQ/aGuWIUF+WV4RGgb1+jL
         cAcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=fGTuqYkvFvtICmSvT+MXn6i55nfHNkyJAB6ABJsGMz4=;
        b=KbVQNdhkyCh5EosjNisLWueBqmgETcNBkKFEUTtYq0bXp+j1ge8MH+wRBZ6ldcs6Rp
         8HuZvC8i5Esfinjkcq6BUCyOTF6qDhZLgLOExdDGjdAWoVyBq3IIEJAZQVaav0hpQOii
         lJKTY9Mr5ETaL5DViabCR7S29CYTJQQorCy7HyXQri4kAmFUOlLiLZHzhw7LH+h8Jw0b
         M409APkxvLC4jbgLSc9wS/HXhMo5Jzr+kjFOu0B+4hzM+FFHG6fHHDgp9D3/w/lVfdPZ
         A0qgw02S1gF7GP3pswy7krGTC87GhImwdHu4DFS1ClXv8N0NDTVlz1exztM4VIAsaDa+
         Eo5w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUq3Mz2Ea7INLwwwZagauc8aZfqMn4VAlDPwG3/NgPfCYucZGgZ
	k3DjmoTOsv8YueIF5OvGAm8=
X-Google-Smtp-Source: APXvYqyGUaY6/oY1HxA2CL4uG/E2TiX9qrOnQTv5UBodLy3AacedqJLtWGRx+timMGu2bMYRVoATyQ==
X-Received: by 2002:a19:e34c:: with SMTP id c12mr10353823lfk.145.1557646022684;
        Sun, 12 May 2019 00:27:02 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:494a:: with SMTP id b10ls1012499ljd.8.gmail; Sun, 12 May
 2019 00:27:02 -0700 (PDT)
X-Received: by 2002:a2e:9e04:: with SMTP id e4mr10337711ljk.74.1557646022167;
        Sun, 12 May 2019 00:27:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557646022; cv=none;
        d=google.com; s=arc-20160816;
        b=dt+SeE+ywLMkNZtJTl1I6OBfPk3ie9Iv+O6w6BoJS2XVfcWnf1ReulbKEXsF1MVTaB
         S5fCN6CMZXyYtJ7943UBLh+HnvgJkOFF7v9vaC9QC7U9RuuekvATUROvxKLt1Mt2/Q9g
         i6dShDFQeucjnW+kqIfaH4ISwbAeyhptdyCeYmyjA5tWs+4ZM/pNEFDiIeephX7Xw1hm
         chWfiUl6TRSMy5ekaeSPQsuQuraZKYiGNvjUiz1ss1978N0+LJ8EUOWYwVdS/ha28dJi
         W1drGLeEmVeBXYBkErQa52H7S9GxH9s7mQ+jWWm5k8gU7tL2LICthLc2KwhrI+iftOeO
         Y4Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=K8DhuEI93xo0Ti1TGgPHdjvEs81eL29kAeWK46aC/Lw=;
        b=CeVznLftiHcecew5jDCJYw7vdCVvLCjw3lniu00hZjoSPt8y5uHK9xYOg3+g59/G2B
         yvuQaWeW4I5P+Mkg+qzV9/RCVeT8xIZA6HdaUUFNPjwD3LRoFq78wsKGUxtgwiovgtrh
         iCZ7k7vn5RoVicxX+2ySvODxyl20omNif18v/Lgu7j7Yo0RBFMvcW8bxzg0uO1wK5U18
         Q3/3wBlUdVypjWPHyJ3hI8rD9RNAYzaL2Beaixn8BkvXtPILKbWVRHVtOJ0u3WN9698t
         izxRRXYSMsnrPFa+4S4YeLtQSMQHMNCcHP+Uvzp9bVrZFDygsG3NDHQoQDU7zP3oKgSj
         NJvQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=fuBSYN39;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.14])
        by gmr-mx.google.com with ESMTPS id f18si2236201ljg.3.2019.05.12.00.27.02
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 12 May 2019 00:27:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) client-ip=212.227.15.14;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.54.22]) by smtp.web.de (mrweb003
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0LrJxk-1gieIC2Ji8-0139WM; Sun, 12
 May 2019 09:27:00 +0200
Subject: Re: ARM v8a Hypervisor timer
To: Jan Hoogerbrugge <jan.hoogerbrugge@gmail.com>,
 jailhouse-dev@googlegroups.com
References: <CAD9j0toHJr+grA+2xjk2Yu1kP_m3TsFzWrGzVmBm+wdWiFMk4g@mail.gmail.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <0899006d-5a85-f606-75ec-e450c592f227@web.de>
Date: Sun, 12 May 2019 09:27:00 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <CAD9j0toHJr+grA+2xjk2Yu1kP_m3TsFzWrGzVmBm+wdWiFMk4g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Provags-ID: V03:K1:A2xUeSiZBBCz+qnYghKYSs7bsCIBgj3uQD/NoCOPWz3gR244BtC
 rVouhz+VAY/rc5APxV9zK3Tcx36s8YuaSC2B5T5M7AdKe3NbIaOtJQfSoEaxKA54Mz0DvHI
 xP/wuRuvXqACKvslrzWIJV1wJwColTdVavoKKYaeP7i7AUfRBDg5X3T3qGdgS9rUMHq2VdF
 grfVuYYL8pLLBPC/wcILA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:w1so3Be0+yY=:uHa1Pdg2y/O28oVBQydkm1
 LOi/zAr8q3FqyHwz9HNGpt1d2VlY50XO51ZUCEuSbdQj4a5GNaU/0tXdh4gurpZFI/TtCUi0i
 G4rKtUI5qPpz4j8/5K6+YjXPqRw8xbHNibrAyA4jYNWh9Rj216n5Kg71iHfhY0Aeu6FRTeUDa
 l1CK6k90P6sqwbg8cQLK6NhsbYj2LSGxppH4MKy5cGetpRaGBb05GD6jlnBBNbSTXbhjhmB0q
 Yk+hg9nyL7irx9PUW5mK+WqIPuhpJepIIuXbiauLtiKtPJSDshGO7+hQLUaO9s3ApdaNGydrE
 W5yt5iP3LAANrOgefgBd9YwC+4WHZ0s3LP0qoQ58E+SUfJqU3LCkVifZJm+Am/08lOC7sMmkd
 ud1iP7eqR14YWo8xGELyh9j/P7UtODAii/YToaIYPxvCMWWLTnrYzN7O/gMfyVDMOL/8Nfn+r
 rlzG7Yu4Q65BkIsoy+EiN13DsdniX3Cve5tpiYNtvnlLxgwkzQFLb5YdrsdB7Fxx5uvpzKGEW
 INbj8jdT6OPDfoOLl4CyyISanc1Ch9Tgn9iLtMYfFfNvttw0TBr2nF0wvrLWMD2MhWXQMXIDu
 B+J5kDPN24NtH58oDh16EJODiJfqGs/GTtBut1My4CSrYhbaV5Apk/MnwTywajlB857atv0bu
 JR6s1mLCzeSg888ULuvDjGK8KZqTwl0EqItYyE+JqtrhpYt1d+ZNzgGVsp0UyLgW0ImZYt431
 E6q9NyuKoT+deJnrHxjOJpBKgy192B0YElusAfB3dolSP9DhJQ42nUel+WLInJIUvXtZ5qnmt
 i8yDDrwhS4h9w9GRMSTg2GB1JwYwz4y+CL5C12gu9OsmlLUyh+y3u68ZXwkkW9dkp7O8fwQfS
 +gATGdynW+ylE/luaVMIzq+fbnXQXSI0eQcF7A/5FIYlbaVt3bMOzDgVSCp7kYjpSHMnCTpYu
 qea55FjmmNA==
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=fuBSYN39;       spf=pass
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

On 09.05.19 10:37, Jan Hoogerbrugge wrote:
> Hi,
>
> I would like to use the ARM v8a Hypervisor timer. I assume that the physical
> hypervisor
> timer is the one that I need. What I did so far is programming it via CNTHP_CTL_EL2
> and CNTHP_TVAL_EL2 and then I can see in the status field of CNTHP_CTL_EL2
> that this is working as expected. Now I want to receive an interrupt and then things
> become harder. I learned from Jan Kiszka this is not that easy because all
> interrupts
> that Jailhouse intercepts are programmed by the cells with exception of the IPI
> interrupts.
>
> Is there a Jailhouse / ARM v8a expert who can tell me what is necessary to
> use the hypervisor timer interrupt in Jailhouse. I want to use it in an imx8qm
> system.
>
> I want to use the hypervisor timer for periodically checking the guest system(s)
> from
> the hypervisor.

I would check the following:

  - revoke access to the interrupt line in the cell configs
  - make sure the line is enabled in the GICD or GICR, whatever applies
  - hook into irqchip_handle_irq, make sure to acknowledge this interrupt
    fully (the forwarded ones are kept active)
  - program the timer and see if it fires

Jan

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/0899006d-5a85-f606-75ec-e450c592f227%40web.de.
For more options, visit https://groups.google.com/d/optout.
