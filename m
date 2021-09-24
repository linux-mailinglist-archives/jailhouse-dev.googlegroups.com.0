Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBZXFW6FAMGQEWZ2G2WY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53b.google.com (mail-ed1-x53b.google.com [IPv6:2a00:1450:4864:20::53b])
	by mail.lfdr.de (Postfix) with ESMTPS id 509534177FF
	for <lists+jailhouse-dev@lfdr.de>; Fri, 24 Sep 2021 17:46:47 +0200 (CEST)
Received: by mail-ed1-x53b.google.com with SMTP id q17-20020a50c351000000b003d81427d25csf10637050edb.15
        for <lists+jailhouse-dev@lfdr.de>; Fri, 24 Sep 2021 08:46:47 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1632498407; cv=pass;
        d=google.com; s=arc-20160816;
        b=rn6/9VpwnGw13OeJ+R67DTKWZTbJ2ZJaXu6sbYPZH7EH3d5W2hnF3QrgDXPMdMWPTM
         +1x3nuZhrKH3n/wJdwdY02ZOSZeeR5Emr1tHVfwS0S8B8JAXnbN4yXo0cOWEgyp7t0ln
         a+4PC7NMAFidbR6SmblV/cEMJi7R9aNuBwh5G2+fApz7UQDLDzR6noRGdefbouM9Ou56
         nDhSPE2gzk20OqW3fwwmx3pYeWdxsue4r/hChAlRsXq1U9Qs9tOXEo4ADKqEEmBFPbbP
         IWKW7YQNnlY7EYuSD1qOX826s9j/XWzyu81PcK0Z7D/WEQzKEptpL9lgtmYLxYRT3Bcy
         N07w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=tMOEfAahXL7XIDYtVjIQGzKawbrYIWqFqXOngAYLOtU=;
        b=wUj7ZNit+3NuWUAAdAeEbH/WQC+fSpUfbHlgzP7pjbKscR3XM1C6RGdRfcUXtLVJCy
         cPYdb6l9T26gZ3Mn0YLwQOagImmUxJR/mZ7SJp5pFB1LuVHgh8NSm/AICjsPgTSBltHw
         gewWqjMaTorh5Exy4jL5GLmjbJSIttu5/3j9QZfNZBz1zIE2GSQUCxRLnHNrNUsbio+g
         x7oF90cDvf4tff6aBYorMo8Onz+cZIQTQ5yMHsotkI3I7Vx59Hg5O4ge6ehzSU9y6Mv2
         G1JXo+gW4jyCa1U5jZmNjbS/NH+yLdXlYE0VRxOrDnrmLUWg/SXYtu9efehSNaJft2kj
         kM3w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=f6raW7uD;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=tMOEfAahXL7XIDYtVjIQGzKawbrYIWqFqXOngAYLOtU=;
        b=Xe5TEsVS5pL6NvHYoXbcPFftHsTFCvfx3+MosqRzjmrvbwT1yDa9MSpXmWzdf5Nm/M
         9sMP+mp+TcHMh13W9EQDEVR7hcob7thMIaiWzZfa0wbqnyrgGXRRFaBW6uMsfikxdeiU
         UtKOEFsJTQKiw0KO7ZR7h4V39Tdtr6f+b2UPPpCyD5DDRl1io+TkB1jBv02pehwOysZC
         wBxkXifjjk+R/ffkO0GukA/fshx3xvOiXn4lJZUmjK/sVdv4Wn4ot/ZNT0VsgTPawR26
         FFbaa/omJoysT2HPb0f7hitqS0whvuPzdfYAYmQoWd70nUyEJi+YSIbp3cuxc41FwcCj
         z+4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=tMOEfAahXL7XIDYtVjIQGzKawbrYIWqFqXOngAYLOtU=;
        b=pHnpeEYLZP41kV3kKNWHeBB/isc5qkZUIQ2S7K8AGwpH8YenbMwG7W71dcc0hCR4wY
         pCkHMvc6H1sQz/MfWoPx1wZSehdAUpYjNhpZDJd/P7R/qQQDPR0/0I+eXVW/KlzTFkNZ
         hIBmztVhWjGefmpDjfQuYZ21divEOzlhTycDk2DIin7GeiakhBot+zN6SmKMpErFxN3j
         m6V23TgkNoF3FbJ0y5aLo7cWzJFSVSVVdK7lOH2CEPA2Ux1xZBnsUrEdVyBQKcx9dfkw
         N5Iuhp0YQJmhjWCjzC//1qPY2ZkXc3OPL85nGsOQfBkdaqY0t57ywkSyIG1H2rS4gA0Q
         IkEA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533y9yEm+oyrjTGjVPiKM33gJY1CTqsALQ/kkfxIWTC4EZfg/hGo
	oIatCH22PjQdvuBHGFVfgEg=
