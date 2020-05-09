Return-Path: <jailhouse-dev+bncBC2PTC4R4MNBBOXG3D2QKGQEGBXQXJA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oo1-xc3d.google.com (mail-oo1-xc3d.google.com [IPv6:2607:f8b0:4864:20::c3d])
	by mail.lfdr.de (Postfix) with ESMTPS id 747A61CBD5F
	for <lists+jailhouse-dev@lfdr.de>; Sat,  9 May 2020 06:36:12 +0200 (CEST)
Received: by mail-oo1-xc3d.google.com with SMTP id y65sf2783363ooa.4
        for <lists+jailhouse-dev@lfdr.de>; Fri, 08 May 2020 21:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=5WE/4ULejxJxaOafn0jW3J6j1pl7Eb1t48sWBfI5JTE=;
        b=ZzlY0lKKqsNpNEdjpqxc0OyB8Q8WSxmlwkEPdmNGQpH0rt6NQIuDpfLrwskiQ8jmbc
         V4UmZHgK3IIiuZSu06/bFOVtOF0jPDKwEjX4zlaWRs2GFYuoyXgrH+B2hijWKd4+LexT
         h4IGQwji755pM6Bw2rdg+1rJi2zaLPO1+d55ySkj++wJrzcsEJbwucfPY4StJwMlF1y9
         DdvePSCZLb70+8mm5z6x3M9oPfoQ19+9hZ+2a5yLEgxUlSQtzv1EFtaOYtdZZczpn8yG
         FTmqN//ETXA4iQEvaArQKEQBoHXmHSB5ZWwnpqjV7PU+rLMVuxZfHicxkJEVJnyudXaP
         CSvg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=5WE/4ULejxJxaOafn0jW3J6j1pl7Eb1t48sWBfI5JTE=;
        b=GShUAIVPzAG/ZwsIsIPrvIrxm+9w/eoVwMfx7KDHUDbLA5iz1uswDcn9NIG7m46A0W
         oZGNouTrzik9ED6qLFoksEedjbJKULvV4QxikofdYvHOcw2YdSuKjqy/Q2boiEmuN3Fw
         wEJ52G6uyiT7qj7ae/XUn2+Mp5ZKsQOM9Ut9cLtcrwvzmiMgTmbMGPxz6Np0GLPeh+Oq
         DM3jvDVMujgXxGRlBaR6MryNAKkQfVaxva+n1vEc1RU6oZJwQe+eNXVZZ83ax5NWDEKg
         8b0Lxznjrrodn0awl0YbILE9UXaNan0xblkDf3vpIsn5cgBU7OZP8NaOPpP6abz8pWGc
         OsRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=5WE/4ULejxJxaOafn0jW3J6j1pl7Eb1t48sWBfI5JTE=;
        b=N5Gj9G85tlgOR64ELErKiM74wvkIOr0v9pJtlZ/83AimIFWXFdAC5BH9L+lrE/ZHK+
         rS5Dj6wV+KgAY/ijFz6UqZy4FkmO54IWyE93usXGNLTwBOmZ0yNw2pZux7H0oTMlqgF5
         rb8q1VfTi4JGSlmEsu30YPy6828f3ecBhXmWZr9gkHjfDppAiqnEXi0kY5Y7ErYpiDra
         Ky2FWy91znyAe2+wTqHjqEiU5iMkGdsQJmcBzwdBiSiyugXVmjptO7ENnzow1/bimN3T
         OVlvojwE/9xQ9Ocpo+thGSmwD16QcRQmtVXbUogdltNEJ8GFQI/UsSvXr0zHX+7K6ImC
         LV7Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AGi0PuYTiQn/fLHc0rSsQjMpTfquYFC6+igwM/e2FnVXUJIprKgPRhBh
	0neAP5VH5N7VRlqu9ASELYA=
X-Google-Smtp-Source: APiQypJRULjstUE5L8LFTY1IVsuagsLcJQ0nXbfdlnOWzhgHeA9Icpblum9+BGsT9vemFSpAawhswA==
X-Received: by 2002:aca:53cd:: with SMTP id h196mr12977113oib.104.1588998970888;
        Fri, 08 May 2020 21:36:10 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:5390:: with SMTP id h138ls2788042oib.4.gmail; Fri, 08
 May 2020 21:36:10 -0700 (PDT)
X-Received: by 2002:aca:b389:: with SMTP id c131mr9661915oif.154.1588998970328;
        Fri, 08 May 2020 21:36:10 -0700 (PDT)
