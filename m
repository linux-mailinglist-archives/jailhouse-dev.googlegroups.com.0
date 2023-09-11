Return-Path: <jailhouse-dev+bncBCPOLQPRTECBB37K7GTQMGQEQLLU6EQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pl1-x63a.google.com (mail-pl1-x63a.google.com [IPv6:2607:f8b0:4864:20::63a])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F31D79A11D
	for <lists+jailhouse-dev@lfdr.de>; Mon, 11 Sep 2023 04:03:30 +0200 (CEST)
Received: by mail-pl1-x63a.google.com with SMTP id d9443c01a7336-1bf4bd3c8d3sf10665445ad.1
        for <lists+jailhouse-dev@lfdr.de>; Sun, 10 Sep 2023 19:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1694397809; x=1695002609; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Tx0gQRZRi7eODPaJco0CLBa7QgCn9LORTi663ZDnlQ4=;
        b=dL08TVelxyeCkw3BaMtldTsfl+/Aw96Hu83XN0Om/NCJ1GkNWjiYjCKqreoYackfz2
         2YmFQRkuk0S9cGYYBdsbtsVgjbNrgGKJHGS5keBSWm7VxvtxaKACSyEEXdLFE3Yd6tWU
         o5HwjonPChaytuwsXK7m50SbN7uOlYVqgLNevTzMlcohjJG9sUKsQVq3zos/h7G2iBZo
         oxk72zLsxhiWOl/39QaFjP3txvxDSP27S/SxBN0A/Qh7H2DUr30S/6C2MziisMdJhzqp
         +ZNl+T+0k1h+dqkkgxPnz9ucc3Kcqbg6T6IF9qdGYtzsBsrs4qCER7ZRy4VgXnkIDifl
         kACw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694397809; x=1695002609; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tx0gQRZRi7eODPaJco0CLBa7QgCn9LORTi663ZDnlQ4=;
        b=AzIsKmWdkYXyni0BVBW0NI0zuvjUGWdfKgyAlo835SyrgnRovJvwD4+OeR0ruVGtL2
         UQz7qv2rximGLA/C1Gkf7LB7mWOeVPlV8EobE5x6xBICxB8v9IlSB4oB0H4hp3EJmkAS
         hALhQ/j5jFAAhq6gyXUBNMg82+1wyoh5cBqvUHD5ey4oaTM4jSbIaHvsecp6lPQ4W6oq
         JnGAJnWZWhfa/jEn6WDdWWWdzUECc4G/0TnBN0iFbQFKtA+7FhgRLjD4eDj0U08Vu9G9
         57HINaaYAf9SmiJnZLBtZUOHo9doN/cGul/rVL6uU9n4QaLe4wRs8377bfbvVNfsXaLy
         OyQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694397809; x=1695002609;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Tx0gQRZRi7eODPaJco0CLBa7QgCn9LORTi663ZDnlQ4=;
        b=SgrLm6rd7K5owKrsTsczhiXWGAkJnAKaWPaPuf2T+wH636HfXjx3rw3z7fqHXwBhBF
         W9LChRmlHTClh5aaAUYvLWcVK43Uoc6WMut80E4YMAgFDSEMoio2+xpXT2AVEYo1sxt7
         0YhazivCLwQi0kDb3oE2eN5vAxKAQZqG8WvQHdq6vop6ZlBLZn/cyAdJ1KccHUg1AKXY
         dj1KwC4slVx0GtZqzmFbwWMtTDt3Vf6E6J1S3kPoz9O0XktOwFERCdU/wZtydzYjOV0V
         AOLnPmFYp8462YHxHH91F9bc0M9cchZgepf/7H8tFrhVLAtIUnrHSNWnBKfJsRP8Xfim
         QDzA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0Yy12LXIctF0nWa/CtCRtEdd3f3EAi4amhxnb3SlY6UJ4vzq9iCr
	TcITyj2FzvZLIQqCT3k5rBs=
X-Google-Smtp-Source: AGHT+IGSUbAovW4MO3bgJE6hBvmuR5UwkYERyDaymR1zz8xLUIQg4JKDZffjXhxFUELA3JeS/REfKQ==
X-Received: by 2002:a05:6a20:4320:b0:137:4fd0:e2e6 with SMTP id h32-20020a056a20432000b001374fd0e2e6mr11760802pzk.6.1694397808645;
        Sun, 10 Sep 2023 19:03:28 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a62:7908:0:b0:68c:8bcb:634f with SMTP id u8-20020a627908000000b0068c8bcb634fls679891pfc.1.-pod-prod-03-us;
 Sun, 10 Sep 2023 19:03:27 -0700 (PDT)
X-Received: by 2002:a05:6a00:1a4a:b0:68a:5acb:272b with SMTP id h10-20020a056a001a4a00b0068a5acb272bmr3425085pfv.3.1694397806954;
        Sun, 10 Sep 2023 19:03:26 -0700 (PDT)
Date: Sun, 10 Sep 2023 19:03:25 -0700 (PDT)
From: bot crack <unintialized@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <a7c132e1-3700-49fc-b4ae-ca9557b1bf0en@googlegroups.com>
In-Reply-To: <91e5a78e-6f0b-4492-b023-f3a9c8d239f6@oth-regensburg.de>
References: <204a5f33-51e3-482a-95e5-14941c87154dn@googlegroups.com>
 <91e5a78e-6f0b-4492-b023-f3a9c8d239f6@oth-regensburg.de>
Subject: Re: The jailhouse system hangs when running on the 4*A55 board
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_16138_1427601346.1694397805713"
X-Original-Sender: unintialized@gmail.com
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

------=_Part_16138_1427601346.1694397805713
Content-Type: multipart/alternative; 
	boundary="----=_Part_16139_1155828466.1694397805713"

------=_Part_16139_1155828466.1694397805713
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you, this is a patch that can be used!

On Monday, September 4, 2023 at 7:02:07=E2=80=AFPM UTC+8 Ralf Ramsauer wrot=
e:

