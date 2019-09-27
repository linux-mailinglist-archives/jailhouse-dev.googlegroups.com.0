Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBPUUXDWAKGQEATUIQKY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33b.google.com (mail-wm1-x33b.google.com [IPv6:2a00:1450:4864:20::33b])
	by mail.lfdr.de (Postfix) with ESMTPS id 4355EC0607
	for <lists+jailhouse-dev@lfdr.de>; Fri, 27 Sep 2019 15:10:23 +0200 (CEST)
Received: by mail-wm1-x33b.google.com with SMTP id k9sf2757933wmb.0
        for <lists+jailhouse-dev@lfdr.de>; Fri, 27 Sep 2019 06:10:23 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1569589823; cv=pass;
        d=google.com; s=arc-20160816;
        b=OJ/w3BSk+0HJDWSEOBNyJcILMUBl4juI6bv0FnvTJ0g4kzJCTS8BCW4jpN9a6yGXid
         opvOPyYi2hDJlQsU3jm0ghE/z84TEMko/cLTGT7Oa9oAnIQvHxhPSYm1vMyTNPgfRRqM
         p6sV7GEoMJW1QX1Lkg6oehVlIe6KmW7NtuMmbUS8VfNR8STn3S9lvjtp1PbRgN74iOtp
         OORSXR27ekc7RNdzZWBzGxKhtFjRGybLi4I6W66EsDC99I0B7+CPjuMvYrl9I+EQKRDC
         UnT3MWHYuXH5KHfbXoIhaoULY8iXNshv9PTpXyfa+Un+HLHBicj1y8lmgWz4swoqhr4D
         gVnQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=iako9K4wRF7554ey/O317Bj+nX3Z64xnRw/Vy2mspBc=;
        b=lNe652uG49PJgeFUjsBt1lGmJMGWbRTMpRihLEEdzrsIeU277P77zxGQTLh6T5Fgjy
         URQpkL4qF4fD959aLu/dzcP+gzKDNhVcGoEI8nQZntQ61cax/2wKaV3/Nu8DHN+zZxnx
         m0ilhiQZzUMtKpP6aVgfe3WYr5RaYzcVgBlv8TJr9aQkuHrAKHu3zGZOCnBD+HjmYrVn
         kGHR0Njs0zCWGQLOgyFkwo1jE9rnUdi8R1ZECwQmFiEy5/LcFa7TkB3BSoojt9/6Kk4E
         qeDXcJKlE9tcfXT5dXjM+HLzA+hWw6Lt+2aitaeLqBEecr2s9pAVmLMi6vyAonGi+8bY
         gJ+A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=sA2Mt5s3;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=iako9K4wRF7554ey/O317Bj+nX3Z64xnRw/Vy2mspBc=;
        b=QJ89Ch+aLRKLXTZKx4A/8Hx/HLwxXYznuE8ceSg9wPGlyyIqMpZ28e/hrybTipVwHd
         L0Xbgicr6GAW3U3l+v2IKzafBw2eCHRbd3yrWCHOsS+X97+ftLJ/muJD5/ln+NGpPYxw
         14BBR4wMY09XSNPkwJq/aKfITj+ajtEEu2nvd+12L+wngCaYRbVa0WV6ywqzOFfCYjbS
         kKbTijzW98LMdTB/SzC0qEyjwtipHjKz/fRfUjGEi5+dt7OOazxideHGkbI7hi1vCnRu
         Tne96FPsC4rhcL9x7gK+z3LfRCzsvqRLHxVoFuVq6VOCcjPByz4bTo5/eVUzsqMnHYIJ
         bWfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=iako9K4wRF7554ey/O317Bj+nX3Z64xnRw/Vy2mspBc=;
        b=hbG1P5b636FzeUe0UDnm2yDS4T+W3/9z0paXGXgyMB0Lle6TrQVHJi9HBFYs6lo6NG
         r6aM7hNyNXWuvKtJ0Tk1x/uolBHGZ6Sgds1U6GPKYeKP6C7sNoMiJYTo7j4Mq20Hj6pi
         OIgbyia1l0AOBXe34qAYyuYBwrnMZNwvb6mlDto9Z6PLAEixXOYFokldj0UlaI2YiqQX
         ZzL6zJglBFPmwUAhLVFikXcCnLr+HQIGdrynAdwsLQiFQArDMkVzzSv/yBuwmrxYMBlx
         Fgwlto+LMTlpuedJrmJT48Kww93SNUbfIeExV2ZtFNF3BV1oPjFUh9JZ9VDp4NM+kgHE
         On6Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVMCAN9K69A5nJbVIdzagTYRxXL2gg10OCID9RWOaBP/12/LXJ6
	AoP1aHU8mp7iqXJMGW3Qb8c=