X-Google-Smtp-Source: ABdhPJwAp6JerTIj4zhuTBsVzAkEBKy7bevMdJFF5SZGvuRng9v1JAc0jAfzMF7gH8gZJkdyrjM4qQ==
X-Received: by 2002:a17:906:c25a:: with SMTP id bl26mr12026709ejb.345.1632498406981;
        Fri, 24 Sep 2021 08:46:46 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6402:18c:: with SMTP id r12ls658534edv.3.gmail; Fri, 24
 Sep 2021 08:46:45 -0700 (PDT)
X-Received: by 2002:a05:6402:1057:: with SMTP id e23mr5841382edu.352.1632498405861;
        Fri, 24 Sep 2021 08:46:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632498405; cv=none;
        d=google.com; s=arc-20160816;
        b=tU+8s3cZ+cdSBtgAUlqzuRmO10LAgyNfVADSRheGRaWXzqbi9gThfR8FBojio8iojV
         cIolokTVSMmD0EI1UrX7S2l6KtNNPx2ZM2OdoWRFTuTS3mVpU99CDc2CFU4hkrYFCKU7
         dPMb1gzJFb8m8mXjUckZfJSHkybMRAPY9YghKr/dsfziIYwVsSJjB2SRSIrio0o9LSYt
         30JtrHHHQVxMdsF+V1nG6TaGdUDsVLbCoHADwARarHENHf3pS/o/pzXkMlLMO8v0BhE9
         WkKI21r6uH02ivsxAgjZFAdUEgpX4bcd5h4/CSMXcdcLJimo9td3hyRQBAIA2nN3ZMeN
         IVxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=Ukj5w2YW/hOmbpqW3iFB3DQh45jW+thTeAg9EGlGmyw=;
        b=zhVuz/8r50piMCFjHncnPM1SJylzVylfWu9poGz9MY1352q45iEd8+5HHiPfd+GOlI
         aTgnSoOYAnKX3sP0KcfkO9KHL2F49mOh+tw0K4Fi9ArTvv88DQhS3MA6trMBBtTTaVa7
         zwGfyNm1am6orNquIfLoxk+l0s+Ue4dbCeJHW/8U7NsGzl4PgR45Ux11fhe15IY1Lsz2
         97qOEeuwGi6lbb+txXLA7iwI+NqkQFjhxZpnMWbfRkOgLG2uCEAVlShTF2LsXg8wjKrT
         K+NNdfj55DD3CzbvuZWMcq4hEjI8mvFGvK701NVPYkmxTV7sdeSFIlWdDExGTBPO7iCt
         BYJA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=f6raW7uD;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