Date: Fri, 8 May 2020 21:36:09 -0700 (PDT)
From: Chung-Fan Yang <sonic.tw.tp@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <7b537982-4415-44ba-a538-ffb599634633@googlegroups.com>
In-Reply-To: <39160e6e-2bba-a46a-5bc3-18595ec872a7@siemens.com>
References: <0fabe986-8e7d-4905-89af-75ec7e4d20ff@googlegroups.com>
 <39160e6e-2bba-a46a-5bc3-18595ec872a7@siemens.com>
Subject: Re: Ivshmem-2 driver for x86_64 root Linux
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_750_1967401498.1588998969823"
X-Original-Sender: Sonic.tw.tp@gmail.com
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

------=_Part_750_1967401498.1588998969823
Content-Type: multipart/alternative; 
	boundary="----=_Part_751_1439441696.1588998969823"

------=_Part_751_1439441696.1588998969823
Content-Type: text/plain; charset="UTF-8"



> > 
> > I am curious that besides of the special ivshmem2 driver and patches to 
> > uio, are there any other significant changes to the kernel source? 
> > 
>
> You can check the commits: 
>   - uio ivshmem driver 
>   - ivshmem-net driver (lots of commits in queues/jailhouse, folded in 
>     stable) 
>   - virtio-over-ivshmem (experimental, only in queues/jailhouse so far) 
>   - driver for debug console (only relevant for bring-ups) 
>   - some export-symbols, not needed with kallsyms workaround (as long as 
>     that works) 
>   - some dts changes for marvell arm64 boards 
>
> > Because I am using stock 4.19 with PREEMPT_RT, i can run Nuttx and it 
> > works like a charm without any noticeable bugs. 
> > 
>
> It depends on the use case what would be missing, but things generally 
> work. At least booting. 
>
>
Thanks for the information.

Now I know how to port my old modified ivshmem driver now.

I am on x86_64 so I think I am good using the stock kernel with separately 
compiled driver.

One more question, 

As long as my user-space program don't write to the readonly region and 
trigger a fault in the hypervisor.

Without the uio readonly patch, things should work correctly, yes?

Thanks, 

Yang




 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/7b537982-4415-44ba-a538-ffb599634633%40googlegroups.com.

------=_Part_751_1439441696.1588998969823
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><blockquote class=3D"gmail_quote" style=3D"margin: 0;margin-left: 0.8ex=
;border-left: 1px #ccc solid;padding-left: 1ex;">&gt;=20
<br>&gt; I am curious that besides of the special ivshmem2 driver and patch=
es to=20
<br>&gt; uio, are there any other significant changes to the kernel source?
<br>&gt;=20
<br>
<br>You can check the commits:
<br>=C2=A0 - uio ivshmem driver
<br>=C2=A0 - ivshmem-net driver (lots of commits in queues/jailhouse, folde=
d in
<br>=C2=A0 =C2=A0 stable)
<br>=C2=A0 - virtio-over-ivshmem (experimental, only in queues/jailhouse so=
 far)
<br>=C2=A0 - driver for debug console (only relevant for bring-ups)
<br>=C2=A0 - some export-symbols, not needed with kallsyms workaround (as l=
ong as
<br>=C2=A0 =C2=A0 that works)
<br>=C2=A0 - some dts changes for marvell arm64 boards
<br>
<br>&gt; Because I am using stock 4.19 with PREEMPT_RT, i can run Nuttx and=
 it=20
<br>&gt; works like a charm without any noticeable bugs.
<br>&gt;=20
<br>
<br>It depends on the use case what would be missing, but things generally=
=20
<br>work. At least booting.
<br>
<br></blockquote><div><br></div><div>Thanks for the information.</div><div>=
<br></div><div>Now I know how to port my old modified ivshmem driver now.<b=
r></div><div><br></div><div>I am on x86_64 so I think I am good using the s=
tock kernel with separately compiled driver.</div><div><br></div><div>One m=
ore question, <br></div><div><br></div><div><div>As long as my user-space p=
rogram don&#39;t write to the readonly region and trigger a fault in the hy=
pervisor.</div></div><div><br></div><div>Without the uio readonly patch, th=
ings should work correctly, yes?</div><div><br></div><div>Thanks, <br></div=
><div><br></div><div>Yang<br></div><div><br></div><div><br></div><div><br><=
/div><div><br></div><div>=C2=A0</div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/7b537982-4415-44ba-a538-ffb599634633%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/7b537982-4415-44ba-a538-ffb599634633%40googlegroups.com<=
/a>.<br />

------=_Part_751_1439441696.1588998969823--

------=_Part_750_1967401498.1588998969823--