X-Google-Smtp-Source: APXvYqzUagMIaZy5JSBSVI1250fQP6+RWSG4AO3HxQlMDcrjhdhbWfe7wm47T5p7XjUHnoF8ATfyrA==
X-Received: by 2002:a5d:55d0:: with SMTP id i16mr2857399wrw.108.1569589822920;
        Fri, 27 Sep 2019 06:10:22 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:526c:: with SMTP id l12ls771702wrc.12.gmail; Fri, 27 Sep
 2019 06:10:22 -0700 (PDT)
X-Received: by 2002:a5d:4a09:: with SMTP id m9mr2999124wrq.93.1569589822054;
        Fri, 27 Sep 2019 06:10:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569589822; cv=none;
        d=google.com; s=arc-20160816;
        b=WepZS5gMEk2uHX/Ccf70sOkrg/urOIOQtVYRsCjKElwGuQhlQevkDkYNx6IuegPhlq
         K8Sl2QxZFYodIisginT2JFoHJGV0dT7RegIn+HH8Uy9VdNE4P7nq/hirvjYNR+SHf4iM
         Usel3P3vuUXBJ4Jma8R6NL846uevNghj7cKuENaHYm78n+oz84CH96r76KSaZsl6SxZd
         pTz2SlN56qJN0ZAjQgVqN1PTADwhEvXkCm94ha2+f3Sa9/dA6Yplk/esbY9tuu+g3Y7d
         TUtndtwwoRPVqnhU0ZNOFNwSmxxisKKTHyeDjRKUnkPfO54x7jNEyrJniOdbxJqGn7VX
         mJ8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=aycjIBBQlRL+3/E/de2X9nV+v+CoTk77HY9Rviydrqw=;
        b=of1+UmLZ1LVY2mcr7wuaQ3cWtM8U1p2r4qBuBVe2Xsry0/lC7Zoy48E6Duidexf83q
         n8yIGUlaF0gGfeyRXD/HY3FJ1qjCe5pLcr5pbLqZ0QEtss5BQ2ZXQM5X+Elx4UUiBdn6
         Rx8a01ihsy5DPZZuPEsHAde/fAMJlqjoPAYurKTnk/eAbE7NUIyQtGxyYuFrv/jjKMc+
         0CHISh0KoOizJ/4uPw+YqhXedxeMj1LC++oVIowm3nUiWOBsNA0PQokHgCrGUkrTlxF9
         13MyQPH0SMI9lXJEnvwLq7UbbVPuurdsVh+Hg49NUuhTgFSFwAyLucvhpILYHV9mbv0q
         6r7Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=sA2Mt5s3;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.4])
        by gmr-mx.google.com with ESMTPS id r1si128297wrn.2.2019.09.27.06.10.21
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 27 Sep 2019 06:10:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) client-ip=212.227.15.4;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.55.156]) by smtp.web.de (mrweb001
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MWAtV-1igp8u26Uj-00XPB3; Fri, 27
 Sep 2019 15:10:21 +0200
Subject: Re: [PATCH] tools: cell-linux: arm: Do not page align the ramdisk
 size
To: Lokesh Vutla <lokeshvutla@ti.com>,
 Jailhouse <jailhouse-dev@googlegroups.com>
Cc: Tero Kristo <t-kristo@ti.com>, Sekhar Nori <nsekhar@ti.com>
References: <20190927085142.23081-1-lokeshvutla@ti.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <1567e003-6e29-cba8-8bc7-9068fac1c6f0@web.de>
Date: Fri, 27 Sep 2019 15:10:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190927085142.23081-1-lokeshvutla@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Provags-ID: V03:K1:Owb64xICg61DwU1Ks3LK9iaizv6+XjGX8mKqjqqBRr79PFr6wQc
 zuemOpYr4kO0JKWGtHV5keOt5QYYqm/EqZztpzxes9waXb0tmUCki1yICy5mJp7MIertDSV
 geRJ5tDkcI7kuwH5/LwazB90o5AmvBC+NdInaCORoa8ScXAbv4oznc12IEJu65fJjMlNonH
 8nt2tumq1XolUPxCcsMOQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ilit0aIa1lo=:95xPt3zQwARAyLz2s6WfnR
 lrMa1E+HLyaZm349FK6sEuUkOEqFN8+zkrsQ4D+YKLqf6W5rWpaD6teK3XnImH8frIVsNqU+d
 lo5fx9yXCcjdVno9PBQs+WeYUlJodtE5V9vjy2FHX2vwalLaDFDuiPssJFVZQSigt/lrvU6mV
 9TzYee9NG7JolzRQCS27ufn95A95U6No/v5Ahl2c+hyiwTUcXxEGHA8lPc8yU2k0kxI+6AJG1
 lEXjIEdUQ+4EZWagyeQI+N+OjPkE9/1kyTDLw89St1L167HGqDMIx5WHqwhcT88fIYx6JXoT+
 pGuw2cMZ86cinKIZUtcnNZqjiM8Goc4Hd7jKxRhWbwchHDz6g3pOi5bwrW/W4jKmk+uzeO4Yi
 wdHl+4Px+Tj00+ZiA+UssMHJe9dYHkp6jP+49H5EteqrVm3sdiyUjWE/XbgLt/78z1CYt6dsn
 r9flY97J8VFLA3QU0GdCVbc5p8zNElUQ7cTYUGXhWZUw/PhNc/ZwTvckmSOchcPAsPaRDyDJK
 +1hdapddS50WEAEC/7ffC0u+JrdADj44/nYJRBqcVqOXSwrQ07KMHrlZfOjMXMK+ngZXGDp9C
 DJ6h24SetoSXR8yMbxL8491blF1qKIOW0CVNMNUZ329AFl4+URuuxxbte+N40l24UHzJpnpq0
 HymVyeimWkTAcCiHVNwxLwC7+8xBvX7ixwILTDg5tFWPL7zbyxAHgZb0oPORB7qgHGK8jhnhu
 1Xlzhdl/QPawq8qenmfCHkzKKPSEBXE+azWLruany/6n2ejBJCqstsnfS3uOMVvNRw+RYkF3n
 H3YyIdKcsxli692RD4Q0IKeH/8YQ0P84afQ2apczt9ATY6gY1tzNBU5kkViIJNQmSGgY+rEwb
 9kE6WFyXdv8fymf4ENEww6RjVdIymGFTY/bXzSk+9QBTlJIBTxFbDgDa2gqo29ew/dGJrkxir
 2e9GpPdnG9mqCaKUfR+x/Heuc07eWPYNLC7mKkBGUAyipmEahuz4RUYAkUlT/i2eEXuzrQ5UN
 eSB7nmY6bKrfNLRf90tF0m4mBVOWQTUxtiecXxpPcS0TfiU0k7Smtm5eAn6t0cXSRm8zBMmDV
 xNL/N/Llv+9hpT+cvia11n0ClrA5exzmv6Ds8DP9GofpaLoWaGa7ScVjACxttck83txB3KCPZ
 3NkaoLrXiBaYYetBXcf7YFkAXr5DG6fwg2CVFDLZsYB6XEvA/rdS5NH+zIxvszJU0/wFCfkz+
 n+YId85emeC2O/v3+CCp7VSO+dt4a0bgfQBq3eo56NfrBCCufvI9LSBdmulM=
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=sA2Mt5s3;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted
 sender) smtp.mailfrom=jan.kiszka@web.de
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

On 27.09.19 10:51, 'Lokesh Vutla' via Jailhouse wrote:
> When updating linux initrd size in inmate DT, the size is aligned
> to page. Because of this some initrd images were not able to mount
> by inmate as Linux is seeing junk at end of specified initrd.
> Pass the exact initrd size to the Linux kernel.
>
> Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
> ---
>   tools/jailhouse-cell-linux | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/jailhouse-cell-linux b/tools/jailhouse-cell-linux
> index 242761a3..e43f8e42 100755
> --- a/tools/jailhouse-cell-linux
> +++ b/tools/jailhouse-cell-linux
> @@ -317,7 +317,7 @@ class ARMCommon:
>
>           ramdisk_size = 0
>           if args.initrd:
> -            ramdisk_size = page_align(os.fstat(args.initrd.fileno()).st_size)
> +            ramdisk_size = os.fstat(args.initrd.fileno()).st_size
>               # leave sufficient space between the kernel and the initrd
>               decompression_factor = self.default_decompression_factor()
>               if args.kernel_decomp_factor:
>

Thanks, applied. I suspect I rounded this up because I did the same for the kernel.

Jan

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/1567e003-6e29-cba8-8bc7-9068fac1c6f0%40web.de.