Received: from mout.web.de (mout.web.de. [217.72.192.78])
        by gmr-mx.google.com with ESMTPS id s18si653399ejo.1.2021.09.24.08.46.45
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 08:46:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) client-ip=217.72.192.78;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.10.10] ([88.215.84.132]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Md6y1-1n385u171n-00ZqSI; Fri, 24
 Sep 2021 17:46:45 +0200
Subject: Re: cell create gets stuck on zynqmp
To: Martin Kaistra <martin.kaistra@linutronix.de>,
 jailhouse-dev@googlegroups.com
References: <2ee07d25-ca98-8cc0-3299-3a393aa99fd8@linutronix.de>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <8092b487-f19d-dc89-98e0-cb68077792f9@web.de>
Date: Fri, 24 Sep 2021 17:46:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <2ee07d25-ca98-8cc0-3299-3a393aa99fd8@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:rXpI5AaMRAP0fTiH79pg4E0WX79uJKoGaeNgQ/SB8h/OYQv7D8x
 8YXrC4z5drMbyCoCVv6c9kA0ufN9YroSnaADPC/4mjaNGkEsmzM9heahBkTK0hiw3NER994
 SZ6AuWcBHEIgyJ2lOf0RMA68g8r7Z0dr4WiK+IddwoFmjdA3zNpgE5DKFKVbM98rE3S7es0
 IXf9JRE3LUxLnTOHfkmhw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:AfD1hlGUqiI=:YZ9JK+csn5SkZMAKP/c0y9
 /meterupgNqsyzf/x01MXTYZRZmh4G+z2+yWUYz/gxPUznqaizL4PfKBi3mF9la+2uR6rXxKm
 ciuHN/Jc6pWHUG5as7bmVvj2FALaGffylYA/WXuyNUJnKJCdCnMwSIq7IZ8RU9sfMoRaTTQax
 QT+6b70LEU/xYvT8T2QUNhqXxYnxiqNytTK7g4wfHPv8L/6RoEWjGkGu0oqK6CrQnGNQxuVe4
 kYYovt2+Vxrfg1RPsNMWL3MnBHIkDq068y5MMnfsXJ4KbTuMoyPcMNBxsmNHcBE3boFx9oLC+
 kSS61uTxpULqyUX+hZWt9aDhetOvUKiBMiY8j8dGokirb3dDC0Awt7O+9QFBFkQwtZg80sBeW
 qR+5NZCdpkt4tUyFoy5P3zwIhZvuBesNMY6EZUoPTidJqtZCpry2n+IHOB2W+8f0rO7/CqPCO
 FCC5IqqB6HT6ZDlbtXLhG58f9dwNKq4xiRnMt6AK8GjOVzTH8eYRTxmR+dancoiF+muhzdy4q
 SFSk748qHxrTLbgqokwKSuFgv5uyXLdzH/+tzW6hDmsC9LMknjPvygfXudkdNg67Sot1isK4g
 OM3Nv6qTAwEmWwQkPLziLe4Y0OnBesIfsIYlwWV+NgF/ITjVGUzqxs/aoAEouTpeFcpCrfuGa
 /F62zISIulYX9Ckzr8jZOfENRzhSjipyHFIA6Fg8BRgpLq7cnLrwTTfzaRv5iO2Ut0vcesuwL
 reWLIG24HFbSNd9072BjUUlc5S8Pm7Bf5EXl953nqFPRyAqHXcaS74u4Jk5dbvGwJD6TtXH3M
 nR/3omx3wvzpNdCxPkWmlZ3gaHTuh6VqZ/McTLLu5jwOQwZsT0pSf1ojpHSb9JVBptZt4ccJn
 iyygZXJaAFjSD8TujBTKqGQyLO99xmxuLf2k55NgbFsgC//uEpCU9bVhztf682qdEw3C1HmoP
 xnb6Y21cu43b0ZlUAupHjZBnnFF6xXcLuh/xRhNw/dmKQpVi4D6VaErw/73KQ3Wxw9zFwLcBc
 XlBE1D6PXLL8brHvEomk+C8ILQMfdrB52xkS4NfZyB07a0FW7w1BRJYMmYgcn+y0qINCmTmnS
 KI8Ev/slxhSMqU=
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=f6raW7uD;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de;       dmarc=pass (p=NONE
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

On 22.09.21 12:15, Martin Kaistra wrote:
> Hi all,
>
>
>
> I am currently trying to bring up Jailhouse on a ZynqMP ZU2CG-1I board
> with two cores. I can see two different types of behaviour when trying
> to start on of the inmate demos. Sometimes everything works fine and I
> can see the output of the uart-demo running on the second cpu. In more
> than half of my tests, however, the system gets stuck after calling
> "jailhouse cell create inmate.cell".
>
>
>
> I added some debugging output to the hypervisor code and I can see, that
> it gets stuck in the loop while (!target_data->cpu_suspended) in
> suspend_cpu() which gets called from cell_create() ->=C2=A0 cell_suspend(=
)
> with cpu_id=3D1 while this_cpu_id() is 0.
>
>
>
> In these non-working cases, check_events() in
> hypervisor/arch/arm-common/control.c doesn't seem to be called.
>
>
>
> I am using Jailhouse master and a kernel based on xilinx-v2021.1 (5.10).
>
>
>
> Has anyone run into this before?
>
>

If suspend_cpu() does not progress, the target CPU is not reacting
properly on the request to leave the guest and service the Jailhouse
commands. Could be that you interrupts are not handles properly. Run
"jailhouse config check" on your setup, maybe you are passing the
interrupt controller through.

Or are you using SDEI-based management interrupts? Would require a
special TF-A version, so likely does not happen "by chance".

Jan

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/8092b487-f19d-dc89-98e0-cb68077792f9%40web.de.