>
>
> On 04/09/2023 10:11, bot crack wrote:
> > The jailhouse system hangs when running on the 4*A55 board
> >=20
> > jailhouse-config-check:
> > /Reading configuration set:
> >   Architecture:  arm64
> >   Root cell:     RootCell (a55-main.cell)
> > Overlapping memory regions inside cell: None
> > Overlapping memory regions with hypervisor: None
> > Missing PCI MMCONFIG interceptions: None
> > Missing resource interceptions for architecture arm64: None/
> >=20
> > jailhouse Started output:/
> > Initializing Jailhouse hypervisor  on CPU 3
> > Code location: 0x0000ffffc0200800
> > Page pool usage after early setup: mem 39/992, remap 0/131072
> > Initializing processors:
> >  CPU 3... OK
> >  CPU 2... OK
> >  CPU 0... OK
> >  CPU 1... OK
> > Initializing unit: irqchip
> > Initializing unit: ARM SMMU v3
> > Initializing unit: ARM SMMU
> > Initializing unit: PVU IOMMU
> > Initializing unit: PCI
> > Adding virtual PCI device 00:00.0 to cell "RootCell"
> > Page pool usage after late setup: mem 64/992, remap 144/131072
> > Activating hypervisor/
> >=20
> >=20
> >=20
> >=20
> >=20
> > 1. When I run the weston (using openGL ES) program on Linux in the root=
=20
> > cell, it will cause a CPU to occupy 100%. I use ftrace to track the CPU=
=20
> > and display(See attachment for full output):
> > /# tracer: function_graph
> > #
> > # CPU  DURATION                  FUNCTION CALLS
> > # |     |   |                     |   |   |   |
> >  2)               |            _raw_spin_lock_irqsave() {
> >  2)   0.583 us    |              do_raw_spin_lock();
> >  2)   3.500 us    |            }
> >  2)               |            ktime_get_update_offsets_now() {
> >  2)   0.583 us    |              arch_counter_read();
> >  2)   1.750 us    |            }
> >  2)               |            __hrtimer_run_queues() {
> >  2)               |              _raw_spin_unlock_irqrestore() {
> >  2)   0.583 us    |                do_raw_spin_unlock();
> >  2)   1.750 us    |              }
> >  2)               |              tick_sched_timer() {
> >  2)               |                ktime_get() {
> >  2)   0.875 us    |                  arch_counter_read();
> >  2)   1.750 us    |                }
> >  2)               |                tick_sched_do_timer() {
> >  2)               |                  tick_do_update_jiffies64.part.0() =
{
> >  2)               |                    _raw_spin_lock() {
> >  2)   0.583 us    |                      do_raw_spin_lock();
> >  2)   1.750 us    |                    }
> >  2)               |                    do_timer() {
> >  2)   0.584 us    |                      calc_global_load();
> >  2)   1.750 us    |                    }
> >  2)               |                    _raw_spin_unlock() {
> >  2)   0.584 us    |                      do_raw_spin_unlock();
> >  2)   1.750 us    |                    }
> >  2)               |                    update_wall_time() {
> >  2)               |                      timekeeping_advance() {
> >  2)               |                        _raw_spin_lock_irqsave() {
> >  2)   0.584 us    |                          do_raw_spin_lock();
> >  2)   2.042 us    |                        }
> >  2)   0.584 us    |                        arch_counter_read();
> >  2)   0.583 us    |                        ntp_tick_length();
> >  2)   0.583 us    |                        ntp_tick_length();
> >  2)               |                        timekeeping_update() {
> >  2)   0.583 us    |                          ntp_get_next_leap();
> >  2)   0.875 us    |                          update_vsyscall();
> >  2)   0.583 us    |                          raw_notifier_call_chain();
> >  2)   4.375 us    |                        }
> >  2)               |                        _raw_spin_unlock_irqrestore(=
)=20
> {
> >  2)   0.583 us    |                          do_raw_spin_unlock();
> >  2)   1.750 us    |                        }
> >  2) + 14.000 us   |                      }
> >  2) + 15.166 us   |                    }
> >  2) + 23.334 us   |                  }
> >  2) + 24.500 us   |                }
> >  2)               |                update_process_times() {
> >  2)               |                  account_process_tick() {
> >  2)               |                    account_system_time() {
> >  2)               |                      account_system_index_time() {
> >  2)               |                        cpuacct_account_field() {
> >  2)   0.583 us    |                          __rcu_read_lock();
> >  2)   0.584 us    |                          __rcu_read_unlock();
> >  2)   3.208 us    |                        }
> >  2)   0.584 us    |                        __rcu_read_lock();
> >  2)   0.583 us    |                        __rcu_read_unlock();
> >  2)               |                        cpufreq_acct_update_power() =
{
> >  2)               |                          _raw_spin_lock_irqsave() {
> >  2)   0.584 us    |                            do_raw_spin_lock();
> >  2)   1.750 us    |                          }
> >  2)               |=20
> >  _raw_spin_unlock_irqrestore() {
> >  2)   0.583 us    |                            do_raw_spin_unlock();
> >  2)   1.750 us    |                          }
> >  2)   5.250 us    |                        }
> >  2) + 12.542 us   |                      }
> >  2) + 13.708 us   |                    }
> >  2) + 14.875 us   |                  }
> >  2)               |                  run_local_timers() {
> >  2)   0.584 us    |                    hrtimer_run_queues();
> >  2)   1.750 us    |                  }
> >  2)               |                  rcu_sched_clock_irq() {
> >  2)   0.875 us    |                    rcu_is_cpu_rrupt_from_idle();
> >  2)   0.584 us    |                    rcu_qs();
> >  2)   0.583 us    |                    rcu_is_cpu_rrupt_from_idle();
> >  2)   0.583 us    |                    rcu_segcblist_ready_cbs();
> >  2)   5.541 us    |                  }
> >  2)               |                  scheduler_tick() {
> >  2)               |                    _raw_spin_lock() {
> >  2)   0.584 us    |                      do_raw_spin_lock();
> >  2)   1.750 us    |                    }
> >  2)   0.584 us    |                    update_rq_clock();
> >  2)   0.875 us    |                    update_thermal_load_avg();
> >  2)               |                    task_tick_fair() {
> >  2)               |                      update_curr() {
> >  2)   0.583 us    |                        update_min_vruntime();
> >  2)               |                        cpuacct_charge() {
> >  2)   0.583 us    |                          __rcu_read_lock();
> >  2)   0.875 us    |                          __rcu_read_unlock();
> >  2)   4.083 us    |                        }
> >  2)   0.584 us    |                        __rcu_read_lock();
> >  2)   0.583 us    |                        __rcu_read_unlock();
> >  2)   9.041 us    |                      }
> >  2)   0.875 us    |                      __update_load_avg_se();
> >  2)               |                      __update_load_avg_cfs_rq() {
> >  2)   0.875 us    |                        __accumulate_pelt_segments()=
;
> >  2)   2.042 us    |                      }
> >  2)   0.584 us    |                      update_cfs_group();
> >  2)   0.583 us    |                      hrtimer_active();
> >  2) + 16.625 us   |                    }
> >  2)   0.583 us    |                    calc_global_load_tick();
> >  2)               |                    _raw_spin_unlock() {
> >  2)   0.875 us    |                      do_raw_spin_unlock();
> >  2)   2.042 us    |                    }
> >  2)               |                    trigger_load_balance() {
> >  2)   1.166 us    |                      nohz_balance_exit_idle();
> >  2)   0.583 us    |                      __rcu_read_lock();
> >  2)   0.583 us    |                      __rcu_read_unlock();
> >  2)   4.959 us    |                    }
> >  2) + 32.083 us   |                  }
> >  2)   0.584 us    |                  run_posix_cpu_timers();
> >  2) + 58.333 us   |                }
> >  2)   0.584 us    |                hrtimer_forward();
> >  2) + 88.375 us   |              }
> >  2)               |              _raw_spin_lock_irq() {
> >  2)   0.583 us    |                do_raw_spin_lock();
> >  2)   1.750 us    |              }
> >  2)   0.875 us    |              enqueue_hrtimer();
> >  2) + 95.666 us   |            }
> >  2)   0.875 us    |            __hrtimer_next_event_base();
> >  2)   0.875 us    |            __hrtimer_next_event_base();
> >  2)               |            _raw_spin_unlock_irqrestore() {
> >  2)   0.583 us    |              do_raw_spin_unlock();
> >  2)   1.750 us    |            }
> >  2)               |            tick_program_event() {
> >  2)               |              clockevents_program_event() {
> >  2)               |                ktime_get() {
> >  2)   0.583 us    |                  arch_counter_read();
> >  2)   1.750 us    |                }
> >  2)   0.875 us    |                arch_timer_set_next_event_phys();
> >  2)   4.084 us    |              }
> >  2)   5.250 us    |            }
> >  2) ! 114.333 us  |          } /* hrtimer_interrupt */
> >  2) ! 115.792 us  |        } /* arch_timer_handler_phys */
> >  2)   0.583 us    |        gic_eoimode1_eoi_irq();
> >  2) ! 118.125 us  |      } /* handle_percpu_devid_irq */
> >  2)               |      irq_exit() {
> >  2)   0.584 us    |        idle_cpu();
> >  2)   1.750 us    |      }
> >  2) ! 127.750 us  |    } /* __handle_domain_irq */
> >  2) ! 130.084 us  |  } /* gic_handle_irq */
> >  2)   <=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D |
> >  2)   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D> |
> >  2)               |  gic_handle_irq() {
> >  2)   0.583 us    |    gic_read_iar();
> >  2)               |    __handle_domain_irq() {
> >  2)               |      irq_find_mapping() {
> >  2)   0.584 us    |        __rcu_read_lock();
> >  2)   0.583 us    |        __rcu_read_unlock();
> >  2)   2.917 us    |      }
> >  2)               |      irq_enter() {
> >  2)   0.583 us    |        irq_enter_rcu();
> >  2)   1.750 us    |      }
> >  2)               |      handle_percpu_devid_irq() {
> >  2)               |        arch_timer_handler_phys() {
> >  2)               |          hrtimer_interrupt() {
> >  2)               |            _raw_spin_lock_irqsave() {
> >  2)   0.583 us    |              do_raw_spin_lock();
> >  2)   2.042 us    |            }
> >  2)               |            ktime_get_update_offsets_now() {
> >  2)   0.584 us    |              arch_counter_read();
> >  2)   2.042 us    |            }
> >  2)               |            __hrtimer_run_queues() {
> >  2)               |              _raw_spin_unlock_irqrestore() {
> >  2)   1.166 us    |                do_raw_spin_unlock();
> >  2)   2.042 us    |              }
> >  2)               |              tick_sched_timer() {
> >  2)               |                ktime_get() {
> >  2)   0.583 us    |                  arch_counter_read();
> >  2)   2.042 us    |                }
> >  2)               |                tick_sched_do_timer() {
> >  2)               |                  tick_do_update_jiffies64.part.0() =
{
> >  2)               |                    _raw_spin_lock() {
> >  2)   0.875 us    |                      do_raw_spin_lock();
> >  2)   1.750 us    |                    }
> >  2)               |                    do_timer() {
> >  2)   0.583 us    |                      calc_global_load();
> >  2)   2.333 us    |                    }
> >  2)               |                    _raw_spin_unlock() {
> >  2)   0.583 us    |                      do_raw_spin_unlock();
> >  2)   1.750 us    |                    }
> >  2)               |                    update_wall_time() {
> >  2)               |                      timekeeping_advance() {
> >  2)               |                        _raw_spin_lock_irqsave() {
> >  2)   0.583 us    |                          do_raw_spin_lock();
> >  2)   2.333 us    |                        }
> >  2)   0.584 us    |                        arch_counter_read();
> >  2)   0.583 us    |                        ntp_tick_length();
> >  2)   0.584 us    |                        ntp_tick_length();
> >  2)               |                        timekeeping_update() {
> >  2)   0.583 us    |                          ntp_get_next_leap();
> >  2)   0.875 us    |                          update_vsyscall();
> >  2)   0.583 us    |                          raw_notifier_call_chain();
> >  2)   4.375 us    |                        }
> >  2)               |                        _raw_spin_unlock_irqrestore(=
)=20
> {
> >  2)   0.875 us    |                          do_raw_spin_unlock();
> >  2)   1.750 us    |                        }
> >  2) + 14.875 us   |                      }
> >  2) + 16.042 us   |                    }
> >  2) + 24.792 us   |                  }
> >  2) + 25.959 us   |                }/
> >=20
> >=20
> >=20
> > 2. When I use cat /sys/kernel/debug/clk/clk_summary, the entire system=
=20
> > will hang without any output information.
> >=20
> >=20
> >=20
> > How should I debug these two problems?
>
> I have seen similar issues on a S32G board. It took me days to find out=
=20
> that we had unhandled SMCs. Return values were not checked in the=20
> kernel, the SMC was conducted, and miles later, the kernel hung up. Your=
=20
> bug has the smell that this could be the same issue. Would you please=20
> try the following patch to see if you have unhandled SMCs:
>
> diff --git a/hypervisor/arch/arm-common/smccc.c=20
> b/hypervisor/arch/arm-common/smccc.c
> index 65639b59..9b3af5b3 100644
> --- a/hypervisor/arch/arm-common/smccc.c
> +++ b/hypervisor/arch/arm-common/smccc.c
> @@ -136,6 +136,7 @@ enum trap_return handle_smc(struct trap_context *ctx)
> break;
>
> default:
> + printk("We have unhandled SMCs\n");
> ret =3D TRAP_UNHANDLED;
> }
>
>
>
> If you get reports of unhandled SMCs (Linux should handle this correctly=
=20
> by the way), you can, as a first workaround, simply allow to forward=20
> them with this patch:
>
>
> https://github.com/lfd/jailhouse/commit/3a88b0b371aeb649bc496d8c272b5d3ab=
5de3982
>
> Ralf
>
> >=20
> > --=20
> > You received this message because you are subscribed to the Google=20
> > Groups "Jailhouse" group.
> > To unsubscribe from this group and stop receiving emails from it, send=
=20
> > an email to jailhouse-de...@googlegroups.com=20
> > <mailto:jailhouse-de...@googlegroups.com>.
> > To view this discussion on the web visit=20
> >=20
> https://groups.google.com/d/msgid/jailhouse-dev/204a5f33-51e3-482a-95e5-1=
4941c87154dn%40googlegroups.com=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/204a5f33-51e3-482a-95e5-1=
4941c87154dn%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter
> >.
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/a7c132e1-3700-49fc-b4ae-ca9557b1bf0en%40googlegroups.com.

------=_Part_16139_1155828466.1694397805713
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

VGhhbmsgeW91LCB0aGlzIGlzIGEgcGF0Y2ggdGhhdCBjYW4gYmUgdXNlZCE8YnIgLz48YnIgLz48
ZGl2IGNsYXNzPSJnbWFpbF9xdW90ZSI+PGRpdiBkaXI9ImF1dG8iIGNsYXNzPSJnbWFpbF9hdHRy
Ij5PbiBNb25kYXksIFNlcHRlbWJlciA0LCAyMDIzIGF0IDc6MDI6MDfigK9QTSBVVEMrOCBSYWxm
IFJhbXNhdWVyIHdyb3RlOjxici8+PC9kaXY+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3Rl
IiBzdHlsZT0ibWFyZ2luOiAwIDAgMCAwLjhleDsgYm9yZGVyLWxlZnQ6IDFweCBzb2xpZCByZ2Io
MjA0LCAyMDQsIDIwNCk7IHBhZGRpbmctbGVmdDogMWV4OyI+DQo8YnI+DQo8YnI+T24gMDQvMDkv
MjAyMyAxMDoxMSwgYm90IGNyYWNrIHdyb3RlOg0KPGJyPiZndDsgVGhlIGphaWxob3VzZSBzeXN0
ZW0gaGFuZ3Mgd2hlbiBydW5uaW5nIG9uIHRoZSA0KkE1NSBib2FyZA0KPGJyPiZndDsgDQo8YnI+
Jmd0OyBqYWlsaG91c2UtY29uZmlnLWNoZWNrOg0KPGJyPiZndDsgL1JlYWRpbmcgY29uZmlndXJh
dGlvbiBzZXQ6DQo8YnI+Jmd0OyAgwqAgQXJjaGl0ZWN0dXJlOiDCoGFybTY0DQo8YnI+Jmd0OyAg
wqAgUm9vdCBjZWxsOiDCoCDCoCBSb290Q2VsbCAoYTU1LW1haW4uY2VsbCkNCjxicj4mZ3Q7IE92
ZXJsYXBwaW5nIG1lbW9yeSByZWdpb25zIGluc2lkZSBjZWxsOiBOb25lDQo8YnI+Jmd0OyBPdmVy
bGFwcGluZyBtZW1vcnkgcmVnaW9ucyB3aXRoIGh5cGVydmlzb3I6IE5vbmUNCjxicj4mZ3Q7IE1p
c3NpbmcgUENJIE1NQ09ORklHIGludGVyY2VwdGlvbnM6IE5vbmUNCjxicj4mZ3Q7IE1pc3Npbmcg
cmVzb3VyY2UgaW50ZXJjZXB0aW9ucyBmb3IgYXJjaGl0ZWN0dXJlIGFybTY0OiBOb25lLw0KPGJy
PiZndDsgDQo8YnI+Jmd0OyBqYWlsaG91c2UgU3RhcnRlZCBvdXRwdXQ6Lw0KPGJyPiZndDsgSW5p
dGlhbGl6aW5nIEphaWxob3VzZSBoeXBlcnZpc29yIMKgb24gQ1BVIDMNCjxicj4mZ3Q7IENvZGUg
bG9jYXRpb246IDB4MDAwMGZmZmZjMDIwMDgwMA0KPGJyPiZndDsgUGFnZSBwb29sIHVzYWdlIGFm
dGVyIGVhcmx5IHNldHVwOiBtZW0gMzkvOTkyLCByZW1hcCAwLzEzMTA3Mg0KPGJyPiZndDsgSW5p
dGlhbGl6aW5nIHByb2Nlc3NvcnM6DQo8YnI+Jmd0OyAgwqBDUFUgMy4uLiBPSw0KPGJyPiZndDsg
IMKgQ1BVIDIuLi4gT0sNCjxicj4mZ3Q7ICDCoENQVSAwLi4uIE9LDQo8YnI+Jmd0OyAgwqBDUFUg
MS4uLiBPSw0KPGJyPiZndDsgSW5pdGlhbGl6aW5nIHVuaXQ6IGlycWNoaXANCjxicj4mZ3Q7IElu
aXRpYWxpemluZyB1bml0OiBBUk0gU01NVSB2Mw0KPGJyPiZndDsgSW5pdGlhbGl6aW5nIHVuaXQ6
IEFSTSBTTU1VDQo8YnI+Jmd0OyBJbml0aWFsaXppbmcgdW5pdDogUFZVIElPTU1VDQo8YnI+Jmd0
OyBJbml0aWFsaXppbmcgdW5pdDogUENJDQo8YnI+Jmd0OyBBZGRpbmcgdmlydHVhbCBQQ0kgZGV2
aWNlIDAwOjAwLjAgdG8gY2VsbCAmcXVvdDtSb290Q2VsbCZxdW90Ow0KPGJyPiZndDsgUGFnZSBw
b29sIHVzYWdlIGFmdGVyIGxhdGUgc2V0dXA6IG1lbSA2NC85OTIsIHJlbWFwIDE0NC8xMzEwNzIN
Cjxicj4mZ3Q7IEFjdGl2YXRpbmcgaHlwZXJ2aXNvci8NCjxicj4mZ3Q7IA0KPGJyPiZndDsgDQo8
YnI+Jmd0OyANCjxicj4mZ3Q7IA0KPGJyPiZndDsgDQo8YnI+Jmd0OyAxLiBXaGVuIEkgcnVuIHRo
ZSB3ZXN0b24gKHVzaW5nIG9wZW5HTCBFUykgcHJvZ3JhbSBvbiBMaW51eCBpbiB0aGUgcm9vdCAN
Cjxicj4mZ3Q7IGNlbGwsIGl0IHdpbGwgY2F1c2UgYSBDUFUgdG8gb2NjdXB5IDEwMCUuIEkgdXNl
IGZ0cmFjZSB0byB0cmFjayB0aGUgQ1BVIA0KPGJyPiZndDsgYW5kIGRpc3BsYXkoU2VlIGF0dGFj
aG1lbnQgZm9yIGZ1bGwgb3V0cHV0KToNCjxicj4mZ3Q7IC8jIHRyYWNlcjogZnVuY3Rpb25fZ3Jh
cGgNCjxicj4mZ3Q7ICMNCjxicj4mZ3Q7ICMgQ1BVIMKgRFVSQVRJT04gwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBGVU5DVElPTiBDQUxMUw0KPGJyPiZndDsgIyB8IMKgIMKgIHwgwqAgfCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB8IMKgIHwgwqAgfCDCoCB8DQo8YnI+Jmd0OyAgwqAy
KSDCoCDCoCDCoCDCoCDCoCDCoCDCoCB8IMKgIMKgIMKgIMKgIMKgIMKgX3Jhd19zcGluX2xvY2tf
aXJxc2F2ZSgpIHsNCjxicj4mZ3Q7ICDCoDIpIMKgIDAuNTgzIHVzIMKgIMKgfCDCoCDCoCDCoCDC
oCDCoCDCoCDCoGRvX3Jhd19zcGluX2xvY2soKTsNCjxicj4mZ3Q7ICDCoDIpIMKgIDMuNTAwIHVz
IMKgIMKgfCDCoCDCoCDCoCDCoCDCoCDCoH0NCjxicj4mZ3Q7ICDCoDIpIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIHwgwqAgwqAgwqAgwqAgwqAgwqBrdGltZV9nZXRfdXBkYXRlX29mZnNldHNfbm93KCkg
ew0KPGJyPiZndDsgIMKgMikgwqAgMC41ODMgdXMgwqAgwqB8IMKgIMKgIMKgIMKgIMKgIMKgIMKg
YXJjaF9jb3VudGVyX3JlYWQoKTsNCjxicj4mZ3Q7ICDCoDIpIMKgIDEuNzUwIHVzIMKgIMKgfCDC
oCDCoCDCoCDCoCDCoCDCoH0NCjxicj4mZ3Q7ICDCoDIpIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHwg
wqAgwqAgwqAgwqAgwqAgwqBfX2hydGltZXJfcnVuX3F1ZXVlcygpIHsNCjxicj4mZ3Q7ICDCoDIp
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIHwgwqAgwqAgwqAgwqAgwqAgwqAgwqBfcmF3X3NwaW5fdW5s
b2NrX2lycXJlc3RvcmUoKSB7DQo8YnI+Jmd0OyAgwqAyKSDCoCAwLjU4MyB1cyDCoCDCoHwgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBkb19yYXdfc3Bpbl91bmxvY2soKTsNCjxicj4mZ3Q7ICDCoDIp
IMKgIDEuNzUwIHVzIMKgIMKgfCDCoCDCoCDCoCDCoCDCoCDCoCDCoH0NCjxicj4mZ3Q7ICDCoDIp
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIHwgwqAgwqAgwqAgwqAgwqAgwqAgwqB0aWNrX3NjaGVkX3Rp
bWVyKCkgew0KPGJyPiZndDsgIMKgMikgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoGt0aW1lX2dldCgpIHsNCjxicj4mZ3Q7ICDCoDIpIMKgIDAuODc1IHVzIMKg
IMKgfCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGFyY2hfY291bnRlcl9yZWFkKCk7DQo8YnI+
Jmd0OyAgwqAyKSDCoCAxLjc1MCB1cyDCoCDCoHwgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9DQo8
YnI+Jmd0OyAgwqAyKSDCoCDCoCDCoCDCoCDCoCDCoCDCoCB8IMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgdGlja19zY2hlZF9kb190aW1lcigpIHsNCjxicj4mZ3Q7ICDCoDIpIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIHwgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB0aWNrX2RvX3VwZGF0ZV9qaWZmaWVz
NjQucGFydC4wKCkgew0KPGJyPiZndDsgIMKgMikgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoF9yYXdfc3Bpbl9sb2NrKCkgew0KPGJyPiZndDsgIMKg
MikgwqAgMC41ODMgdXMgwqAgwqB8IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZG9f
cmF3X3NwaW5fbG9jaygpOw0KPGJyPiZndDsgIMKgMikgwqAgMS43NTAgdXMgwqAgwqB8IMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfQ0KPGJyPiZndDsgIMKgMikgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgfCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGRvX3RpbWVyKCkgew0KPGJyPiZn
dDsgIMKgMikgwqAgMC41ODQgdXMgwqAgwqB8IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgY2FsY19nbG9iYWxfbG9hZCgpOw0KPGJyPiZndDsgIMKgMikgwqAgMS43NTAgdXMgwqAgwqB8
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfQ0KPGJyPiZndDsgIMKgMikgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgfCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoF9yYXdfc3Bpbl91bmxv
Y2soKSB7DQo8YnI+Jmd0OyAgwqAyKSDCoCAwLjU4NCB1cyDCoCDCoHwgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBkb19yYXdfc3Bpbl91bmxvY2soKTsNCjxicj4mZ3Q7ICDCoDIpIMKg
IDEuNzUwIHVzIMKgIMKgfCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH0NCjxicj4mZ3Q7
ICDCoDIpIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHwgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqB1cGRhdGVfd2FsbF90aW1lKCkgew0KPGJyPiZndDsgIMKgMikgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgfCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHRpbWVrZWVwaW5nX2FkdmFuY2Uo
KSB7DQo8YnI+Jmd0OyAgwqAyKSDCoCDCoCDCoCDCoCDCoCDCoCDCoCB8IMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgX3Jhd19zcGluX2xvY2tfaXJxc2F2ZSgpIHsNCjxicj4mZ3Q7
ICDCoDIpIMKgIDAuNTg0IHVzIMKgIMKgfCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoGRvX3Jhd19zcGluX2xvY2soKTsNCjxicj4mZ3Q7ICDCoDIpIMKgIDIuMDQyIHVzIMKg
IMKgfCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH0NCjxicj4mZ3Q7ICDCoDIp
IMKgIDAuNTg0IHVzIMKgIMKgfCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGFy
Y2hfY291bnRlcl9yZWFkKCk7DQo8YnI+Jmd0OyAgwqAyKSDCoCAwLjU4MyB1cyDCoCDCoHwgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBudHBfdGlja19sZW5ndGgoKTsNCjxicj4m
Z3Q7ICDCoDIpIMKgIDAuNTgzIHVzIMKgIMKgfCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoG50cF90aWNrX2xlbmd0aCgpOw0KPGJyPiZndDsgIMKgMikgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgfCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHRpbWVrZWVwaW5nX3Vw
ZGF0ZSgpIHsNCjxicj4mZ3Q7ICDCoDIpIMKgIDAuNTgzIHVzIMKgIMKgfCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoG50cF9nZXRfbmV4dF9sZWFwKCk7DQo8YnI+Jmd0OyAg
wqAyKSDCoCAwLjg3NSB1cyDCoCDCoHwgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqB1cGRhdGVfdnN5c2NhbGwoKTsNCjxicj4mZ3Q7ICDCoDIpIMKgIDAuNTgzIHVzIMKgIMKg
fCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJhd19ub3RpZmllcl9jYWxs
X2NoYWluKCk7DQo8YnI+Jmd0OyAgwqAyKSDCoCA0LjM3NSB1cyDCoCDCoHwgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9DQo8YnI+Jmd0OyAgwqAyKSDCoCDCoCDCoCDCoCDCoCDC
oCDCoCB8IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgX3Jhd19zcGluX3VubG9j
a19pcnFyZXN0b3JlKCkgew0KPGJyPiZndDsgIMKgMikgwqAgMC41ODMgdXMgwqAgwqB8IMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZG9fcmF3X3NwaW5fdW5sb2NrKCk7DQo8
YnI+Jmd0OyAgwqAyKSDCoCAxLjc1MCB1cyDCoCDCoHwgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqB9DQo8YnI+Jmd0OyAgwqAyKSArIDE0LjAwMCB1cyDCoCB8IMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgfQ0KPGJyPiZndDsgIMKgMikgKyAxNS4xNjYgdXMgwqAgfCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH0NCjxicj4mZ3Q7ICDCoDIpICsgMjMuMzM0IHVz
IMKgIHwgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9DQo8YnI+Jmd0OyAgwqAyKSArIDI0LjUw
MCB1cyDCoCB8IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfQ0KPGJyPiZndDsgIMKgMikgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgfCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHVwZGF0ZV9wcm9jZXNzX3Rp
bWVzKCkgew0KPGJyPiZndDsgIMKgMikgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoGFjY291bnRfcHJvY2Vzc190aWNrKCkgew0KPGJyPiZndDsgIMKgMikg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgfCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGFjY291
bnRfc3lzdGVtX3RpbWUoKSB7DQo8YnI+Jmd0OyAgwqAyKSDCoCDCoCDCoCDCoCDCoCDCoCDCoCB8
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYWNjb3VudF9zeXN0ZW1faW5kZXhfdGlt
ZSgpIHsNCjxicj4mZ3Q7ICDCoDIpIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHwgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjcHVhY2N0X2FjY291bnRfZmllbGQoKSB7DQo8YnI+Jmd0
OyAgwqAyKSDCoCAwLjU4MyB1cyDCoCDCoHwgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqBfX3JjdV9yZWFkX2xvY2soKTsNCjxicj4mZ3Q7ICDCoDIpIMKgIDAuNTg0IHVzIMKg
IMKgfCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoF9fcmN1X3JlYWRfdW5s
b2NrKCk7DQo8YnI+Jmd0OyAgwqAyKSDCoCAzLjIwOCB1cyDCoCDCoHwgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqB9DQo8YnI+Jmd0OyAgwqAyKSDCoCAwLjU4NCB1cyDCoCDCoHwg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBfX3JjdV9yZWFkX2xvY2soKTsNCjxi
cj4mZ3Q7ICDCoDIpIMKgIDAuNTgzIHVzIMKgIMKgfCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoF9fcmN1X3JlYWRfdW5sb2NrKCk7DQo8YnI+Jmd0OyAgwqAyKSDCoCDCoCDCoCDC
oCDCoCDCoCDCoCB8IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY3B1ZnJlcV9h
Y2N0X3VwZGF0ZV9wb3dlcigpIHsNCjxicj4mZ3Q7ICDCoDIpIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IHwgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBfcmF3X3NwaW5fbG9ja19p
cnFzYXZlKCkgew0KPGJyPiZndDsgIMKgMikgwqAgMC41ODQgdXMgwqAgwqB8IMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZG9fcmF3X3NwaW5fbG9jaygpOw0KPGJyPiZn
dDsgIMKgMikgwqAgMS43NTAgdXMgwqAgwqB8IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgfQ0KPGJyPiZndDsgIMKgMikgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfCAgICAgICAg
ICAgICAgICAgICAgICAgICANCjxicj4mZ3Q7ICDCoF9yYXdfc3Bpbl91bmxvY2tfaXJxcmVzdG9y
ZSgpIHsNCjxicj4mZ3Q7ICDCoDIpIMKgIDAuNTgzIHVzIMKgIMKgfCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGRvX3Jhd19zcGluX3VubG9jaygpOw0KPGJyPiZndDsg
IMKgMikgwqAgMS43NTAgdXMgwqAgwqB8IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgfQ0KPGJyPiZndDsgIMKgMikgwqAgNS4yNTAgdXMgwqAgwqB8IMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgfQ0KPGJyPiZndDsgIMKgMikgKyAxMi41NDIgdXMgwqAgfCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH0NCjxicj4mZ3Q7ICDCoDIpICsgMTMuNzA4
IHVzIMKgIHwgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9DQo8YnI+Jmd0OyAgwqAyKSAr
IDE0Ljg3NSB1cyDCoCB8IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfQ0KPGJyPiZndDsgIMKg
MikgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJ1bl9s
b2NhbF90aW1lcnMoKSB7DQo8YnI+Jmd0OyAgwqAyKSDCoCAwLjU4NCB1cyDCoCDCoHwgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBocnRpbWVyX3J1bl9xdWV1ZXMoKTsNCjxicj4mZ3Q7ICDC
oDIpIMKgIDEuNzUwIHVzIMKgIMKgfCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH0NCjxicj4m
Z3Q7ICDCoDIpIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHwgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqByY3Vfc2NoZWRfY2xvY2tfaXJxKCkgew0KPGJyPiZndDsgIMKgMikgwqAgMC44NzUgdXMgwqAg
wqB8IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmN1X2lzX2NwdV9ycnVwdF9mcm9tX2lk
bGUoKTsNCjxicj4mZ3Q7ICDCoDIpIMKgIDAuNTg0IHVzIMKgIMKgfCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoHJjdV9xcygpOw0KPGJyPiZndDsgIMKgMikgwqAgMC41ODMgdXMgwqAgwqB8
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmN1X2lzX2NwdV9ycnVwdF9mcm9tX2lkbGUo
KTsNCjxicj4mZ3Q7ICDCoDIpIMKgIDAuNTgzIHVzIMKgIMKgfCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoHJjdV9zZWdjYmxpc3RfcmVhZHlfY2JzKCk7DQo8YnI+Jmd0OyAgwqAyKSDCoCA1
LjU0MSB1cyDCoCDCoHwgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9DQo8YnI+Jmd0OyAgwqAy
KSDCoCDCoCDCoCDCoCDCoCDCoCDCoCB8IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc2NoZWR1
bGVyX3RpY2soKSB7DQo8YnI+Jmd0OyAgwqAyKSDCoCDCoCDCoCDCoCDCoCDCoCDCoCB8IMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgX3Jhd19zcGluX2xvY2soKSB7DQo8YnI+Jmd0OyAgwqAy
KSDCoCAwLjU4NCB1cyDCoCDCoHwgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBkb19y
YXdfc3Bpbl9sb2NrKCk7DQo8YnI+Jmd0OyAgwqAyKSDCoCAxLjc1MCB1cyDCoCDCoHwgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9DQo8YnI+Jmd0OyAgwqAyKSDCoCAwLjU4NCB1cyDCoCDC
oHwgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB1cGRhdGVfcnFfY2xvY2soKTsNCjxicj4m
Z3Q7ICDCoDIpIMKgIDAuODc1IHVzIMKgIMKgfCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oHVwZGF0ZV90aGVybWFsX2xvYWRfYXZnKCk7DQo8YnI+Jmd0OyAgwqAyKSDCoCDCoCDCoCDCoCDC
oCDCoCDCoCB8IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgdGFza190aWNrX2ZhaXIoKSB7
DQo8YnI+Jmd0OyAgwqAyKSDCoCDCoCDCoCDCoCDCoCDCoCDCoCB8IMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgdXBkYXRlX2N1cnIoKSB7DQo8YnI+Jmd0OyAgwqAyKSDCoCAwLjU4MyB1
cyDCoCDCoHwgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB1cGRhdGVfbWluX3Zy
dW50aW1lKCk7DQo8YnI+Jmd0OyAgwqAyKSDCoCDCoCDCoCDCoCDCoCDCoCDCoCB8IMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY3B1YWNjdF9jaGFyZ2UoKSB7DQo8YnI+Jmd0OyAg
wqAyKSDCoCAwLjU4MyB1cyDCoCDCoHwgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqBfX3JjdV9yZWFkX2xvY2soKTsNCjxicj4mZ3Q7ICDCoDIpIMKgIDAuODc1IHVzIMKgIMKg
fCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoF9fcmN1X3JlYWRfdW5sb2Nr
KCk7DQo8YnI+Jmd0OyAgwqAyKSDCoCA0LjA4MyB1cyDCoCDCoHwgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqB9DQo8YnI+Jmd0OyAgwqAyKSDCoCAwLjU4NCB1cyDCoCDCoHwgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBfX3JjdV9yZWFkX2xvY2soKTsNCjxicj4m
Z3Q7ICDCoDIpIMKgIDAuNTgzIHVzIMKgIMKgfCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoF9fcmN1X3JlYWRfdW5sb2NrKCk7DQo8YnI+Jmd0OyAgwqAyKSDCoCA5LjA0MSB1cyDC
oCDCoHwgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9DQo8YnI+Jmd0OyAgwqAyKSDC
oCAwLjg3NSB1cyDCoCDCoHwgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBfX3VwZGF0
ZV9sb2FkX2F2Z19zZSgpOw0KPGJyPiZndDsgIMKgMikgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoF9fdXBkYXRlX2xvYWRfYXZnX2Nmc19ycSgp
IHsNCjxicj4mZ3Q7ICDCoDIpIMKgIDAuODc1IHVzIMKgIMKgfCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoF9fYWNjdW11bGF0ZV9wZWx0X3NlZ21lbnRzKCk7DQo8YnI+Jmd0OyAg
wqAyKSDCoCAyLjA0MiB1cyDCoCDCoHwgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9
DQo8YnI+Jmd0OyAgwqAyKSDCoCAwLjU4NCB1cyDCoCDCoHwgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqB1cGRhdGVfY2ZzX2dyb3VwKCk7DQo8YnI+Jmd0OyAgwqAyKSDCoCAwLjU4MyB1
cyDCoCDCoHwgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBocnRpbWVyX2FjdGl2ZSgp
Ow0KPGJyPiZndDsgIMKgMikgKyAxNi42MjUgdXMgwqAgfCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoH0NCjxicj4mZ3Q7ICDCoDIpIMKgIDAuNTgzIHVzIMKgIMKgfCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoGNhbGNfZ2xvYmFsX2xvYWRfdGljaygpOw0KPGJyPiZndDsgIMKgMikg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgfCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoF9yYXdf
c3Bpbl91bmxvY2soKSB7DQo8YnI+Jmd0OyAgwqAyKSDCoCAwLjg3NSB1cyDCoCDCoHwgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBkb19yYXdfc3Bpbl91bmxvY2soKTsNCjxicj4mZ3Q7
ICDCoDIpIMKgIDIuMDQyIHVzIMKgIMKgfCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH0N
Cjxicj4mZ3Q7ICDCoDIpIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHwgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqB0cmlnZ2VyX2xvYWRfYmFsYW5jZSgpIHsNCjxicj4mZ3Q7ICDCoDIpIMKgIDEu
MTY2IHVzIMKgIMKgfCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoG5vaHpfYmFsYW5j
ZV9leGl0X2lkbGUoKTsNCjxicj4mZ3Q7ICDCoDIpIMKgIDAuNTgzIHVzIMKgIMKgfCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoF9fcmN1X3JlYWRfbG9jaygpOw0KPGJyPiZndDsgIMKg
MikgwqAgMC41ODMgdXMgwqAgwqB8IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgX19y
Y3VfcmVhZF91bmxvY2soKTsNCjxicj4mZ3Q7ICDCoDIpIMKgIDQuOTU5IHVzIMKgIMKgfCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH0NCjxicj4mZ3Q7ICDCoDIpICsgMzIuMDgzIHVzIMKg
IHwgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9DQo8YnI+Jmd0OyAgwqAyKSDCoCAwLjU4NCB1
cyDCoCDCoHwgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBydW5fcG9zaXhfY3B1X3RpbWVycygp
Ow0KPGJyPiZndDsgIMKgMikgKyA1OC4zMzMgdXMgwqAgfCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oH0NCjxicj4mZ3Q7ICDCoDIpIMKgIDAuNTg0IHVzIMKgIMKgfCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoGhydGltZXJfZm9yd2FyZCgpOw0KPGJyPiZndDsgIMKgMikgKyA4OC4zNzUgdXMgwqAgfCDC
oCDCoCDCoCDCoCDCoCDCoCDCoH0NCjxicj4mZ3Q7ICDCoDIpIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IHwgwqAgwqAgwqAgwqAgwqAgwqAgwqBfcmF3X3NwaW5fbG9ja19pcnEoKSB7DQo8YnI+Jmd0OyAg
wqAyKSDCoCAwLjU4MyB1cyDCoCDCoHwgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBkb19yYXdfc3Bp
bl9sb2NrKCk7DQo8YnI+Jmd0OyAgwqAyKSDCoCAxLjc1MCB1cyDCoCDCoHwgwqAgwqAgwqAgwqAg
wqAgwqAgwqB9DQo8YnI+Jmd0OyAgwqAyKSDCoCAwLjg3NSB1cyDCoCDCoHwgwqAgwqAgwqAgwqAg
wqAgwqAgwqBlbnF1ZXVlX2hydGltZXIoKTsNCjxicj4mZ3Q7ICDCoDIpICsgOTUuNjY2IHVzIMKg
IHwgwqAgwqAgwqAgwqAgwqAgwqB9DQo8YnI+Jmd0OyAgwqAyKSDCoCAwLjg3NSB1cyDCoCDCoHwg
wqAgwqAgwqAgwqAgwqAgwqBfX2hydGltZXJfbmV4dF9ldmVudF9iYXNlKCk7DQo8YnI+Jmd0OyAg
wqAyKSDCoCAwLjg3NSB1cyDCoCDCoHwgwqAgwqAgwqAgwqAgwqAgwqBfX2hydGltZXJfbmV4dF9l
dmVudF9iYXNlKCk7DQo8YnI+Jmd0OyAgwqAyKSDCoCDCoCDCoCDCoCDCoCDCoCDCoCB8IMKgIMKg
IMKgIMKgIMKgIMKgX3Jhd19zcGluX3VubG9ja19pcnFyZXN0b3JlKCkgew0KPGJyPiZndDsgIMKg
MikgwqAgMC41ODMgdXMgwqAgwqB8IMKgIMKgIMKgIMKgIMKgIMKgIMKgZG9fcmF3X3NwaW5fdW5s
b2NrKCk7DQo8YnI+Jmd0OyAgwqAyKSDCoCAxLjc1MCB1cyDCoCDCoHwgwqAgwqAgwqAgwqAgwqAg
wqB9DQo8YnI+Jmd0OyAgwqAyKSDCoCDCoCDCoCDCoCDCoCDCoCDCoCB8IMKgIMKgIMKgIMKgIMKg
IMKgdGlja19wcm9ncmFtX2V2ZW50KCkgew0KPGJyPiZndDsgIMKgMikgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgfCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNsb2NrZXZlbnRzX3Byb2dyYW1fZXZlbnQoKSB7
DQo8YnI+Jmd0OyAgwqAyKSDCoCDCoCDCoCDCoCDCoCDCoCDCoCB8IMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKga3RpbWVfZ2V0KCkgew0KPGJyPiZndDsgIMKgMikgwqAgMC41ODMgdXMgwqAgwqB8IMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYXJjaF9jb3VudGVyX3JlYWQoKTsNCjxicj4mZ3Q7ICDC
oDIpIMKgIDEuNzUwIHVzIMKgIMKgfCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH0NCjxicj4mZ3Q7
ICDCoDIpIMKgIDAuODc1IHVzIMKgIMKgfCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGFyY2hfdGlt
ZXJfc2V0X25leHRfZXZlbnRfcGh5cygpOw0KPGJyPiZndDsgIMKgMikgwqAgNC4wODQgdXMgwqAg
wqB8IMKgIMKgIMKgIMKgIMKgIMKgIMKgfQ0KPGJyPiZndDsgIMKgMikgwqAgNS4yNTAgdXMgwqAg
wqB8IMKgIMKgIMKgIMKgIMKgIMKgfQ0KPGJyPiZndDsgIMKgMikgISAxMTQuMzMzIHVzIMKgfCDC
oCDCoCDCoCDCoCDCoH0gLyogaHJ0aW1lcl9pbnRlcnJ1cHQgKi8NCjxicj4mZ3Q7ICDCoDIpICEg
MTE1Ljc5MiB1cyDCoHwgwqAgwqAgwqAgwqB9IC8qIGFyY2hfdGltZXJfaGFuZGxlcl9waHlzICov
DQo8YnI+Jmd0OyAgwqAyKSDCoCAwLjU4MyB1cyDCoCDCoHwgwqAgwqAgwqAgwqBnaWNfZW9pbW9k
ZTFfZW9pX2lycSgpOw0KPGJyPiZndDsgIMKgMikgISAxMTguMTI1IHVzIMKgfCDCoCDCoCDCoH0g
LyogaGFuZGxlX3BlcmNwdV9kZXZpZF9pcnEgKi8NCjxicj4mZ3Q7ICDCoDIpIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIHwgwqAgwqAgwqBpcnFfZXhpdCgpIHsNCjxicj4mZ3Q7ICDCoDIpIMKgIDAuNTg0
IHVzIMKgIMKgfCDCoCDCoCDCoCDCoGlkbGVfY3B1KCk7DQo8YnI+Jmd0OyAgwqAyKSDCoCAxLjc1
MCB1cyDCoCDCoHwgwqAgwqAgwqB9DQo8YnI+Jmd0OyAgwqAyKSAhIDEyNy43NTAgdXMgwqB8IMKg
IMKgfSAvKiBfX2hhbmRsZV9kb21haW5faXJxICovDQo8YnI+Jmd0OyAgwqAyKSAhIDEzMC4wODQg
dXMgwqB8IMKgfSAvKiBnaWNfaGFuZGxlX2lycSAqLw0KPGJyPiZndDsgIMKgMikgwqAgJmx0Oz09
PT09PT09PT0gfA0KPGJyPiZndDsgIMKgMikgwqAgPT09PT09PT09PSZndDsgfA0KPGJyPiZndDsg
IMKgMikgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfCDCoGdpY19oYW5kbGVfaXJxKCkgew0KPGJyPiZn
dDsgIMKgMikgwqAgMC41ODMgdXMgwqAgwqB8IMKgIMKgZ2ljX3JlYWRfaWFyKCk7DQo8YnI+Jmd0
OyAgwqAyKSDCoCDCoCDCoCDCoCDCoCDCoCDCoCB8IMKgIMKgX19oYW5kbGVfZG9tYWluX2lycSgp
IHsNCjxicj4mZ3Q7ICDCoDIpIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHwgwqAgwqAgwqBpcnFfZmlu
ZF9tYXBwaW5nKCkgew0KPGJyPiZndDsgIMKgMikgwqAgMC41ODQgdXMgwqAgwqB8IMKgIMKgIMKg
IMKgX19yY3VfcmVhZF9sb2NrKCk7DQo8YnI+Jmd0OyAgwqAyKSDCoCAwLjU4MyB1cyDCoCDCoHwg
wqAgwqAgwqAgwqBfX3JjdV9yZWFkX3VubG9jaygpOw0KPGJyPiZndDsgIMKgMikgwqAgMi45MTcg
dXMgwqAgwqB8IMKgIMKgIMKgfQ0KPGJyPiZndDsgIMKgMikgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
fCDCoCDCoCDCoGlycV9lbnRlcigpIHsNCjxicj4mZ3Q7ICDCoDIpIMKgIDAuNTgzIHVzIMKgIMKg
fCDCoCDCoCDCoCDCoGlycV9lbnRlcl9yY3UoKTsNCjxicj4mZ3Q7ICDCoDIpIMKgIDEuNzUwIHVz
IMKgIMKgfCDCoCDCoCDCoH0NCjxicj4mZ3Q7ICDCoDIpIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHwg
wqAgwqAgwqBoYW5kbGVfcGVyY3B1X2RldmlkX2lycSgpIHsNCjxicj4mZ3Q7ICDCoDIpIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIHwgwqAgwqAgwqAgwqBhcmNoX3RpbWVyX2hhbmRsZXJfcGh5cygpIHsN
Cjxicj4mZ3Q7ICDCoDIpIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHwgwqAgwqAgwqAgwqAgwqBocnRp
bWVyX2ludGVycnVwdCgpIHsNCjxicj4mZ3Q7ICDCoDIpIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHwg
wqAgwqAgwqAgwqAgwqAgwqBfcmF3X3NwaW5fbG9ja19pcnFzYXZlKCkgew0KPGJyPiZndDsgIMKg
MikgwqAgMC41ODMgdXMgwqAgwqB8IMKgIMKgIMKgIMKgIMKgIMKgIMKgZG9fcmF3X3NwaW5fbG9j
aygpOw0KPGJyPiZndDsgIMKgMikgwqAgMi4wNDIgdXMgwqAgwqB8IMKgIMKgIMKgIMKgIMKgIMKg
fQ0KPGJyPiZndDsgIMKgMikgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfCDCoCDCoCDCoCDCoCDCoCDC
oGt0aW1lX2dldF91cGRhdGVfb2Zmc2V0c19ub3coKSB7DQo8YnI+Jmd0OyAgwqAyKSDCoCAwLjU4
NCB1cyDCoCDCoHwgwqAgwqAgwqAgwqAgwqAgwqAgwqBhcmNoX2NvdW50ZXJfcmVhZCgpOw0KPGJy
PiZndDsgIMKgMikgwqAgMi4wNDIgdXMgwqAgwqB8IMKgIMKgIMKgIMKgIMKgIMKgfQ0KPGJyPiZn
dDsgIMKgMikgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfCDCoCDCoCDCoCDCoCDCoCDCoF9faHJ0aW1l
cl9ydW5fcXVldWVzKCkgew0KPGJyPiZndDsgIMKgMikgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfCDC
oCDCoCDCoCDCoCDCoCDCoCDCoF9yYXdfc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgpIHsNCjxicj4m
Z3Q7ICDCoDIpIMKgIDEuMTY2IHVzIMKgIMKgfCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGRvX3Jh
d19zcGluX3VubG9jaygpOw0KPGJyPiZndDsgIMKgMikgwqAgMi4wNDIgdXMgwqAgwqB8IMKgIMKg
IMKgIMKgIMKgIMKgIMKgfQ0KPGJyPiZndDsgIMKgMikgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfCDC
oCDCoCDCoCDCoCDCoCDCoCDCoHRpY2tfc2NoZWRfdGltZXIoKSB7DQo8YnI+Jmd0OyAgwqAyKSDC
oCDCoCDCoCDCoCDCoCDCoCDCoCB8IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKga3RpbWVfZ2V0KCkg
ew0KPGJyPiZndDsgIMKgMikgwqAgMC41ODMgdXMgwqAgwqB8IMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgYXJjaF9jb3VudGVyX3JlYWQoKTsNCjxicj4mZ3Q7ICDCoDIpIMKgIDIuMDQyIHVzIMKg
IMKgfCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH0NCjxicj4mZ3Q7ICDCoDIpIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIHwgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB0aWNrX3NjaGVkX2RvX3RpbWVyKCkg
ew0KPGJyPiZndDsgIMKgMikgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoHRpY2tfZG9fdXBkYXRlX2ppZmZpZXM2NC5wYXJ0LjAoKSB7DQo8YnI+Jmd0OyAg
wqAyKSDCoCDCoCDCoCDCoCDCoCDCoCDCoCB8IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
X3Jhd19zcGluX2xvY2soKSB7DQo8YnI+Jmd0OyAgwqAyKSDCoCAwLjg3NSB1cyDCoCDCoHwgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBkb19yYXdfc3Bpbl9sb2NrKCk7DQo8YnI+Jmd0
OyAgwqAyKSDCoCAxLjc1MCB1cyDCoCDCoHwgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9
DQo8YnI+Jmd0OyAgwqAyKSDCoCDCoCDCoCDCoCDCoCDCoCDCoCB8IMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgZG9fdGltZXIoKSB7DQo8YnI+Jmd0OyAgwqAyKSDCoCAwLjU4MyB1cyDCoCDC
oHwgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjYWxjX2dsb2JhbF9sb2FkKCk7DQo8
YnI+Jmd0OyAgwqAyKSDCoCAyLjMzMyB1cyDCoCDCoHwgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqB9DQo8YnI+Jmd0OyAgwqAyKSDCoCDCoCDCoCDCoCDCoCDCoCDCoCB8IMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgX3Jhd19zcGluX3VubG9jaygpIHsNCjxicj4mZ3Q7ICDCoDIpIMKg
IDAuNTgzIHVzIMKgIMKgfCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGRvX3Jhd19z
cGluX3VubG9jaygpOw0KPGJyPiZndDsgIMKgMikgwqAgMS43NTAgdXMgwqAgwqB8IMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgfQ0KPGJyPiZndDsgIMKgMikgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgfCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHVwZGF0ZV93YWxsX3RpbWUoKSB7DQo8
YnI+Jmd0OyAgwqAyKSDCoCDCoCDCoCDCoCDCoCDCoCDCoCB8IMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgdGltZWtlZXBpbmdfYWR2YW5jZSgpIHsNCjxicj4mZ3Q7ICDCoDIpIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIHwgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBfcmF3
X3NwaW5fbG9ja19pcnFzYXZlKCkgew0KPGJyPiZndDsgIMKgMikgwqAgMC41ODMgdXMgwqAgwqB8
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZG9fcmF3X3NwaW5fbG9jaygp
Ow0KPGJyPiZndDsgIMKgMikgwqAgMi4zMzMgdXMgwqAgwqB8IMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgfQ0KPGJyPiZndDsgIMKgMikgwqAgMC41ODQgdXMgwqAgwqB8IMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYXJjaF9jb3VudGVyX3JlYWQoKTsNCjxicj4m
Z3Q7ICDCoDIpIMKgIDAuNTgzIHVzIMKgIMKgfCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoG50cF90aWNrX2xlbmd0aCgpOw0KPGJyPiZndDsgIMKgMikgwqAgMC41ODQgdXMgwqAg
wqB8IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgbnRwX3RpY2tfbGVuZ3RoKCk7
DQo8YnI+Jmd0OyAgwqAyKSDCoCDCoCDCoCDCoCDCoCDCoCDCoCB8IMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgdGltZWtlZXBpbmdfdXBkYXRlKCkgew0KPGJyPiZndDsgIMKgMikg
wqAgMC41ODMgdXMgwqAgwqB8IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
bnRwX2dldF9uZXh0X2xlYXAoKTsNCjxicj4mZ3Q7ICDCoDIpIMKgIDAuODc1IHVzIMKgIMKgfCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHVwZGF0ZV92c3lzY2FsbCgpOw0K
PGJyPiZndDsgIMKgMikgwqAgMC41ODMgdXMgwqAgwqB8IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgcmF3X25vdGlmaWVyX2NhbGxfY2hhaW4oKTsNCjxicj4mZ3Q7ICDCoDIp
IMKgIDQuMzc1IHVzIMKgIMKgfCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH0N
Cjxicj4mZ3Q7ICDCoDIpIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHwgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBfcmF3X3NwaW5fdW5sb2NrX2lycXJlc3RvcmUoKSB7DQo8YnI+Jmd0
OyAgwqAyKSDCoCAwLjg3NSB1cyDCoCDCoHwgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqBkb19yYXdfc3Bpbl91bmxvY2soKTsNCjxicj4mZ3Q7ICDCoDIpIMKgIDEuNzUwIHVz
IMKgIMKgfCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH0NCjxicj4mZ3Q7ICDC
oDIpICsgMTQuODc1IHVzIMKgIHwgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9DQo8
YnI+Jmd0OyAgwqAyKSArIDE2LjA0MiB1cyDCoCB8IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgfQ0KPGJyPiZndDsgIMKgMikgKyAyNC43OTIgdXMgwqAgfCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoH0NCjxicj4mZ3Q7ICDCoDIpICsgMjUuOTU5IHVzIMKgIHwgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqB9Lw0KPGJyPiZndDsgDQo8YnI+Jmd0OyANCjxicj4mZ3Q7IA0KPGJyPiZndDsgMi4g
V2hlbiBJIHVzZSBjYXQgL3N5cy9rZXJuZWwvZGVidWcvY2xrL2Nsa19zdW1tYXJ5LCB0aGUgZW50
aXJlIHN5c3RlbSANCjxicj4mZ3Q7IHdpbGwgaGFuZyB3aXRob3V0IGFueSBvdXRwdXQgaW5mb3Jt
YXRpb24uDQo8YnI+Jmd0OyANCjxicj4mZ3Q7IA0KPGJyPiZndDsgDQo8YnI+Jmd0OyBIb3cgc2hv
dWxkIEkgZGVidWcgdGhlc2UgdHdvIHByb2JsZW1zPw0KPGJyPg0KPGJyPkkgaGF2ZSBzZWVuIHNp
bWlsYXIgaXNzdWVzIG9uIGEgUzMyRyBib2FyZC4gSXQgdG9vayBtZSBkYXlzIHRvIGZpbmQgb3V0
IA0KPGJyPnRoYXQgd2UgaGFkIHVuaGFuZGxlZCBTTUNzLiBSZXR1cm4gdmFsdWVzIHdlcmUgbm90
IGNoZWNrZWQgaW4gdGhlIA0KPGJyPmtlcm5lbCwgdGhlIFNNQyB3YXMgY29uZHVjdGVkLCBhbmQg
bWlsZXMgbGF0ZXIsIHRoZSBrZXJuZWwgaHVuZyB1cC4gWW91ciANCjxicj5idWcgaGFzIHRoZSBz
bWVsbCB0aGF0IHRoaXMgY291bGQgYmUgdGhlIHNhbWUgaXNzdWUuIFdvdWxkIHlvdSBwbGVhc2Ug
DQo8YnI+dHJ5IHRoZSBmb2xsb3dpbmcgcGF0Y2ggdG8gc2VlIGlmIHlvdSBoYXZlIHVuaGFuZGxl
ZCBTTUNzOg0KPGJyPg0KPGJyPmRpZmYgLS1naXQgYS9oeXBlcnZpc29yL2FyY2gvYXJtLWNvbW1v
bi9zbWNjYy5jIA0KPGJyPmIvaHlwZXJ2aXNvci9hcmNoL2FybS1jb21tb24vc21jY2MuYw0KPGJy
PmluZGV4IDY1NjM5YjU5Li45YjNhZjViMyAxMDA2NDQNCjxicj4tLS0gYS9oeXBlcnZpc29yL2Fy
Y2gvYXJtLWNvbW1vbi9zbWNjYy5jDQo8YnI+KysrIGIvaHlwZXJ2aXNvci9hcmNoL2FybS1jb21t
b24vc21jY2MuYw0KPGJyPkBAIC0xMzYsNiArMTM2LDcgQEAgZW51bSB0cmFwX3JldHVybiBoYW5k
bGVfc21jKHN0cnVjdCB0cmFwX2NvbnRleHQgKmN0eCkNCjxicj4gICAgICAgICAgICAgICAgIGJy
ZWFrOw0KPGJyPg0KPGJyPiAgICAgICAgIGRlZmF1bHQ6DQo8YnI+KyAgICAgICAgICAgICAgIHBy
aW50aygmcXVvdDtXZSBoYXZlIHVuaGFuZGxlZCBTTUNzXG4mcXVvdDspOw0KPGJyPiAgICAgICAg
ICAgICAgICAgcmV0ID0gVFJBUF9VTkhBTkRMRUQ7DQo8YnI+ICAgICAgICAgfQ0KPGJyPg0KPGJy
Pg0KPGJyPg0KPGJyPklmIHlvdSBnZXQgcmVwb3J0cyBvZiB1bmhhbmRsZWQgU01DcyAoTGludXgg
c2hvdWxkIGhhbmRsZSB0aGlzIGNvcnJlY3RseSANCjxicj5ieSB0aGUgd2F5KSwgeW91IGNhbiwg
YXMgYSBmaXJzdCB3b3JrYXJvdW5kLCBzaW1wbHkgYWxsb3cgdG8gZm9yd2FyZCANCjxicj50aGVt
IHdpdGggdGhpcyBwYXRjaDoNCjxicj4NCjxicj48YSBocmVmPSJodHRwczovL2dpdGh1Yi5jb20v
bGZkL2phaWxob3VzZS9jb21taXQvM2E4OGIwYjM3MWFlYjY0OWJjNDk2ZDhjMjcyYjVkM2FiNWRl
Mzk4MiIgdGFyZ2V0PSJfYmxhbmsiIHJlbD0ibm9mb2xsb3ciIGRhdGEtc2FmZXJlZGlyZWN0dXJs
PSJodHRwczovL3d3dy5nb29nbGUuY29tL3VybD9obD1lbiZhbXA7cT1odHRwczovL2dpdGh1Yi5j
b20vbGZkL2phaWxob3VzZS9jb21taXQvM2E4OGIwYjM3MWFlYjY0OWJjNDk2ZDhjMjcyYjVkM2Fi
NWRlMzk4MiZhbXA7c291cmNlPWdtYWlsJmFtcDt1c3Q9MTY5NDQ4NDE1ODM5NjAwMCZhbXA7dXNn
PUFPdlZhdzI2SFVPYktJRTl0a1d3WHhDUDlBNnkiPmh0dHBzOi8vZ2l0aHViLmNvbS9sZmQvamFp
bGhvdXNlL2NvbW1pdC8zYTg4YjBiMzcxYWViNjQ5YmM0OTZkOGMyNzJiNWQzYWI1ZGUzOTgyPC9h
Pg0KPGJyPg0KPGJyPiAgIFJhbGYNCjxicj4NCjxicj4mZ3Q7IA0KPGJyPiZndDsgLS0gDQo8YnI+
Jmd0OyBZb3UgcmVjZWl2ZWQgdGhpcyBtZXNzYWdlIGJlY2F1c2UgeW91IGFyZSBzdWJzY3JpYmVk
IHRvIHRoZSBHb29nbGUgDQo8YnI+Jmd0OyBHcm91cHMgJnF1b3Q7SmFpbGhvdXNlJnF1b3Q7IGdy
b3VwLg0KPGJyPiZndDsgVG8gdW5zdWJzY3JpYmUgZnJvbSB0aGlzIGdyb3VwIGFuZCBzdG9wIHJl
Y2VpdmluZyBlbWFpbHMgZnJvbSBpdCwgc2VuZCANCjxicj4mZ3Q7IGFuIGVtYWlsIHRvIDxhIGhy
ZWYgZGF0YS1lbWFpbC1tYXNrZWQgcmVsPSJub2ZvbGxvdyI+amFpbGhvdXNlLWRlLi4uQGdvb2ds
ZWdyb3Vwcy5jb208L2E+IA0KPGJyPiZndDsgJmx0O21haWx0bzo8YSBocmVmIGRhdGEtZW1haWwt
bWFza2VkIHJlbD0ibm9mb2xsb3ciPmphaWxob3VzZS1kZS4uLkBnb29nbGVncm91cHMuY29tPC9h
PiZndDsuDQo8YnI+Jmd0OyBUbyB2aWV3IHRoaXMgZGlzY3Vzc2lvbiBvbiB0aGUgd2ViIHZpc2l0
IA0KPGJyPiZndDsgPGEgaHJlZj0iaHR0cHM6Ly9ncm91cHMuZ29vZ2xlLmNvbS9kL21zZ2lkL2ph
aWxob3VzZS1kZXYvMjA0YTVmMzMtNTFlMy00ODJhLTk1ZTUtMTQ5NDFjODcxNTRkbiU0MGdvb2ds
ZWdyb3Vwcy5jb20iIHRhcmdldD0iX2JsYW5rIiByZWw9Im5vZm9sbG93IiBkYXRhLXNhZmVyZWRp
cmVjdHVybD0iaHR0cHM6Ly93d3cuZ29vZ2xlLmNvbS91cmw/aGw9ZW4mYW1wO3E9aHR0cHM6Ly9n
cm91cHMuZ29vZ2xlLmNvbS9kL21zZ2lkL2phaWxob3VzZS1kZXYvMjA0YTVmMzMtNTFlMy00ODJh
LTk1ZTUtMTQ5NDFjODcxNTRkbiUyNTQwZ29vZ2xlZ3JvdXBzLmNvbSZhbXA7c291cmNlPWdtYWls
JmFtcDt1c3Q9MTY5NDQ4NDE1ODM5NjAwMCZhbXA7dXNnPUFPdlZhdzJGV2Z0b3pSNmdhMk5oamlO
ME52T1QiPmh0dHBzOi8vZ3JvdXBzLmdvb2dsZS5jb20vZC9tc2dpZC9qYWlsaG91c2UtZGV2LzIw
NGE1ZjMzLTUxZTMtNDgyYS05NWU1LTE0OTQxYzg3MTU0ZG4lNDBnb29nbGVncm91cHMuY29tPC9h
PiAmbHQ7PGEgaHJlZj0iaHR0cHM6Ly9ncm91cHMuZ29vZ2xlLmNvbS9kL21zZ2lkL2phaWxob3Vz
ZS1kZXYvMjA0YTVmMzMtNTFlMy00ODJhLTk1ZTUtMTQ5NDFjODcxNTRkbiU0MGdvb2dsZWdyb3Vw
cy5jb20/dXRtX21lZGl1bT1lbWFpbCZhbXA7dXRtX3NvdXJjZT1mb290ZXIiIHRhcmdldD0iX2Js
YW5rIiByZWw9Im5vZm9sbG93IiBkYXRhLXNhZmVyZWRpcmVjdHVybD0iaHR0cHM6Ly93d3cuZ29v
Z2xlLmNvbS91cmw/aGw9ZW4mYW1wO3E9aHR0cHM6Ly9ncm91cHMuZ29vZ2xlLmNvbS9kL21zZ2lk
L2phaWxob3VzZS1kZXYvMjA0YTVmMzMtNTFlMy00ODJhLTk1ZTUtMTQ5NDFjODcxNTRkbiUyNTQw
Z29vZ2xlZ3JvdXBzLmNvbT91dG1fbWVkaXVtJTNEZW1haWwlMjZ1dG1fc291cmNlJTNEZm9vdGVy
JmFtcDtzb3VyY2U9Z21haWwmYW1wO3VzdD0xNjk0NDg0MTU4Mzk2MDAwJmFtcDt1c2c9QU92VmF3
MVZuWDFILXpWYVFvbk9VQXdYcDNsRSI+aHR0cHM6Ly9ncm91cHMuZ29vZ2xlLmNvbS9kL21zZ2lk
L2phaWxob3VzZS1kZXYvMjA0YTVmMzMtNTFlMy00ODJhLTk1ZTUtMTQ5NDFjODcxNTRkbiU0MGdv
b2dsZWdyb3Vwcy5jb20/dXRtX21lZGl1bT1lbWFpbCZhbXA7dXRtX3NvdXJjZT1mb290ZXI8L2E+
Jmd0Oy4NCjxicj48L2Jsb2NrcXVvdGU+PC9kaXY+DQoNCjxwPjwvcD4KCi0tIDxiciAvPgpZb3Ug
cmVjZWl2ZWQgdGhpcyBtZXNzYWdlIGJlY2F1c2UgeW91IGFyZSBzdWJzY3JpYmVkIHRvIHRoZSBH
b29nbGUgR3JvdXBzICZxdW90O0phaWxob3VzZSZxdW90OyBncm91cC48YnIgLz4KVG8gdW5zdWJz
Y3JpYmUgZnJvbSB0aGlzIGdyb3VwIGFuZCBzdG9wIHJlY2VpdmluZyBlbWFpbHMgZnJvbSBpdCwg
c2VuZCBhbiBlbWFpbCB0byA8YSBocmVmPSJtYWlsdG86amFpbGhvdXNlLWRldit1bnN1YnNjcmli
ZUBnb29nbGVncm91cHMuY29tIj5qYWlsaG91c2UtZGV2K3Vuc3Vic2NyaWJlQGdvb2dsZWdyb3Vw
cy5jb208L2E+LjxiciAvPgpUbyB2aWV3IHRoaXMgZGlzY3Vzc2lvbiBvbiB0aGUgd2ViIHZpc2l0
IDxhIGhyZWY9Imh0dHBzOi8vZ3JvdXBzLmdvb2dsZS5jb20vZC9tc2dpZC9qYWlsaG91c2UtZGV2
L2E3YzEzMmUxLTM3MDAtNDlmYy1iNGFlLWNhOTU1N2IxYmYwZW4lNDBnb29nbGVncm91cHMuY29t
P3V0bV9tZWRpdW09ZW1haWwmdXRtX3NvdXJjZT1mb290ZXIiPmh0dHBzOi8vZ3JvdXBzLmdvb2ds
ZS5jb20vZC9tc2dpZC9qYWlsaG91c2UtZGV2L2E3YzEzMmUxLTM3MDAtNDlmYy1iNGFlLWNhOTU1
N2IxYmYwZW4lNDBnb29nbGVncm91cHMuY29tPC9hPi48YnIgLz4K
------=_Part_16139_1155828466.1694397805713--

------=_Part_16138_1427601346.1694397805713--
